package util;

public class Paging {
    int nowPage = 1; // 현재 페이지 값 == 파라미터 이름은 cPage (Current Page)
    int numPerPage = 10; // 한 페이지당 보여질 게시물의 수
    
    // 페이징을 위한 변수
    int totalRecord; // 총 게시물의 수

    int pagePerBlock = 5; // 한 블럭당 표현할 페이지 수
    int totalPage; // 전체 페이지 수

    int begin; // 현재 페이지 값에 따라 bbs_t 테이블에서 가져올 게시물의 시작 행 번호
    int end; // 현재 페이지 값에 따라 bbs_t 테이블에서 가져올 게시물의 마지막 행 번호

    int startPage; // 한 블럭의 시작 페이지 값
    int endPage; // 한 블럭의 끝 페이지 값


    // 현재 객체를 생성할 때 기본 생성자를 부르면
    // 한 페이지당 게시물을 10개씩 보여주는 페이징 처리를 한다.
    public Paging(){}

    // 만약 페이지당 게시물 수를 다르게 보고 싶다면 .. 페이지 블럭의 수를 다르게 설정하고 싶다면 ..
    // 생성자에서 처리하면 된다. (멤버변수에 대한 초기화를 담당하므로)
    public Paging(int numPerPage, int pagePerBlock){
        this.numPerPage = numPerPage;
        this.pagePerBlock = pagePerBlock;
    }


    // getter, setter
    public int getNowPage() {
        return nowPage;
    }

    public void setNowPage(int nowPage) {
        this.nowPage = nowPage;

        // 현재 페이지 값이 변경되면 표현할 게시물들이 변경되어야 한다.
        // 즉, begin과 end값이 변경되어 DB로부터 다시 게시물들을 가져와야 함!

        // 현재 페이지 값은 전체 페이지 값을 넘지 못하도록 하자!
        if(nowPage > totalPage)
            nowPage = totalPage;

        // 각 페이지의 시작 행번호(begin)와 마지막 행번호(end)를 구한다.
        begin = (nowPage-1)*numPerPage+1;
        end = nowPage*numPerPage;

        // 현재 페이지 값에 의해 블럭의 시작 페이지(startPage)를 구하자
        startPage = (int)((nowPage-1)/pagePerBlock)*pagePerBlock+1;

        // 블럭의 마지막 페이지값 구하기
        endPage = startPage + pagePerBlock - 1;

        // 위에서 구한 마지막 페이지 값이 전체 페이지 수보다 클 때가 우려된다.
        if(endPage > totalPage)
            endPage = totalPage;
    }

    public int getNumPerPage() {
        return numPerPage;
    }

    public void setNumPerPage(int numPerPage) {
        this.numPerPage = numPerPage;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    // 총 게시물 수가 지정될 때 자동으로 전체 페이지 수를 구하면 좋을 것 같다.
    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;

        // 총 게시물 수가 지정되었으니 전체 페이지 수를 구하자!
                    // 단 ceil은 double형으로 계산하므로 계산시에 double로 캐스팅하고, 그 결과값은 반대로 int로 캐스팅한다.
        this.totalPage = (int) Math.ceil((double)totalRecord/numPerPage);
    }

    public int getPagePerBlock() {
        return pagePerBlock;
    }

    public void setPagePerBlock(int pagePerBlock) {
        this.pagePerBlock = pagePerBlock;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getBegin() {
        return begin;
    }

    public void setBegin(int begin) {
        this.begin = begin;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }
}
