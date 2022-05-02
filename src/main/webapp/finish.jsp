<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
    // セッションからプレイヤー名を取得する
    char player = (char)session.getAttribute("player");
	int playerCount = (int)session.getAttribute("playerNum");
	int num = (int)player - 1;
	String playerText = "0";
	
	if(playerCount == 2){
		playerText = "勝者";
		
	}else{
		playerText = "敗者";
		if(num == 64){
			num = 65;
		}
		player = (char)num;
	}
		
	
	
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
    <h2>
<%--       勝者：プレイヤー<%= winPlayer %>！！ --%>
		<%= playerText %>：プレイヤー<%= player %>！！
    </h2>
    <form action="index.jsp">
      <button class="btn" type="submit">先頭に戻る</button>
    </form>
  </div>
</body>
</html>