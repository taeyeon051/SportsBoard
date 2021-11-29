const log = console.log;

class Board {
    constructor(list) {
        this.boardList = list;
        this.urlParams = new URLSearchParams(window.location.search);

        this.init();
    }

    init() {
        const { boardList, urlParams } = this;

        if (boardList.length < 1) {
            alert('해당 페이지에 게시된 글이 없습니다.');
            return history.back();
        }

        boardList.forEach(board => {
            this.renderList(board);
        });
    }

    renderList(board) {
        const { urlParams } = this;
        const type = urlParams.get('type');
        const listDom = document.querySelector("#board-list");
        
        const content = board.content;
        const img = this.getImg(content);
        $(img).attr({'style': '', 'width': '', 'height': ''});
        const contentText = this.getContentText(content);
        
        const div = document.createElement("div");
        div.classList.add("news-box");
        div.appendChild(img);
        div.innerHTML +=
            `<div class="news-text">
                <h5 class="news-title"><a href="/SportsBoard/board/view?type=${type}&id=${board.wCode}">${board.title}</a></h5>
                <a href="/SportsBoard/board/view?type=${type}&id=${board.wCode}" class="news-content">${contentText.trim()}</a>
                <div class="news-date">${board.wDate} · ${board.writerName}</div>
            </div>`;

        listDom.appendChild(div);
    }

    getImg(content) {
        const div = document.createElement("div");
        div.innerHTML = content;
        const img = div.querySelector("img");
        return img;
    }

    getContentText(content) {
        const div = document.createElement("div");
        div.innerHTML = content;
        div.querySelectorAll('figure').forEach(f => { f.remove(); });
        div.querySelectorAll("img").forEach(img => { img.remove(); });
        return div.innerText;
    }
}