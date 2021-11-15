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

            log(this.teamList);
        });

        // 글 템플릿
        $(".form-button-box>.btn").on("click", e => {
            document.execCommand(e.currentTarget.dataset.property);
            $("#content").focus();
        });

        $(".clr").on("click", e => {
            $("#color_input").click();
        });

        $("#color_input").on("change", e => {
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
        		log($("#content").html());
        		this.playerCheck();
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
    }

    playerCheck() {
    	const content = $("#content").html();
    	const conReg = /(#[가-힣]{2,})/g;
    	if (content.match(conReg) != null) {
    		this.playerList = content.match(conReg);
    		log(this.playerList);
    	}
    	
    	this.playerList.forEach(p => {
    		
    	});
    }
}