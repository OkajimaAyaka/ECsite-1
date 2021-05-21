<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ page import="itemsearch.ItemSearchServlet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.ItemBean" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品検索</title>
<link rel="stylesheet"href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet"href="${pageContext.request.contextPath}/css/ECSiteLayout.css">
</head>
<body>
	<header>
	       <div class="header_wrap">
		       <form action="http://localhost:8080/ECSite/TopServlet" method="POST">
									<input class ="header_top_btn" type="image"  src="${pageContext.request.contextPath}/img/icon/logo.png"  name="btnItemSearch"/>
									<input type ="hidden" name="btnTopTransition" value="topTransition">
				</form>

				<form action="http://localhost:8080/ECSite/ItemSearchServlet" method="POST">
								<input class ="header_word" type="text" name="itemSearchWord"/>
								<input class ="header_search_btn" type="image"  src="${pageContext.request.contextPath}/img/icon/search.png"  name="btnItemSearch"/>
								<input type ="hidden" name="btnItemSearchTransition" value="itemSearchTransition">
				</form>

				<nav>
					<ul>
						<li>
							<form action = "http://localhost:8080/ECSite/CartServlet" method = "POST">
								<input class ="header_cart_btn" type = "image" src="${pageContext.request.contextPath}/img/icon/cart.png" name="btnCartTransition">
								<input type ="hidden" name="btnHeaderCartTransition" value="headerCartTransition">
							</form>
						</li>

						<li>
		        			<form action = "http://localhost:8080/ECSite/MyPageServlet" method = "POST">
								<input class ="header_mypage_btn" type = "image" src="${pageContext.request.contextPath}/img/icon/home.png"  name="btnMyPageTransition">
								<input type ="hidden" name="btnMyPageTransition" value="myPageTransition">
							</form>
						</li>
					</ul>
				</nav>
			</div>
	</header>

	<!-- カテゴリボタン↓ -->
			<div class="category_wrap">
						<p class="category_ttl">カテゴリ一覧</p>
							<form  class="category_container" action = "http://localhost:8080/ECSite/ItemSearchServlet" method = "POST">
								<button class="btn category_btn" type="submit" name="btnCategorySelect" value="1">椅子</button>
								<button class="btn category_btn" type="submit" name="btnCategorySelect" value="2">収納</button>
								<button class="btn category_btn" type="submit" name="btnCategorySelect" value="3">照明</button>
								<button class="btn category_btn" type="submit" name="btnCategorySelect" value="4">寝具</button>
								<button class="btn category_btn" type="submit" name="btnCategorySelect" value="5">机</button>
								<button class="btn category_btn" type="submit" name="btnCategorySelect" value="6">その他</button>
							</form>

			</div>
<!-- カテゴリボタン↑ -->



	<div class="page_layout search_layout">


			<!-- エラーメッセージがある場合は表示し、ない場合は表示しない。 -->
			<c:choose>
				<c:when test="${errorText != null}">
						<h1 class="error_text"><c:out value="${errorText}"/></h1>
				</c:when>
				<c:when test="${errorText == null}">
				</c:when>
			</c:choose>
		<br>


		<!-- itemSearchListがnullの場合、0件の場合、1件以上の場合 -->
		<c:choose>
			<c:when test="${itemSearchList == null}">
			</c:when>

			<c:when test="${ fn:length(itemSearchList) >= 1}">
			<div class="form_cover">
				<c:forEach items="${itemSearchList}" var="item">
						<!-- 商品画像 -->
						<form  class="item_form" name="btnItemDetail" action="http://localhost:8080/ECSite/ItemDetailServlet" method="POST">
						<h3 class="item_select_btn">
							<button class="item" type="submit" name="btnItemDetailTransition" value="${item.itemNo}">
								<img src="./img/${item.itemImage}" class="item_image">
								<p class="item_name"><c:out value="${item.itemName}" default="取得失敗"/></p>
							<p class="item_price">お値段：<c:out value="${item.itemPrice}" default="取得失敗"/>円</p>
							</button>
						</h3>
						</form>
						<br>
				</c:forEach>
			</div>

			</c:when>

			<c:when test="${ fn:length(itemSearchList) == 0}">
				お探しの商品はありません。
			</c:when>

		</c:choose>
	</div>

  	<div class="footer_wrapper">
	    <footer>
			<p class="footer_text">2021/05/14/ECSite</p>
		</footer>
	</div>



</body>
</html>