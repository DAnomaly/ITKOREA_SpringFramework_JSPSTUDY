package util.page;

class PageVO {
	
	private int totalRecord; 	// 전체 게시글의 개수
	private int totalPage; 		// 전체 페이지의 수
	private int recordPerPage; 	// 한 페이지당 게시글의 개수
	
	private int page;			// 현재 페이지 번호(기본 1페이지)
	private int beginRecord;	// 각 페이지에 표시되는 시작 게시글 번호
	private int endRecord; 		// 각 페이지에 표시되는 종료 게시글 번호
	
	private int pagePerBlock;	// 한 블록에 5개 페이지를 표시
	private int beginPage; 		// 각 블록에 표시되는 시작 페이지 번호
	private int endPage; 		// 각 블록에 표시되는 종료 페이지 번호
	
	int getTotalRecord() {
		return totalRecord;
	}
	void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	int getTotalPage() {
		return totalPage;
	}
	void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	int getRecordPerPage() {
		return recordPerPage;
	}
	void setRecordPerPage(int recordPerPage) {
		this.recordPerPage = recordPerPage;
	}
	int getPage() {
		return page;
	}
	void setPage(int page) {
		this.page = page;
	}
	int getBeginRecord() {
		return beginRecord;
	}
	void setBeginRecord(int beginRecord) {
		this.beginRecord = beginRecord;
	}
	int getEndRecord() {
		return endRecord;
	}
	void setEndRecord(int endRecord) {
		this.endRecord = endRecord;
	}
	int getPagePerBlock() {
		return pagePerBlock;
	}
	void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	int getBeginPage() {
		return beginPage;
	}
	void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	int getEndPage() {
		return endPage;
	}
	void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
}
