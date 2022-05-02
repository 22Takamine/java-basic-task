<%@page import="util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
    

 	
    // 残数の更新処理(残数の取得、更新、保存など)    
    int totalNum = 0;       //石の数
    String player = "";  	
    int stoneNum = 0;		//取る石に数
    
    //セッションの初期化
    if (session.getAttribute("totalNum") == null) {
	    session.setAttribute("totalNum", 25);
	}
	if (session.getAttribute("player") == null) {
	    session.setAttribute("player", "A");
	}
    
	//ボタン入力の取得
    request.setCharacterEncoding("UTF-8");
 	String subStone = request.getParameter("num");
 	
 	//空やnullの除去
 	if (subStone != null && !subStone.isEmpty()) {
 		stoneNum = Integer.parseInt(subStone);
    }
 	
 	//セッションの値取得
    totalNum = (int)session.getAttribute("totalNum");
    player = (String)session.getAttribute("player");

    //残数計算
    totalNum -= stoneNum;
    session.setAttribute("totalNum", totalNum);

    //石表示
    String stone = Utility.getStoneDisplayHtml(totalNum);
    
    // プレイヤーの切替処理(プレイヤーの取得、切替、保存など)
    if(stoneNum != 0){
    	switch(player){
        case "A":
        	player = "B";
        	break;
        	
        case "B":
        	player = "A";
        	break;
        
        }
    	session.setAttribute("player", player);
    	//stoneNum = 0;
    }
    
   
    
    
    
    // 残数が0以下の場合、結果ページへ遷移
    // (responseオブジェクトのsendRedirectメソッドを使用する)
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
      プレイヤー<%= player %>の番
    </h2>

    <form action="play.jsp">
      <p>
        石を
        <input type="number" name="num" min="1" max="3">
        個取る<br> ※1度に3個取れます。
      </p>
      <button class="btn" type="submit">決定</button>
    </form>
  </div>
</body>
</html>