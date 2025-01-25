<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
		<c:import url="common/header.jsp" />
</head>
<body style="background-color: #f6f5fa">

	<c:import url="common/side-bar.jsp" />
	<c:set var="pageTitle" value="Survey" />

	<c:import url="common/navbar.jsp">
		<c:param name="title" value="${pageTitle}" />
	</c:import>
	
	<c:import url="survey/survey-card.jsp">
		<c:param name="surveys" value="${surveys}" />
	</c:import>
	



	<c:import url="common/footer.jsp" />
</body>
</html>
