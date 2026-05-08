<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시글 수정</title>
<link rel="shortcut icon" href="/img/favicon2.png" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="/css/common.css" rel="stylesheet" />
<style>
    table { width:100%; }
    td { 
        padding:5px 10px; 
        text-align : center; 
        &:nth-of-type(1) { 
            background: black; 
            color : white; 
            border:1px solid white; 
        } 
    }
    tr:last-child > td { 
        background: white; 
        border : 1px solid black; 
    }
    #table1 td:nth-of-type(1) { width : 150px; }
    
    input[type="text"], textarea { 
        width: 100%; 
        border: 1px solid #ccc; 
        padding: 5px;
    }
    textarea { 
        height: 400px; 
        vertical-align: middle;
    }
    .btn-container {
        text-align: center;
    }
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
<main>
    <!-- 메뉴 출력 -->
    <%@include file="/WEB-INF/include/menus.jsp"%>

    <h2>게시글 수정하기</h2>
    <form action="/Board/Update" method="POST">
        <!-- 히든 필드 -->
        <input type="hidden" name="idx" value="${board.idx}">
        
        <table id="table1">
            <tr>
                <td>글 번호</td>
                <td style="text-align:left;">${board.idx}</td>
            </tr>
            <tr>
                <td>제목</td>
                <td>
                    <input type="text" name="title" value="${board.title}" required>
                </td>
            </tr>
            <tr>
                <td>내용</td>
                <td>
                    <textarea name="content">${board.content}</textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="btn-container">
                    <button type="submit" class="btn btn-dark">수정완료</button>
                    <a href="/Board/View?idx=${board.idx}&menu_id=${board.menu_id}" class="btn btn-dark">취소</a>
                    <a href="/Board/List?menu_id=${board.menu_id}" class="btn btn-dark">목록</a>
                </td>
            </tr>
        </table>
    </form>
</main>


</body>
</html>
