const log = console.log;

class Delete {
    constructor(no, writerId) {
        this.no = no;
        this.writerId = writerId;
        this.urlParams = new URLSearchParams(window.location.search);
        this.type = this.urlParams.get('type');

        this.addEvent();
    }

    addEvent() {
        const { no, type, writerId } = this;

        // 글 삭제 버튼 이벤트
        $("#delete-btn").on("click", e => {
            if (!confirm('정말 삭제하시겠습니까?')) return;

            $.ajax({
                url: '/SportsBoard/board/delete',
                type: "POST",
                data: { no, type, writerId },
                success: e => {
                    location.href = `/SportsBoard/board/list?type=${type}&p=1`;
                },
                error: (req, err) => {
                    console.log(req.status, err);
                    location.href = `/SportsBoard/board/view?type=${type}&id=${no}`;
                }
            });
        });
    }
}