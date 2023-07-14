<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/h2.jsp"%>
<script type="text/javascript">
	const route = window.location.pathname.replace('/', '');
</script>

<style>
.board-table {
	font-size: 15px;
	width: 100%;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.board-table a {
	color: #333;
	display: inline-block;
	line-height: 1.4;
	word-break: break-all;
	vertical-align: middle;
}

.board-table a:hover {
	text-decoration: underline;
}

.board-table th {
	text-align: center;
}

.board-table .th-num {
	width: 100px;
	text-align: center;
}

.board-table .th-date {
	width: 200px;
}

.board-table th, .board-table td {
	padding: 14px 0;
}

.board-table tbody td {
	border-top: 1px solid #e7e7e7;
	text-align: center;
}

.board-table tbody th {
	padding-left: 28px;
	padding-right: 14px;
	border-top: 1px solid #e7e7e7;
	text-align: left;
}

.board-table tbody th p {
	display: none;
}



 #topMenu {            
         height: 30px; 
         width: 850px; 
 }
 #topMenu ul li {                       
         list-style: none;            
         color: white;               
         background-color: #ffffff;  
         float: left;                
         line-height: 30px;          
         vertical-align: middle;     
         text-align: center;   
         margin: 10px;      
 }
 #topMenu .menuLink {                               
         text-decoration:none;                      
         color: white;                              
         display: block;                            
         width: 150px;                              
         font-size: 12px;                           
         font-weight: bold;                         
         font-family: "Trebuchet MS", Dotum, Arial; 
 }
 #topMenu .menuLink:hover {            
         color: red;                   
         background-color: #4d4d4d;    
 }



	body,ul,li {
	  margin: 0;
	  padding: 0;
	}
ul, li {
  list-style:none;
}
.menu {
  display: flex;
}
.menu-item {
  background-color: gold;
  flex-grow: 1;
  transition: 0.5s;
}
.menu-item:hover {
  background-color: crimson;
  flex-grow: 1.2;
}
.menu-link {
  /* block이면 마우스 클릭영역이 더 커짐, a태그는 inline으로서 클릭영역이 콘텐츠에 한정됨*/
  display: block; 
  padding: 16px;
  font-size: 18px;
  font-weight: bold;
  color: #555;
  text-decoration: none;
  text-align: center;
}
.menu-link:hover {
  color: white;
}


</style>
</head>
<div id="layoutSidenav" style="background-color: #FFFFFF;">
	

	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h2 class="mt-4">전체 게시판</h2>
				
				
		<nav id="topMenu" >
           <ul>
              <li><a href="#">커피</a></li>
              <li><a href="#">음료</a></li>
              <li><a href="#">디저트</a></li>
              <li><a href="#">MD</a></li>
              <li><a href="#">기타</a></li>
           </ul>
        </nav>
        <br>
        
  
    <ul class="menu">
        <li class="menu-item">
            <a href="#" class="menu-link">커피</a>
        </li>
        <li class="menu-item">
            <a href="#" class="menu-link">음료</a>
        </li>
        <li class="menu-item">
            <a href="#" class="menu-link">디저트</a>
        </li>
        <li class="menu-item">
            <a href="#" class="menu-link">MD</a>
        </li>
    </ul>
    <br>
				
				
				
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i>
					</div>
					<div id="board-list">
						<div class="container">
							<br> <br>
							<table class="board-table">
								<thead>
									<tr>
										<th scope="col" class="th-num">No.</th>
										<th scope="col" class="th-title">제목</th>
										<th scope="col" class="th-date">작성자</th>
										<th scope="col" class="th-date">작성시간</th>
										<th scope="col" class="th-num">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="vo" items="${list.content }">
										<tr>
											<td>${vo.num}</td>
											<td><a href="content?num=${vo.num }&page=${nowPage-1}&keyword=${param.keyword}">${vo.title}</a></td>
											<td>${vo.writer}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}" /></td>
											<td>${vo.hit}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<br>
							<nav aria-label="Page navigation example">
								<ul class="pagination pagination-sm">
									<li class="page-item"><c:if test="${param.page >= startPage }">
											<li><a class="page-link" href="${route}?page=${param.page - 1 }"> <span aria-hidden="true">&laquo;</span>
											</a></li>
										</c:if> <c:forEach var="pagenum" begin="${startPage }" end="${endPage }">
											<li class="${nowPage == pagenum ? 'active':'' }"><a href="${route}?page=${pagenum-1 }" class="page-link">${pagenum }</a></li>
										</c:forEach> <c:if test="${param.page < endPage - 1}">
											<li><a class="page-link" href="${route}?page=${param.page + 1}"> <span aria-hidden="true">&raquo;</span>
											</a></li>
										</c:if></li>
								</ul>
							</nav>
						</div>
					</div>

				</div>

			</div>
			<div id="board-search">
				<div class="container">
					<div class="search-window" style="float: right;">
						<form action="board?page=${param.page }&keyword=${param.keyword }">
							<div class="search-wrap">
								<label for="search" class="blind"></label> <input type="text" name="keyword" placeholder="제목검색">
								<button type="submit" value="검색" class="btn btn-dark">검색</button>
							</div>
						</form>
					</div>
				</div>
			</div>

	



<%@ include file="/include/footer.jsp"%>
