<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품 아이디 오류</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger">해당 상품이 존재하지 않습니다.</h2>
		</div>
	</div>
	<div class="container">
		<p><%=request.getRequestURL()%>?<%=request.getQueryString() %>
		<p><a href="products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
	</div>
</body>
</html>