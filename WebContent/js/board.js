const log = console.log;

class Board {
    constructor(list, url) {
        this.boardList = list;
        this.url = url;

        this.init();
    }

    init() {
        const { boardList } = this;
        boardList.forEach(board => {
            log(board);
            this.renderList(board);
        });
    }

    renderList(board) {
        const { url } = this;
        const listDom = document.querySelector("#board-list");

        const content = board.content;
        const img = this.getImg(content);
        const contentText = this.getContentText(content);
        
        const div = document.createElement("div");
        div.classList.add("news-box");
        div.innerHTML =
            `<img src="/SportsBoard/upload/${img}" alt="${img}">
            <div class="news-text">
                <h5 class="news-title"><a href="./view.html">${board.title}</a></h5>
                <a href="./view.html" class="news-content">${contentText}</a>
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
        content.replace(/([/][가-힣.\s]{2,}[/])/g, /([가-힣.\s]{2,})/g);

        const div = document.createElement("div");
        div.innerHTML = content;
        div.querySelectorAll("img").forEach(img => { img.remove(); });
        return div.innerHTML;
    }
}