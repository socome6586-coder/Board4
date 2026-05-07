<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="/img/favicon2.png" type="image/x-icon">
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
    
  input[type="text"], input[type=number], input[type=password]  {
     width : 100%;
  }
  input[type=submit], input[type=button] {
     width : 100px;
  }
  input[name=userid] {
     width : 65%;
  }
  
</style>
<body> 
  <main>
    <h2>새 글 작성</h2>
    <form  action="/Board/Write" method="post">
    <input type="hidden" name="menu_id" value="${menu_id}" />
     <table>
      <tr>
        <td><span class="red">*</span>제목</td>
        <td>
          <input type="text" name="title" />
        </td>
      </tr>
      <tr>
        <td>내용</td>
        <td><textarea name="content"></textarea></td>        
      </tr>
      <tr>
        <td><span class="red">*</span>작성자</td>
        <td><input type="text" name="writer" /></td>        
      </tr>
      <tr>
        <td colspan="2">
          <input type="submit"  value="추가" />
          <input type="button"  value="목록" 
            onclick="location.href='/Board/List?menu_id${param.menu_id}'"
          />        
        </td>
      </tr>
     </table>    
    </form>
  
  </main>
  
  <!-- Javascript 코딩 : client validation -->
  <script>
 
  </script>

  <script> 
    // 아이디 중복확인1(새 창 열기)
    const  btnDup1El = document.querySelector('#dupCheck1')
    btnDup1El.addEventListener('click', function() {
    	// alert('ok1')
    	// 새창(새 브라우저)을 띄운다
    	//let  url      = '/Users/DupCheckWindow?first=true';
    	let  url      = '/Users/DupCheckWindow'; // session 활용 방식
    	let  target   = 'dupcheck';  // 새 창 이름있으면 한개만 열린다
    	let  feauture = 'left=800,top=200,width=400,height=300'
    	window.open(url, target , feauture )
    	
    	
    } )
    
  </script>
  
  <script> 
    // 아이디 중복확인2(Ajax)
    const  btnDup2El = document.querySelector('#dupCheck2')
    btnDup2El.addEventListener('click', function() {
	    if( useridEl.value.trim() == '' ) {
	    	alert('아이디를 입력하세용')
	    	useridEl.focus()
	    	return ;
	    }
    	
	    // alert('ok2')
    	
	    let  url = '/Users/IdDupCheck2?userid=' + useridEl.value;
    	fetch( url )
    	  .then( response => response.json() )
    	  .then( data => {
    		  console.log( data )    
    		  if(data.userid != null) {
    			  alert('사용불가능')
    			  idDupChecked = false;
    		  } else	{  
    			  alert('사용가능')
    			  idDupChecked = true;
    		  }
    	  });
    	
    } )
    
    // userid 의 value 가 바뀌면 idDupChecked = false;
    useridEl.addEventListener('change', function() {
    	idDupChecked = false;
    })
    
  </script>
  
  
  
  
</body>
</html>    















