const log = console.log;

class Main {
    constructor(teamList = '', playerList = '') {
        this.mainBoard = document.querySelector("#photo");
        this.teamList = teamList.split(', ');
        this.playerList = playerList.split(', ');
        this.getTBList = [];
        this.getTVList = [];
        this.getPBList = [];
        this.getPVList = [];

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
                this.getTBList = this.getJson(e, ".blist");
                this.getTVList = this.getJson(e, ".vlist");
                log(this.getTBList);
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
                this.getPBList = this.getJson(e, ".blist");
                this.getPVList = this.getJson(e, ".vlist");
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
        const { getTBList, getTVList, getPBList, getPVList } = this;
        const list = [];

        if (e.dataset.tp == "team") {        	
        	getTBList.forEach(b => {
        		if (b.teamList.indexOf(key) != -1) list.push(b);
        		if (b.playerList.indexOf(key) != -1) list.push(b);
        	});
        	
        	getTVList.forEach(b => {
        		if (b.teamList.indexOf(key) != -1) list.push(b);
        		if (b.playerList.indexOf(key) != -1) list.push(b);
        	});
        } else {        	
        	getPBList.forEach(b => {
        		if (b.teamList.indexOf(key) != -1) list.push(b);
        		if (b.playerList.indexOf(key) != -1) list.push(b);
        	});
        	
        	getPVList.forEach(b => {
        		if (b.teamList.indexOf(key) != -1) list.push(b);
        		if (b.playerList.indexOf(key) != -1) list.push(b);
        	});
        }

        list.sort((a, b) => { return (b.wCode !== undefined ? b.wCode : b.vCode) - (a.wCode !== undefined ? a.wCode : a.vCode) });

        this.listRender(list.splice(0, 4), e.dataset.tp);
    }
    
    listRender(list, tp) {
        const teamNews = document.querySelector(".team-news-list");
        const playerNews = document.querySelector(".player-news-list");
        if (tp == "team") teamNews.innerHTML = "";
        else if (tp == "player") playerNews.innerHTML = "";

        list.forEach(li => {
            const dom = document.createElement("a");
            if (li.wCode !== undefined) dom.href = `/SportsBoard/board/view?type=${li.wType}&id=${li.wCode}`;
            else if (li.vCode !== undefined) dom.href = `/SportsBoard/board/video/view?type=${li.vType}&id=${li.vCode}`;

            dom.classList.add(`${tp}-news`);
            if (li.wCode !== undefined) dom.innerHTML = this.getwText(li, tp);
            else if (li.vCode !== undefined) dom.innerHTML = this.getvText(li, tp);

            if (tp == "team") teamNews.appendChild(dom);
            else if (tp == "player") playerNews.appendChild(dom);
        });
    }

    getwText(li, tp) {
        const content = document.createElement("div");
        content.innerHTML = li.content;

        const img = content.querySelector("img");
        return (
            `<img src="${img.src}">
            <div class="${tp}-news-text">
                <div class="${tp}-news-title">${li.title}</div>
                <div class="${tp}-news-date">${li.writerName} · ${li.wDate.substr(0, 10)}</div>
            </div>`
        );
    }
    
    getvText(li, tp) {
        return (
            `<img src="${li.imageSrc}">
            <div class="${tp}-news-text">
                <div class="${tp}-news-title">${li.title}</div>
                <div class="video-num d-flex">
                    <span class="video-num-icon">▷</span>
                    <div class="video-num-time">
                        <b>${li.views}</b> · ${li.vDate.substr(0, 10)}
                    </div>
                </div>
            </div>`
        );
    }

    getJson(e, dom) {
        const div = document.createElement("div");
        div.innerHTML = e;
        let list = JSON.parse(div.querySelector(dom).innerHTML);
        return [...new Set(list.map(JSON.stringify))].map(JSON.parse);
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