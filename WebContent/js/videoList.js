const log = console.log;

class VideoList {
    constructor(list) {
        this.list = list;

        this.init();
    }

    init() {
        const { list } = this;

        if (list.length < 1) {
            alert('해당 페이지에 게시된 영상이 없습니다.');
            return history.back();
        }

        list.forEach(video => {
            this.renderList(video);
        });
    }

    renderList(video) {
        const urlParams = new URLSearchParams(window.location.search);
        const type = urlParams.get('type');
        const listDom = document.querySelector("#video-list");
        log(video);
        const arr = video.imageSrc.split('/');
        const div = document.createElement('div');
        div.classList.add("video-box");
        div.innerHTML =
            `<div class="video-image">
                <img src="${video.imageSrc}" alt="${arr[arr.length - 1]}">
                <div class="video-time">${video.videoTime}
            </div>
            <div class="video-text">
                <h5 class="video-title">
                    <a href="/SportsBoard/board/videoView?type=${type}&id=${video.vCode}">${video.title}</a>
                </h5>
                <div class="view-date">
                    <div class="video-view">▷ ${(video.views).toLocaleString()}</div>
                    <div class="video-date">${video.vDate}</div>
                </div>
            </div>`;

        listDom.appendChild(div);
    }
}