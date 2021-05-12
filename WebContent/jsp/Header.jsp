<!-- ヘッダーコピペ用のjspです -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
<!-- headの中に↓を追加してCSSを読み込む -->
	<link rel="stylesheet"href="${pageContext.request.contextPath}/jsp/ECSiteLayout.css">
	</head>

	<body>
<!-- ここからヘッダー -->
		<header>
	        <button type="button" onclick="location.href='http://localhost:8080/ECSite/TopServlet'">トップ</button>
			<nav><ul>
	        <li><form action = "http://localhost:8080/ECSite/FavoriteListCompletionServlet" method = "POST">
			<input type = "submit" name="btnMyPageTransition" value = "マイページ">
			</form></li>
			<li><form action = "http://localhost:8080/ECSite/CartServlet" method = "POST">
			<input type = "submit" name="btnHeaderCartTransition" value = "カート">
			</form></li>
	        <li><form action = "http://localhost:8080/ECSite/ItemSearchServlet" method = "POST">
			<input type = "submit" name="btnItemListTransition" value = "商品一覧">
			</form></li>
			</ul></nav>
		</header>
<!-- ここまでヘッダー -->


	</body>
</html>
