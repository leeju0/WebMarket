<%@ page contentType="text/html; charset=utf-8" %> <%-- 한국어 사용 --%>
<%@ page import="java.util.Date"%> <%-- java.util.Date패키지 사용 --%>
<html>
<head>
	<link rel ="stylesheet"
		href = "https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
	<title>Welcome</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<%! String greeting = "웹 쇼핑몰에 오신 것을 환영합니다.";
		String tagline = "Welcome to Web Market!"; %>
	<div class="jumbotron">
		<div class = "container">
		 	<h1 class = "display-3"> <%-- h1을 display-1, display-2, display-3, display-4로 나눈것이다. --%>
					<%= greeting %>
			</h1>
		</div>
		
	</div>	

	<div class = "container">
		<div class ="text-center"> <%-- 가운데 정렬 --%>
			<h3>
					<%= tagline %>
			</h3>
			<%
				response.setIntHeader("Refresh",5);
				Date day = new java.util.Date();
				String am_pm;
				int hour = day.getHours();
				int minute = day.getMinutes();
				int second = day.getSeconds();
				if (hour / 12 == 0){
					am_pm = "AM";
				}else{
					am_pm = "PM";
					hour = hour -12;
				}
				String CT = hour + ":" + minute + ":" + second + " " + am_pm;
				out.println("현재 접속   시각: "+CT+"\n");
			%>
		</div>
		<hr>
	</div>
	<%@ include file="footer.jsp" %>	
</body>
</html>