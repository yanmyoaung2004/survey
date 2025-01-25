<%@page import="com.yma.survey.model.Question"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<c:import url="../common/header.jsp" />
<style>
.container {
	width: 100%;
}

@media ( min-width : 860px) {
	.container {
		width: 60%;
		margin: 0 auto;
	}
}

.tooltip {
	position: relative;
	cursor: pointer;
}

.tooltip .tooltiptext {
	visibility: hidden;
	width: fit-content;
	background-color: black;
	color: #fff;
	text-align: center;
	border-radius: 6px;
	padding: 5px;
	position: absolute;
	z-index: 1;
	bottom: 125%;
	left: 50%;
	margin-left: 0px;
	opacity: 0;
	transition: opacity 0.3s;
}

.tooltip:hover .tooltiptext {
	visibility: visible;
	opacity: 1;
}

::-webkit-scrollbar {
	display: none;
}

html {
	scrollbar-width: none;
}

body {
	-ms-overflow-style: none;
	overflow-y: scroll;
}
</style>

</head>
<body>

	<div
		class="p-5 container flex flex-col gap-3 border border-yellow-600 mx-auto"
		id="create-container"
		style="font-weight: 400; position: relative; height: 100vh; overflow-y: scroll; -ms-overflow-style: none; scrollbar-width: none;">

		<div class="w-full rounded-lg border border-gray-200">
			<div class="px-6 py-5 w-full">
				<div class="flex flex-col gap-1">
					<div class="w-full sm:flex justify-between items-start mb-1">
						<div class="flex flex-col w-full gap-1">
							<h2
								class="text-3xl font-medium leading-snug truncate sm:mb-0 text-gray-700">
								${survey.title }</h2>
							<h2 class="text-lg mt-1 sm:mb-0 text-gray-700">${survey.description }</h2>
							<h2 class="text-xs fond-bold">Creation Date:
								${survey.creationDate.split(' ')[0]}</h2>

						</div>
					</div>
				</div>
			</div>
		</div>

		<c:forEach items="${result }" var="question">
			<div class="w-full rounded-lg border border-gray-200 mb-3">
				<div class="px-6 py-5 w-full">
					<div class="flex flex-col gap-1">
						<div class="w-full sm:flex justify-between items-start mb-1">
							<div class="flex flex-col w-full">

								<h2 class="text-lg font-bold mb-1 sm:mb-0 text-gray-700">
									${question.question}</h2>
							</div>
						</div>
						<div class="flex flex-col gap-3">
							<c:forEach items="${question.options }" var="option">
								<div class="flex gap-4 flex-col" style="width: 470px">
									<div class="flex flex-col gap-1">
										<div class="flex justify-between">
											<p class="text-sm">${option.optionText }</p>
											<p class="text-xs">${option.dataPercentage }%</p>
										</div>
										<div class="w-full bg-gray-100 rounded-full dark:bg-gray-300"
											style="height: 6px">

											<c:if test="${option.dataPercentage != 0}">

												<div
													class="tooltip bg-blue-600 text-xs font-medium text-blue-100 text-center p-0.5 leading-none rounded-full"
													style="width: ${option.dataPercentage}%; height: 6px">
													<div class="tooltiptext">${option.count }</div>
												</div>
											</c:if>
										</div>
									</div>
								</div>
							</c:forEach>


						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<c:url var="goBackLink" value="response">
		</c:url>
		<div style="width: 100px">
			<a
				class=" flex items-center justify-center text-xs font-bold bg-blue-600 text-white py-1.5 hover:bg-blue-700 text-gray-700 w-15 h-15 rounded-full bg-gradient-to-b from-green-50 to-green-100 hover:from-white hover:to-green-50 focus:outline-none focus-visible:from-white focus-visible:to-white transition duration-150 ml-2"
				href="${goBackLink}"> Back </a> <br>
		</div>
	</div>

</body>
</html>