<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
    //セッションクリア
    session.invalidate();

	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Java基礎課題</title>
<link href="css/styles.css" rel="stylesheet">
</head>
<body>
  <h1>石取りゲーム</h1>

  <div class="info">
  	<form action="play.jsp">
  	
	    <h2>条件</h2>
	    <p>
	      石の総数：<input type="number" name="stone" value="25" min="1" >
	    </p>
	    <p>
	      1度に取れる石の数：<input type="number" name="take" value="3" min="1" >
	    </p>
	    <p>
	      プレイヤーの数：<input type="number" name="player" value="2" min="2" max="26">
	    </p>
	    <p>
	      石の記号：<input type="text" name="symbol" value="●" maxlength = "1">
	    </p>

      	<button class="btn" type="submit">始める</button>
    </form>
    
  </div>
</body>
</html>