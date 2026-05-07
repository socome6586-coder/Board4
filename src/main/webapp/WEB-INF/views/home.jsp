<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="shortcut icon" href="/img/favicon2.png" type="image/x-icon">
<style>
    /* 기본 초기화 */
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
        font-family: 'Pretendard', -apple-system, BlinkMacSystemFont, system-ui, Roboto, sans-serif;
        background-color: #f5f7fa;
        color: #333;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    /* 메인 컨테이너 */
    main {
        background: #ffffff;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.05);
        width: 100%;
        max-width: 400px;
    }

    /* 제목 스타일 */
    h2 {
        font-size: 24px;
        font-weight: 700;
        margin-bottom: 25px;
        color: #1a1a1a;
        border-left: 5px solid #4a90e2;
        padding-left: 15px;
    }

    /* 구분선 역할의 공백 */
    div:empty, .spacer {
        height: 20px;
        border-bottom: 1px solid #eee;
        margin-bottom: 20px;
    }

    /* 링크 아이템 배치 */
    div { margin-bottom: 12px; }

    /* 링크를 버튼 스타일로 변경 */
    a {
        text-decoration: none;
        color: #4a5568;
        font-size: 15px;
        display: block;
        padding: 12px 16px;
        border-radius: 8px;
        background-color: #f8fafc;
        transition: all 0.2s ease;
        border: 1px solid #edf2f7;
    }

    /* 마우스 호버 효과 */
    a:hover {
        background-color: #4a90e2;
        color: #ffffff;
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(74, 144, 226, 0.2);
    }

    /* 강조할 링크 (선택사항) */
    a[href*="WriteForm"] {
        color: #2b6cb0;
        font-weight: 600;
    }
</style>
</head>
<body>
<main>
    <h2>Home</h2>
    <div><a href="/test">Dashboard Test</a></div>
    
    <div class="spacer"></div>
    
    <div><a href="/Menus/WriteForm">새 메뉴 추가</a></div>
    <div><a href="/Menus/WriteForm2">빠른 메뉴 추가</a></div>
    <div><a href="/Menus/List">메뉴 목록 확인</a></div>
    
    <div class="spacer"></div>
    
    <div><a href="/Users/List">사용자 전체 목록</a></div>
    <div><a href="/Users/WriteForm">신규 사용자 등록</a></div>
    <div><a href="/Users/IdDupCheck2?userid=aaa" target="_blank">아이디 중복 확인</a></div>
    
    <div class="spacer"></div>
    
    <div><a href="/Board/List?menu_id=MENU01">게시글 목록 보기</a></div>
    <div><a href="/Board/WriteForm?menu_id=MENU01">새 게시글 작성</a></div>
</main>
</body>
</html>
