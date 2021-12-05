const log = console.log;

window.onload = () => {
    const video = new Video();
}

class Video {
    constructor() {
        this.teamList = [];
        this.teamDomList = [];
        this.playerList = [];
        this.playerDom = [];
        this.imageName = "";
        this.videoName = "";

        this.init();
    }

    init() {
        this.teamDomList = document.querySelectorAll(".team-list>.btn");
        this.playerDom = document.querySelectorAll(".player-list");

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

        // 영상 업로드 설명 팝업
        $("#ex-btn").on("click", e => {
            $(".ex-box").css({ 'display': 'flex' });
        });

        $(".close-exbox").on("click", e => {
            $(".ex-box").css({ 'display': 'none' });
        });

        // 제목에 선수 태그
        document.querySelector("#title").addEventListener("input", e => {
            this.playerCheck();
        });

        // 썸네일 이미지 삽입
        $("#thumbnail-image").on("change", e => {
            const file = e.target.files[0];
            this.imageName = "";
            if (file != null && file.type.split('/')[0] != "image") {
                alert('이미지 파일을 선택해 주세요.');
                e.target.value = "";
                return;
            }

            if (file.length < 1) return;

            this.uploadFile(file, $("#img-form")[0]);
        });

        // 영상 업로드
        $("#video-file").on("change", e => {
            const file = e.target.files[0];
            this.videoName = "";
            if (file != null && file.type.split('/')[1] != "mp4") {
                alert('mp4 파일을 선택해 주세요.');
                e.target.value = "";
                return;
            }

            if (file.length < 1) return;

            this.uploadFile(file, $("#video-form")[0]);
        });

        // 업로드 버튼 이벤트
        $("#upload-btn").on("click", e => {
            const { imageName: image, videoName: video} = this;
            if ($("#title").val().trim() === "") return alert('제목을 입력해주세요.');
            if (image == "" || video == "") return alert('영상 혹은 썸네일 이미지가 없습니다.');

            const data = this.getFormData();
            const urlParams = new URLSearchParams(window.location.search);
            data.type = urlParams.get('type');

            $.ajax({
                url: '/SportsBoard/board/upload',
                type: 'POST',
                data: data,
                success: e => {
                    location.href = `/SportsBoard/board/videoList?type=${data.type}&p=1`;
                },
                error: e => {
                    history.back();
                }
            });
        });
    }

    uploadFile(file, form) {
        const formData = new FormData(form);
        const type = file.type.split('/')[0];
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

                const fileName = e.trim();
                if (type == "image") {
                    this.makeImgDom(fileName);
                    this.imageName = `/SportsBoard/upload/${fileName}`;
                } else if (type == "video") {
                    this.videoName = `/SportsBoard/upload/${fileName}`;
                }
            },
            error: (req, err) => {
                log(req.status, err);
                alert('파일 업로드 중 오류가 발생하였습니다.');
            }
        });
    }

    makeImgDom(filename) {
        const imgDom = document.querySelector(".thumbnail-image");

        const img = document.createElement("img");
        img.src = `/SportsBoard/upload/${filename}`;
        img.alt = filename;

        imgDom.appendChild(img);
    }

    // 제목에 선수 이름이 있는지 체크
    playerCheck() {
        this.playerList = [];
        const title = $("#title").val();
        const conReg = /([/][가-힣.\s]{2,}[/])/g;
        let players = [];
        if (title.match(conReg) != null) players = title.match(conReg);

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

    getFormData() {
        const { teamList, playerList, imageName, videoName } = this;

        let title = document.querySelector("#title").value;
        playerList.forEach(p => { title = title.replace(`/${p}/`, p); });

        const formData = {};
        formData.title = title;
        formData.imageName = imageName;
        formData.videoName = videoName;
        formData.teamList = JSON.stringify(teamList);
        formData.playerList = JSON.stringify(playerList);

        return formData;
    }
}