<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
	request.setCharacterEncoding("UTF-8");
%>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="게시글 작성" name="title"/>
</jsp:include>
<style>
	.hidden {
		display: none;
	}
	.content_form {
		width: 100%;
	}
	.content_form .title {
		width: 100%;
		height: 32px;
		padding: 5px;
	}
	.content_form .top {
		display: inline-block;
		font-size: 22px;	
	}
	.content_form .bottom {
		display: inline-block;
		margin-left: 6px;
		font-size: 14px;
		color: gray;
	}
	.content_form .title {
		border-bottom: 1px solid black;
	}
	.content_form .content {
		padding: 10px;
	}
	.content_form .content img {
		max-height: 200px;
	}
	.content_form pre.content {
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 14px;
		margin-top: 10px;
		padding: 0;
		width: 1040px;
		min-height: 320px;
		box-sizing: border-box;
		outline: none;
		resize: vertical;
	}
	.content_form .btn {
		padding: 10px 18px;
		margin: 5px;
		border: 0;
		background-color: #2E64FE;
		color: white;
		font-size: 15px;
	}
	.content_form .btn:hover {
		cursor: pointer;
	}
	form {
		display: inline-block;
	}
	#reply {
		display: block;
		width: 100%;
		height: 80px;
	}
	.write_reply textarea {
		width: 80%;
		height: 60px;
		margin: 5px;
		padding: 5px;
		box-sizing: border-box;
		float: left;
		resize: none;
	}
	.write_reply #rep_btn {
		width: 65px;
		height: 60px;
		box-sizing: border-box;
		margin-top: 5px;
		margin-left: 10px;
		float: left;
	}
	.replies .rep_box {
		width: 80%;
		height: 100px;
		padding: 5px;
		margin: 5px;
		margin-top: 10px;
		box-sizing: border-box;
		background-color: #909090;
		border-radius: 5px;
	}
	.replies .rep_author {
		margin-left: 15px;
		color: white;
		font-weight: bold;
	}
	.replies .date {
		color: #d0d0d0;
		font-size: 12px;
		font-weight: lighter;
	}
	.replies .rep_del {
		color: #d0d0d0;
		font-weight: lighter;
		margin-left: 15px;
	}
	.replies .rep_del:hover {
		color: #DF013A;
		cursor: pointer;
	}
	.replies .rep_content pre{
		width: 95%;
		height: 55px;
		background-color: #fff;
		margin-left: 5px;
		padding: 5px;
		box-sizing: border-box;
		border-radius: 3px;
	}
	
	
</style>
<script>
	function del_f(){
		if(confirm('삭제하시겠습니까?')){
			location.href="/10_MODEL2/deleteBoard.b?idx=${dto.idx}";
		}
	}
	function reply_f(){
		const reply = $('#reply');
		const rep_content = $('#rep_content');
		if(rep_content.val() == ''){
			alert('뎃글을 입력해 주세요.');
			return;
		}
		reply.submit();
	}
	function rep_del_f(idx,boardIdx){
		if(confirm('정말로 삭제 하시겠습니까?')){
			location.href = '/10_MODEL2/deleteReply.b?idx=' + idx +'&boardIdx=' + boardIdx;
		}
	}
</script>
<div class="content_form">
	<div class="main">
		<div class="title">
			<p class="top">
				<span class="hidden">제목</span>
				<span id="title">${dto.title}</span>
			</p>
			<p class="bottom">
				<span class="hidden">작성자</span>
				<span id="author" class="author">${dto.author}</span>
				<span class="hidden">작성일자</span>
				<span id="modified" class="modified">${dto.lastmodified}</span>
				<span class="hidden">방문자수</span>
				<span id="hit" class="hit">(${dto.hit})</span>					
			</p>
		</div>
		<div class="content">
			<p class="hidden">내용</p>
			<div>
				<img src="./archive/${dto.filename}" alt="${dto.filename}">
			</div>
			<pre id="content" class="content">${dto.content}</pre><br><br>
		</div>
	</div>
	<div class="reply">
		<span>댓글 개수: ${replyCnt}</span>
		<div class="write_reply">
			<form action="insertReply.b" id="reply" method="post">
			<c:if test="${empty loginDTO}">
				<textarea name="content" id="rep_content" placeholder="로그인 후에 작성하실 수 있습니다." disabled></textarea>
				<input type="button" id="rep_btn" value="작성하기" disabled/>
			</c:if>
			<c:if test="${not empty loginDTO}">
				<input type="hidden" name="boardIdx" value="${dto.idx}"/>
				<textarea name="content" id="rep_content" placeholder="소중한 댓글을 작성해 주세요."></textarea>
				<input type="button" id="rep_btn" value="작성하기" onclick="reply_f()"/>
			</c:if>
			</form>
		</div>
		<div class="replies">
			<ul>
			<c:forEach items="${replyList}" var="rep">
				<li class="rep_box">
					<ul>
						<li class="rep_author">
							${rep.author} <span class="date">${rep.postdate}</span>
							<c:if test="${loginDTO.id == rep.author}">
								<span class="rep_del" id="rep_del" onclick="rep_del_f(${rep.idx},${dto.idx})">삭제</span>
							</c:if>
						</li>
						<li class="rep_content">
							<pre>${rep.content}</pre>
						</li>
					</ul>
				</li>
			</c:forEach>
			</ul>
		</div>
	</div>
	<div>
		<input type="button" value="목록보기" id="list_btn" class="btn" onclick="location.href='http://localhost:9090/10_MODEL2/listBoardPage.b?${referer}'"/>
	<c:if test="${dto.author == loginDTO.id}">
		<form action="/10_MODEL2/editBoardPage.b" method="post">
			<input type="hidden" name="idx" value="${dto.idx}"/>
			<input type="hidden" name="title" value="${dto.title}"/>
			<input type="hidden" name="author" value="${dto.author}"/>
			<input type="hidden" name="filename" value="${dto.filename}"/>
			<input type="hidden" name="content" value="${dto.content}"/>
			<input type="submit" value="수정" id="edit_btn" class="btn"/>
			<input type="button" value="삭제" id="del_btn" class="btn" onclick="del_f()"/>
		</form>			
	</c:if>
	</div>
</div>

<%@ include file="../layout/footer.jsp" %>
