const log = console.log;

class Delete {
    constructor(no, writerId, video) {
        this.no = no;
        this.writerId = writerId;
        this.video = video;
        this.urlParams = new URLSearchParams(window.location.search);
        this.type = this.urlParams.get('type');

        this.addEvent();
    }

    addEvent() {
        const { no, type, writerId, video } = this;

        // 글 삭제 버튼 이벤트
        $("#delete-btn").on("click", e => {
            if (!confirm('정말 삭제하시겠습니까?')) return;

            $.ajax({
                url: '/SportsBoard/board/delete',
                type: "POST",
                data: { no, type, writerId, video },
                success: e => {
                    if (video) location.href = `/SportsBoard/board/video/list?type=${type}`;
                    else location.href = `/SportsBoard/board/list?type=${type}&p=1`;
                },
                error: (req, err) => {
                    console.log(req.status, err);
                    if (video) location.href = `/SportsBoard/board/video/view?type=${type}&id=${no}`;
                    else location.href = `/SportsBoard/board/view?type=${type}&id=${no}`;
                }
            });
        });
    }
}