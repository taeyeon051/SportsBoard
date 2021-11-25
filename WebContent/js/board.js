const log = console.log;

class Board {
    constructor(list) {
        this.boardList = list;

        this.init();
    }

    init() {
        const { boardList } = this;
        boardList.forEach(board => {
            this.renderList(board);
        });
    }

    renderList(board) {
        const urlParams = new URLSearchParams(window.location.search);
        const type = urlParams.get('type');
        const listDom = document.querySelector("#board-list");

        const content = board.content;
        const img = this.getImg(content);
        const contentText = this.getContentText(content);
        
        const div = document.createElement("div");
        div.classList.add("news-box");
        div.innerHTML =
            `<img src="/SportsBoard/upload/${img}" alt="${img}">
            <div class="news-text">
                <h5 class="news-title"><a href="/SportsBoard/board/view?type=${type}&id=${board.wCode}">${board.title}</a></h5>
                <a href="/SportsBoard/board/view?type=${type}&id=${board.wCode}" class="news-content">${contentText.trim()}</a>
                <div class="news-date">${board.wDate}</div>
            </div>`;

        listDom.appendChild(div);
    }

    getImg(content) {
        const div = document.createElement("div");
        div.innerHTML = content;
        const img = div.querySelector("img");
        return img.alt;
    }

    getContentText(content) {
        const div = document.createElement("div");
        div.innerHTML = content;
        div.querySelectorAll("img").forEach(img => { img.remove(); });
        return div.innerText;
    }
}