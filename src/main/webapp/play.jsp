<%@page import="util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
    
	//ボタン入力の取得
    request.setCharacterEncoding("UTF-8");
 	String fullStone = request.getParameter("stone");
 	String takeStone = request.getParameter("take");
 	String playerNum = request.getParameter("player");
 	String symbol = request.getParameter("symbol");
 	String subStone = request.getParameter("num");
 	
 	//初期値
 	int totalNum = 25;
 	int maxStone = 3;
 	int playerCount = 1;
 	int stoneNum = 0;
 	int num = 65;
 	char nowPlayer = 0;
//  	String playerName = "";
 	String symbolType = "●";
 	
 	
 	//空やnullの除去
 	if (fullStone != null && !fullStone.isEmpty()) {
 		totalNum = Integer.parseInt(fullStone);
    }
 	if (takeStone != null && !takeStone.isEmpty()) {
 		maxStone = Integer.parseInt(takeStone);
    }
 	if (playerNum != null && !playerNum.isEmpty()) {
 		playerCount = Integer.parseInt(playerNum);
    }
 	if (symbol == null || symbol.isEmpty()) {
 		symbol = symbolType;
    }
 	if (subStone != null && !subStone.isEmpty()) {
 		stoneNum = Integer.parseInt(subStone);
    }
   
 	//セッションの初期化
    if (session.getAttribute("totalNum") == null) {
	    session.setAttribute("totalNum", totalNum);
	}
    if (session.getAttribute("maxStone") == null) {
	    session.setAttribute("maxStone", maxStone);
	}
    if (session.getAttribute("playerNum") == null) {
	    session.setAttribute("playerNum", playerCount);
	}
    if (session.getAttribute("symbol") == null) {
	    session.setAttribute("symbol", symbol);
	}
	if (session.getAttribute("player") == null) {
	    session.setAttribute("player", 'A');
	}
 	
 	
 	//セッションの値取得
    totalNum = (int)session.getAttribute("totalNum");
 	maxStone = (int)session.getAttribute("maxStone");
 	playerCount = (int)session.getAttribute("playerNum");
 	symbol = (String)session.getAttribute("symbol");
    nowPlayer = (char)session.getAttribute("player");
    

    //残数計算
    totalNum -= stoneNum;
    session.setAttribute("totalNum", totalNum);
    
    //石表示
    String stone = Utility.getStoneDisplayHtml(totalNum,symbol);
    
    
    
    
    // プレイヤーの切替処理(プレイヤーの取得、切替、保存など)
    
    if(stoneNum != 0){
    	num = (int)nowPlayer;
    	
    	
    	if(num == (65 + playerCount -1)){
    		num = 65;
    	}else{
    		num++;
    	}
    	nowPlayer = (char)num;
    	
    }
 	
    session.setAttribute("player", nowPlayer); 
    
 	// 残数が0以下の場合、結果ページへ遷移
 	if(totalNum <=0){
     	response.sendRedirect("finish.jsp");
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
      残り：<%= totalNum %>個
    </h2>
    <p class="stone">
      <%= stone %>
    </p>
  </div>
  <div class="info">
    <h2>
		プレイヤー<%= nowPlayer %>の番
    </h2>

    <form action="play.jsp">
      <p>
        石を
        <input type="number" name="num" min="1" max="<%= maxStone %>">
        個取る<br> ※1度に<%= maxStone %>個取れます。
      </p>
      <button class="btn" type="submit">決定</button>
    </form>
  </div>
</body>
</html>