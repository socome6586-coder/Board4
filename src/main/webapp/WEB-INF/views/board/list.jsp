<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@taglib  prefix="c"  uri="jakarta.tags.core" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="/img/favicon2.png" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="/css/common.css" rel="stylesheet" />

<style>
    table { 
        width: 100%; 
        table-layout: fixed;
        border-collapse: collapse;
    }

    td { 
        padding: 8px 5px; 
        text-align: center;
        vertical-align: middle;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    #list td:nth-of-type(1) { width: 60px; }  /* 번호 */
    #list td:nth-of-type(2) { width: 400px; }  /* 제목 (가변) */
    #list td:nth-of-type(3) { width: 100px; } /* 글쓴이 */
    #list td:nth-of-type(4) { width: 150px; } /* 날짜 */
    #list td:nth-of-type(5) { width: 70px; }  /* 조회수 */
    
    #list td:nth-of-type(6), 
    #list td:nth-of-type(7) { 
        width: 50px; 
        padding-left: 0; 
        padding-right: 0; 
    }

    tr:first-of-type, .menu { 
        background-color: black; 
        color: white; 
    }
    
    tr:first-of-type td { 
        border: 1px solid white; 
    }

    tr:nth-of-type(2) td { 
        text-align: right; 
        padding-right: 20px; 
    }

    .title { text-align: left; }

    main { margin-bottom: 150px; }

    #list a {
        text-decoration: none;
        color: inherit;
        display: inline-block; 
        padding: 2px 4px;
    }

	.menu td > a.${menu_id} {background-color : #04AA6D;}
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</head>

<body>
	<main>
	  <%@include file="/WEB-INF/include/menus.jsp"%>
	
	  <h2>${menu.menu_name} 게시글 목록</h2>
	  <table id="list" class="table table-hover">
	    <tr>
	      <td>번호</td>
	      <td>제목</td>
	      <td>글쓴이</td>
	      <td>날짜</td>
	      <td>조회수</td>
	      <td>삭제</td>
	      <td>수정</td>
	    </tr>
	    <tr>
	      <td  colspan="7">
	       [<a href="/Board/WriteForm?menu_id=${menu_id}">새 글 등록</a>]&nbsp;&nbsp;&nbsp; 
	       [<a href="/">Home</a>]
	      </td>
	    </tr>

	    
	    <c:forEach  var="board"  items="${ bList }">
	    <tr>
	      <td> ${ board.idx     }  </td>    <!-- menu.getMenu_id() -->
	      <td class="title">
	      	 <a href="/Board/View?idx=${board.idx}&menu_id=${menu_id}">
	      	   ${ board.title   }  </td>
	      	 </a>
	      <td> ${ board.writer  }  </td>
	      <td> ${ board.regdate }  </td>
	      <td> ${ board.hit     }  </td>
   	      <td> <a href="/Board/Delete?idx=${board.idx}">삭제</a></td>	      
	      <td> <a href="/Board/UpdateForm?idx=${board.idx}">수정</a></td>
	    </tr>
	    </c:forEach>
	  </table>
	</main>
</body>
</html>
