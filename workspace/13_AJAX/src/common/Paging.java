package common;

public class Paging {

	public static String getPaging(String path ,int totalRecord,int recordPerPage,
			int pagePerBlock, int page) {
		// totalPage
		int totalPage = totalRecord / recordPerPage;
		if(totalRecord % recordPerPage != 0)
			totalPage++;
		// beginPage
		int beginPage = ((page - 1) / pagePerBlock) * pagePerBlock + 1;
		// endPage
		int endPage = beginPage + pagePerBlock - 1;
		if (endPage > totalPage)
			endPage = totalPage;
		// paging 만들기
		StringBuilder str = new StringBuilder();
		/* ◁ 또는 ◀ */
		if (beginPage == 1) {
			str.append("◁");
		} else {
			str.append("<a onclick=\"").append(path).append("(").append(beginPage - 1).append(")\">◀</a>");
		}
		str.append("&nbsp;");
		/* 1 2 3 4 5 */
		for (int i = beginPage; i <= endPage; i++) {
			str.append("&nbsp;");
			if( page == i ) {
				str.append("<span class=\"now_page\">").append(i).append("</span>");
			} else {
				str.append("<a onclick=\"").append(path).append("(").append(i).append(")\">").append(i).append("</a>");
			}
			str.append("&nbsp;");
		}
		/* ▷ 또는 ▶ */
		str.append("&nbsp;");
		if (endPage == totalPage) {
			str.append("▷");
		} else {
			str.append("<a onclick=\"").append(path).append("(").append(endPage + 1).append(")\">▶</a>");
		}
		
		return str.toString();
	}

	public static String getPaging(String path ,int totalRecord,int recordPerPage,
			 int page) {
		return getPaging(path, totalRecord, recordPerPage, 5, page);
	}

	public static String getPaging(String path ,int totalRecord,
			int page) {
		return getPaging(path, totalRecord, 10, 5, page);
	}
}
