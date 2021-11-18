const log = console.log;

window.onload = () => {
    const app = new App();
}

class App {
    constructor() {
        this.teamList = [];
        this.teamDomList = [];
        this.playerList = [];
        this.playerDom = [];

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
        	log(e);
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
        	const content = $("#content").html();
        	const title = $("#title").val();
            const { teamList, playerList } = this;

            return;
            $.ajax({
                url: '/SportsBoard/write',
                type: "POST",
                data: {},
                success: e => {
                    log(1);
                }
            });
        });
        
        // 이미지 삽입
        $("#form-file").on("change", e => {
            const file = e.target.files[0];
            if (file.type.split("/")[0] != "image") {
                alert("이미지 파일을 선택해 주세요.");
                e.target.value = "";
            }

            const reader = new FileReader();
            reader.onload = () => { this.makeImgDom(file.name, reader.result); };
            reader.readAsDataURL(file);
        });

        $("#form-image-add").on("click", e => {
        	const input = document.querySelector("#form-file");
        	input.click();
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
    
    makeImgDom(filename, src) {
        const content = document.querySelector("#content");

        const img = document.createElement("img");
        img.classList.add("content-img");
        img.src = src;
        img.alt = filename;

        content.appendChild(img);
    }
}