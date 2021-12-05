const log = console.log;

window.onload = () => {
    const write = new Write();
}

class Write {
    constructor(board = null) {
        this.teamList = [];
        this.teamDomList = [];
        this.playerList = [];
        this.playerDom = [];
        this.board = board;

        this.init();
    }

    init() {
        this.teamDomList = document.querySelectorAll(".team-list>.btn");
        this.playerDom = document.querySelectorAll(".player-list");

        if (this.board != null) this.boardRender();
        this.addEvent();
    }

    addEvent() {
        const { teamDomList } = this;

        // 팀 선택 이벤트
        $(teamDomList).on("click", e => {
            const team = e.target;
            if ($(team).hasClass("active")) {
                team.classList.remove("active");
                this.teamList.splice(this.teamList.indexOf(team.innerText), 1);
            } else {
                team.classList.add("active");
                this.teamList.push(team.innerText);
            }
        });

        // 글 템플릿
        $(".form-button-box>.btn").on("click", e => {
            document.execCommand(e.currentTarget.dataset.property);
            $("#content").focus();
        });

        $(".clr").on("click", e => {
            $("#color-input").click();
        });

        $("#color-input").on("change", e => {
            document.execCommand("foreColor", false, e.target.value);
            $("#content").focus();
        });

        // 글 작성 설명 팝업
        $("#ex-btn").on("click", e => {
            $(".ex-box").css({ 'display': 'flex' });
        });

        $(".close-exbox").on("click", e => {
            $(".ex-box").css({ 'display': 'none' });
        });

        // 글 작성
        window.addEventListener("keydown", e => {
            if (document.activeElement.id == "content") {
                setTimeout(() => {
                    if ($("#content").html().includes("/")) this.playerCheck();
                }, 0);
            }
        });

        // 글 작성 버튼 이벤트
        $("#write-btn").on("click", e => {
            if ($("#title").val().trim() === "") return alert('제목을 입력해주세요.');
            if ($("#content").html().trim() === "") return alert('내용을 입력해주세요.');

            const data = this.getFormData();
            const urlParams = new URLSearchParams(window.location.search);
            data.type = urlParams.get('type');

            $.ajax({
                url: '/SportsBoard/board/write',
                type: "POST",
                data: data,
                success: e => {
                    location.href = `/SportsBoard/board/list?type=${data.type}&p=1`;
                },
                error: e => {
                    history.back();
                }
            });
        });

        // 글 수정 버튼 이벤트
        $("#modify-btn").on("click", e => {
            if ($("#title").val().trim() === "") return alert('제목을 입력해주세요.');
            if ($("#content").html().trim() === "") return alert('내용을 입력해주세요.');

            const data = this.getFormData();
            const urlParams = new URLSearchParams(window.location.search);
            data.id = urlParams.get('id');
            data.type = urlParams.get('type');
            data.writerId = this.board.writerId;

            $.ajax({
                url: '/SportsBoard/board/modify',
                type: "POST",
                data: data,
                success: e => {
                    location.href = `/SportsBoard/board/list?type=${data.type}&p=1`;
                },
                error: e => {
                    history.back();
                }
            });
        });

        // 이미지 삽입
        $("#form-file").on("change", e => {
            const file = e.target.files[0];
            if (file != null && file.type.split("/")[0] != "image") {
                alert("이미지 파일을 선택해 주세요.");
                e.target.value = "";
                return;
            }

            if (file.length < 1) return;

            this.uploadFile();
        });

        $("#form-image-add").on("click", e => {
            const input = document.querySelector("#form-file");
            input.click();
        });
    }

    uploadFile() {
        const formData = new FormData($("#img-form")[0]);
        $.ajax({
            url: '/SportsBoard/view/fileupload.jsp',
            type: 'POST',
            enctype: 'multipart/form-data',
            data: formData,
            dataType: 'html',
            contentType: false,
            processData: false,
            success: e => {
                if (e.trim() == "오류") return alert("파일 업로드 중 오류 발생.");
                this.makeImgDom(e.trim());
            },
            error: (req, err) => {
                log(req.status, err);
                alert('파일 업로드 중 오류가 발생하였습니다.');
            }
        });
    }

    // 내용에 선수 이름이 있는지 체크
    playerCheck() {
        this.playerList = [];
        const content = $("#content").html();
        const conReg = /([/][가-힣.\s]{2,}[/])/g;
        let players = [];
        if (content.match(conReg) != null) players = content.match(conReg);

        players.forEach(pl => this.playerList.push(pl.replace(/\//g, "")));
        this.playerList = Array.from(new Set(this.playerList));

        this.playerListRender();
    }

    // 선수 목록 그려주는 함수
    playerListRender() {
        const { playerList } = this;
        const plDom = document.querySelector(".player-list");
        plDom.innerHTML = "";

        playerList.forEach(pl => {
            const li = document.createElement("li");
            li.classList.add("list-group-item");
            li.innerHTML = pl;
            plDom.appendChild(li);
        });
    }

    makeImgDom(filename) {
        const content = document.querySelector("#content");

        const img = document.createElement("img");
        img.classList.add("content-img");
        img.src = `/SportsBoard/upload/${filename}`;
        img.alt = filename;

        content.appendChild(img);
    }

    getFormData() {
        const { teamList, playerList } = this;

        const div = document.createElement("div");
        div.innerHTML = $("#content").html();
        let content = div.innerHTML;
        playerList.forEach(p => { content = content.replace(`/${p}/`, p); });

        const formData = {};
        formData.title = $("#title").val().trim();
        formData.content = content;
        formData.teamList = JSON.stringify(teamList);
        formData.playerList = JSON.stringify(playerList);

        return formData;
    }

    boardRender() {
        const { board, teamDomList } = this;
        const title = document.querySelector("#title");
        const content = document.querySelector("#content");
        const teamList = JSON.parse(board.teamList);
        const playerList = JSON.parse(board.playerList);

        title.value = board.title;
        content.innerHTML = board.content;
        this.teamList = teamList;
        this.playerList = playerList;

        teamList.forEach(team => {
            teamDomList.forEach(teamBtn => {
                if (teamBtn.innerHTML == team) {
                    teamBtn.classList.add("active");
                }
            });
        });

        this.playerListRender();
    }
}