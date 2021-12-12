const log = console.log;

class Main {
    constructor(teamList = '', playerList = '') {
        this.mainBoard = document.querySelector("#photo");
        this.teamList = teamList.split(', ');
        this.playerList = playerList.split(', ');
        this.getBList = [];
        this.getVList = [];

        this.init();
    }

    init() {
        this.teamList = [...new Set(this.teamList)].splice(0, 5);
        this.playerList = [...new Set(this.playerList)].splice(0, 5);

        this.mainImgRender();
        this.addEvent();
        this.getTeamList();
        this.getPlayerList();
    }

    addEvent() {
        $("#tex-btn").on("click", e => {
            $("#tex-btn").parent().parent().children('.ex-box').css({ 'display': 'block' });
        });

        $("#pex-btn").on("click", e => {
            $("#pex-btn").parent().parent().children('.ex-box').css({ 'display': 'block' });
        });

        $(".close-exbox").on("click", e => {
            $(".ex-box").css({ 'display': 'none' });
        });
    }

    getTeamList() {
        const { teamList } = this;

        if (teamList == "") return;
        $.ajax({
            url: '/SportsBoard/main/list',
            type: 'POST',
            data: { type: 'team', list: teamList },
            success: e => {
                this.getBList = this.getJson(e, ".blist");
                const teams = document.querySelector(".teams>ul");
                teams.innerHTML = "";
                this.teamsRender(this.teamList, teams, "team");
            }
        });
    }

    getPlayerList() {
        const { playerList } = this;

        if (playerList == "") return;
        $.ajax({
            url: '/SportsBoard/main/list',
            type: 'POST',
            data: { type: 'player', list: playerList },
            success: e => {
                this.getVList = this.getJson(e, ".vlist");
                const players = document.querySelector(".players>ul");
                players.innerHTML = "";
                this.teamsRender(this.playerList, players, "player");
            }
        });
    }

    teamsRender(list, dom, tp) {
        for (let i = 0; i < list.length; i++) {
            const li = document.createElement("li");
            li.dataset.tp = tp;
            li.innerHTML = list[i];
            dom.appendChild(li);
            li.addEventListener("click", e => {
            	$(e.target).parent().children("li").removeClass("selected");
            	$(e.target).addClass("selected");
            	this.getList(e.target);
            });
            if (i == 0) {
                li.classList.add("selected");
                setTimeout(() => { li.click(); }, 10);
            }
        }
    }

    getList(e) {
        const key = e.innerText;
        const { getBList, getVList } = this;
        const list = [];

        getBList.forEach(b => {
            if (b.teamList.indexOf(key) != -1) list.push(b);
            if (b.playerList.indexOf(key) != -1) list.push(b);
        });

        getVList.forEach(b => {
            if (b.teamList.indexOf(key) != -1) list.push(b);
            if (b.playerList.indexOf(key) != -1) list.push(b);
        });

        list.sort((a, b) => b.wCode - a.wCode);

        this.listRender(list, e.dataset.tp);
    }
    
    listRender(list, tp) {
    	log(list);
    	log(tp);

        const teamNews = document.querySelector(".team-news-list");
        const playerNews = document.querySelector(".player-news-list");

        list.forEach(li => {
            const dom = document.createElement("a");
            dom.href = '/SportsBoard'
        });
    }

    getJson(e, dom) {
        const div = document.createElement("div");
        div.innerHTML = e;
        let list = JSON.parse(div.querySelector(dom).innerHTML);

        return list;
    }

    mainImgRender() {
        const { mainBoard } = this;
        try {
            const img = mainBoard.querySelector("img");
            img.style = "";
            img.width = "";
            const text = mainBoard.querySelector(".text");
            mainBoard.innerHTML = "";
            mainBoard.append(img);
            mainBoard.append(text);
            mainBoard.style.display = 'block';
        } catch (err) { }
    }
}