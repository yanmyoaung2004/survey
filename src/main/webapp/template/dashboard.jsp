<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" />
<title>Survey App</title>
<link
	href="https://cdn.jsdelivr.net/npm/flowbite@2.5.1/dist/flowbite.min.css"
	rel="stylesheet" />

</head>
<body>
	<c:import url="common/side-bar.jsp" />

	<c:set var="pageTitle" value="Dashboard" />

	<c:import url="common/navbar.jsp">
		<c:param name="title" value="Dashboard" />
	</c:import>
	<div class="p-2 sm:ml-64"
		style="background-color: #f6f5fa; height: 100dvh;">
		<div
			class="flex flex-col lg:flex-row items-center justify-between px-0 md:px-5 gap-3 w-full">
			<div
				class="bg-white w-full md:w-1/3 lg:w-1/4 flex flex-col gap-2 h-40 rounded-xl p-6 border border-gray-200 bg-opacity-30 backdrop-filter backdrop-blur-lg">
				<div class="font-semibold text-md">Surveys Created</div>
				<div class="font-semibold text-3xl tracking-tight">${numberOfSurveyCreated }</div>
				<div>
					<span
						class="bg-green-100 text-green-800 text-xs font-medium me-2 px-2.5 py-0.5 rounded dark:bg-green-900 dark:text-green-300">${activeSurvey }
						Active</span> <span
						class="bg-purple-100 text-purple-800 text-xs font-medium me-2 px-2.5 py-0.5 rounded dark:bg-purple-900 dark:text-purple-300">${inactiveSurvey }
						Completed</span>
				</div>
			</div>
			<div
				class="bg-white w-full md:w-1/3 lg:w-1/4 flex flex-col gap-2 h-40 rounded-xl p-6 border border-gray-200 bg-opacity-30 backdrop-filter backdrop-blur-lg">
				<div class="font-semibold text-md">Surveys Responses</div>
				<div class="font-semibold text-3xl tracking-tight">${surveyResponses }</div>
				<div>
					<span
						class="bg-gray-200 text-gray-800 text-xs font-medium me-2 px-2.5 py-0.5 rounded dark:bg-gray-700 dark:text-gray-300">${anonymousPercentage }%
						anonymous responses</span>
				</div>
			</div>
			<div
				class="bg-white w-full md:w-1/3 lg:w-1/4 flex flex-col gap-2 h-40 rounded-xl p-6 border border-gray-200 bg-opacity-30 backdrop-filter backdrop-blur-lg">
				<div class="font-semibold text-md">Completion Rate</div>
				<div class="font-semibold text-3xl tracking-tight">${activeSurvey - inactiveSurvey }</div>
				<div>
					<span
						class="bg-gray-200 text-gray-800 text-xs font-medium me-2 px-2.5 py-0.5 rounded dark:bg-gray-700 dark:text-gray-300">
						${
							(inactiveSurvey * 100) / activeSurvey
						 } %
						completed surveys</span>
				</div>
			</div>
		</div>
		<div
			class="pt-3 flex flex-col md:flex-row  justify-between px-0 md:px-5 gap-3 w-full">
			<div
				class=" flex-1 bg-white w-full md:w-1/2 lg:w-1/4 flex flex-col gap-2 h-40 rounded-xl p-6 border border-gray-200 bg-opacity-30 backdrop-filter backdrop-blur-lg">
				<div class="font-semibold text-lg">Recent Surveys</div>
				<div>
					<c:forEach items="${surveys }" var="survey">

						<div
							class="flex items-center gap-5 mb-3 pb-3 border-b border-gray-300">
							<div class="flex-col gap-5" style="font-weight: 400; width: 85%">
								<div class="flex items-start pr-5">
									<!-- Card content -->
									<div class="flex-grow truncate flex-1">
										<div class="w-full sm:flex justify-between items-center mb-2">
											<div class="flex justify-center align-center gap-3">
												<h2
													class="text-md leading-snug font-semibold text-gray-50 truncate mb-1 sm:mb-0">
													${survey.title }</h2>

												<div>
													<c:choose>
														<c:when test="${survey.isActive }">
															<span
																class="bg-green-200 text-green-900 text-xs font-medium me-2 px-2.5 py-1 rounded dark:bg-green-900 dark:text-green-300">Active</span>
														</c:when>
														<c:otherwise>
															<span
																class="bg-red-200 text-red-900 text-xs font-medium me-2 px-2.5 py-1 rounded dark:bg-green-900 dark:text-green-300">Expired</span>
														</c:otherwise>
													</c:choose>
												</div>
												<div>
													<span
														class="bg-gray-200 text-green-900 text-xs font-medium me-2 px-2.5 py-1 rounded dark:bg-green-900 dark:text-green-300">
														${survey.noOfPeopleCompleted }
														completions</span>
												</div>
											</div>
										</div>
										<!-- Card body -->
										<div
											class="flex items-end justify-between whitespace-normal w-full">
											<!-- Paragraph -->
											<div class="text-gray-700 text-md w-full">
												<div class="max-w-xs flex flex-col justify-between gap-2">
													<div class="flex">
														<span class="text-gray-500 text-xs font-bold flex-1">Created
															By </span> <span class="text-gray-600 text-xs font-bold flex-1">:</span>
														<span class="text-gray-500 text-xs font-bold flex-1">${survey.user.username }</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div>
								<a href=""> <svg
										class="w-6 h-6 text-gray-800 dark:text-white"
										aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" fill="none" viewBox="0 0 24 24">
                                        <path stroke="currentColor"
											stroke-linecap="round" stroke-linejoin="round"
											stroke-width="2"
											d="M13.213 9.787a3.391 3.391 0 0 0-4.795 0l-3.425 3.426a3.39 3.39 0 0 0 4.795 4.794l.321-.304m-.321-4.49a3.39 3.39 0 0 0 4.795 0l3.424-3.426a3.39 3.39 0 0 0-4.794-4.795l-1.028.961" />
                                    </svg>
								</a>
							</div>
						</div>
					</c:forEach>
				</div>

			</div>

			<!-- second -->
			<div
				class="bg-white w-full flex-1 md:w-1/2 lg:w-1/4 flex flex-col gap-2 h-40 rounded-xl p-6 border border-gray-200 bg-opacity-30 backdrop-filter backdrop-blur-lg">
				<div class="font-semibold text-lg">Activity</div>
				<div class="font-semibold text-gray-500 text-sm">Survey
					Responses</div>
				<div style="width: 100%">
					<canvas id="lineChart"></canvas>
				</div>
			</div>
		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/flowbite@2.5.1/dist/flowbite.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

	<script>
		function getLastSixDays() {
			const daysArray = [];
			const currentDate = new Date();

			for (let i = 0; i < 6; i++) {
				const pastDate = new Date(currentDate);
				pastDate.setDate(currentDate.getDate() - i);
				const formattedDate = pastDate.toISOString().split('T')[0];
				daysArray.push(formattedDate);
			}

			return daysArray.reverse();
		}
		document.addEventListener("DOMContentLoaded", function() {
			"use strict";
			var data = {
				labels : getLastSixDays(),
				datasets : [
						{
							label : "Responses",
							data :
	<%=request.getAttribute("chartData")%>
		,
							backgroundColor : [ "rgba(255, 99, 132, 0.2)",
									"rgba(54, 162, 235, 0.2)",
									"rgba(255, 206, 86, 0.2)",
									"rgba(75, 192, 192, 0.2)",
									"rgba(153, 102, 255, 0.2)",
									"rgba(255, 159, 64, 0.2)", ],
							borderColor : [ "rgba(255,99,132,1)",
									"rgba(54, 162, 235, 1)",
									"rgba(255, 206, 86, 1)",
									"rgba(75, 192, 192, 1)",
									"rgba(153, 102, 255, 1)",
									"rgba(255, 159, 64, 1)", ],
							borderWidth : 1,
							fill : false,
						}, ],
			};

			var options = {
				scales : {
					y : {
						ticks : {
							beginAtZero : true,
						},
					},
				},
				legend : {
					display : false,
				},
				elements : {
					line : {
						tension : 0.5,
					},
					point : {
						radius : 0,
					},
				},
			};

			var lineChartCanvas = document.getElementById("lineChart");
			if (lineChartCanvas) {
				let lineChartInstance = new Chart(lineChartCanvas
						.getContext("2d"), {
					type : "line",
					data : data,
					options : options,
				});
			}
		});
	</script>

</body>
</html>
