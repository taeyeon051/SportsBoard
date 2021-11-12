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
    }
}