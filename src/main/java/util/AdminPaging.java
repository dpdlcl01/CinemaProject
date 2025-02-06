package util;

public class AdminPaging {
    private int nowPage;      // 현재 페이지 번호
    private int numPerPage;   // 한 페이지당 게시물 수
    private int totalRecord;  // 전체 게시물 수
    private int totalPage;    // 전체 페이지 수

    private int pagePerBlock; // 한 블록당 페이지 수
    private int startPage;    // 현재 블록의 시작 페이지 번호
    private int endPage;      // 현재 블록의 끝 페이지 번호

    private int begin;

    public AdminPaging(int numPerPage, int pagePerBlock) {
        this.numPerPage = numPerPage;
        this.pagePerBlock = pagePerBlock;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
        this.totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
    }

    public void setNowPage(int nowPage) {
        this.nowPage = nowPage;

        begin = (nowPage - 1) * numPerPage;
        if (begin < 0) {
            begin = 0;
        }

        startPage = ((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
        endPage = startPage + pagePerBlock - 1;

        if (endPage > totalPage) {
            endPage = totalPage;
        }
    }

    public int getBegin() { return begin; }
    public int getNumPerPage() { return numPerPage; }

    public int getStartPage() { return startPage; }
    public int getEndPage() { return endPage; }

    public int getNowPage() { return nowPage; }
}
