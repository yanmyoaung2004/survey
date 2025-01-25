<%@page import="com.yma.survey.model.Survey"%>
<%@page import="java.time.LocalDate"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>




<div id="message" class="hidden">
	<div id="toast-danger"
		class="flex items-center w-full max-w-xs p-4 mb-4 text-gray-500 bg-white rounded-lg shadow dark:text-gray-400 dark:bg-gray-800"
		role="alert"
		style="position: fixed; left: 50%; transform: translateX(-50%); top: 30px;">

		<div
			class="inline-flex items-center justify-center flex-shrink-0 w-8 h-8 text-red-500 bg-red-100 rounded-lg dark:bg-red-800 dark:text-red-200">
			<svg class="w-5 h-5" aria-hidden="true"
				xmlns="http://www.w3.org/2000/svg" fill="currentColor"
				viewBox="0 0 20 20">
            <path
					d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5Zm3.707 11.793a1 1 0 1 1-1.414 1.414L10 11.414l-2.293 2.293a1 1 0 0 1-1.414-1.414L8.586 10 6.293 7.707a1 1 0 0 1 1.414-1.414L10 8.586l2.293-2.293a1 1 0 0 1 1.414 1.414L11.414 10l2.293 2.293Z" />
        </svg>
			<span class="sr-only">Error icon</span>
		</div>
		<div class="ms-3 text-sm font-normal">Survey cannot be accessed!</div>
	</div>
</div>


<div id="completed" class="hidden">
	<div id="toast-danger"
		class="flex items-center w-full max-w-xs p-4 mb-4 text-gray-500 bg-white rounded-lg shadow dark:text-gray-400 dark:bg-gray-800"
		role="alert"
		style="position: fixed; left: 50%; transform: translateX(-50%); top: 30px;">

		<div
			class="inline-flex items-center justify-center flex-shrink-0 w-8 h-8 text-red-500 bg-red-100 rounded-lg dark:bg-red-800 dark:text-red-200">
			<svg class="w-5 h-5" aria-hidden="true"
				xmlns="http://www.w3.org/2000/svg" fill="currentColor"
				viewBox="0 0 20 20">
            <path
					d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5Zm3.707 11.793a1 1 0 1 1-1.414 1.414L10 11.414l-2.293 2.293a1 1 0 0 1-1.414-1.414L8.586 10 6.293 7.707a1 1 0 0 1 1.414-1.414L10 8.586l2.293-2.293a1 1 0 0 1 1.414 1.414L11.414 10l2.293 2.293Z" />
        </svg>
			<span class="sr-only">Error icon</span>
		</div>
		<div class="ms-3 text-sm font-normal">You have already participated!</div>
	</div>
</div>



<c:forEach var="survey" items="${surveys}">
	<div class="p-5 sm:ml-64 flex flex-col" style="font-weight: 400">
		<div class="max-w-5xl border border-gray-200 rounded-lg ">
			<div class="px-6 py-5">
				<div class="flex items-start pr-5">
					<svg
						class="w-10 h-10 text-gray-800 dark:text-white fill-current flex-shrink-0 mr-5"
						aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="30"
						height="30" viewBox="0 0 30 30" fill="none">
                            <path stroke="currentColor"
							stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
							d="M10 3v4a1 1 0 0 1-1 1H5m4 8h6m-6-4h6m4-8v16a1 1 0 0 1-1 1H6a1 1 0 0 1-1-1V7.914a1 1 0 0 1 .293-.707l3.914-3.914A1 1 0 0 1 9.914 3H18a1 1 0 0 1 1 1Z" />
                        </svg>

					<!-- Card content -->
					<div class="flex-grow truncate flex-1">
						<div class="w-full sm:flex justify-between items-center mb-3">
							<div class="flex justify-center align-center gap-5">
								<h2
									class="text-2xl leading-snug font-bold text-gray-50 truncate mb-1 sm:mb-0">
									${survey.title }</h2>

								<div>
									<c:choose>
										<c:when test="${survey.isActive && survey.surveyStarted }">
											<span
												class="bg-green-200 text-green-900 text-xs font-medium me-2 px-2.5 py-1 rounded dark:bg-green-900 dark:text-green-300">Active</span>
										</c:when>
										<c:when test="${survey.isActive && !survey.surveyStarted }">
											<span
												class="bg-purple-300 text-purple-900 text-xs font-medium me-2 px-2.5 py-1 rounded dark:bg-green-900 dark:text-green-300">Draft</span>
										</c:when>
										<c:otherwise>
											<span
												class="bg-red-200 text-red-900 text-xs font-medium me-2 px-2.5 py-1 rounded dark:bg-green-900 dark:text-green-300">Expired</span>
										</c:otherwise>
									</c:choose>

								</div>
							</div>
							<div class="flex-shrink-0 flex items-center space-x-3 sm:ml-2">
								<button
									class="flex items-center text-left text-sm font-medium hover:text-red-50 group focus:outline-none focus-visible:border-b focus-visible:border-indigo-100">
									<svg class="w-6 h-6 text-gray-800 dark:text-white"
										aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" fill="none" viewBox="0 0 24 24">
                                            <path stroke="currentColor"
											stroke-linecap="round" stroke-width="2"
											d="M4.5 17H4a1 1 0 0 1-1-1 3 3 0 0 1 3-3h1m0-3.05A2.5 2.5 0 1 1 9 5.5M19.5 17h.5a1 1 0 0 0 1-1 3 3 0 0 0-3-3h-1m0-3.05a2.5 2.5 0 1 0-2-4.45m.5 13.5h-7a1 1 0 0 1-1-1 3 3 0 0 1 3-3h3a3 3 0 0 1 3 3 1 1 0 0 1-1 1Zm-1-9.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0Z" />
                                        </svg>

									<span class="pl-2 text-gray-500 hover:text-gray-800">${survey.noOfPeopleCompleted }
										<span class="sr-only">completed</span>
									</span>
								</button>
							</div>
						</div>
						<!-- Card body -->
						<div
							class="flex items-end justify-between whitespace-normal w-full">
							<!-- Paragraph -->
							<div class="text-gray-700 text-md w-full">
								<p class="mb-4">${survey.description }</p>
								<div class="max-w-xs flex flex-col justify-between gap-2">
									<div class="flex ">
										<span class="text-gray-600 text-xs font-bold flex-1">Created
											By </span> <span class="text-gray-600 text-xs font-bold flex-1">:</span>
										<span class="text-gray-600 text-xs font-bold flex-1">${survey.user.username }
										</span>
									</div>
									<div class="flex">
										<span class="text-gray-600 text-xs font-bold flex-1">Created
											Date </span> <span class="text-gray-600 text-xs font-bold flex-1">:</span>
										<span class="text-gray-600 text-xs font-bold flex-1">${survey.creationDate }</span>
									</div>
								</div>
							</div>
							<c:url var="responseLink" value="response">
								<c:param name="mode" value="VIEW" />
								<c:param name="surveyId" value="${survey.surveyId}" />
							</c:url>
							<c:if test="${!survey.surveyStarted  }">
							<a
								onclick="expire()"
								class="cursor-pointer flex-shrink-0 flex items-center justify-center text-xs font-bold bg-green-600 text-white px-3 py-1.5 hover:bg-green-700 text-gray-700 w-15 h-15 rounded-full bg-gradient-to-b from-green-50 to-green-100 hover:from-white hover:to-green-50 focus:outline-none focus-visible:from-white focus-visible:to-white transition duration-150 ml-2"
								> View </a>
							
							</c:if>
							<c:if test="${survey.surveyStarted  }">
							<a
								class="flex-shrink-0 flex items-center justify-center text-xs font-bold bg-green-600 text-white px-3 py-1.5 hover:bg-green-700 text-gray-700 w-15 h-15 rounded-full bg-gradient-to-b from-green-50 to-green-100 hover:from-white hover:to-green-50 focus:outline-none focus-visible:from-white focus-visible:to-white transition duration-150 ml-2"
								href="${responseLink}"> View </a>
							
							</c:if>
							<c:choose>
								<c:when
									test="${pageContext.request.requestURI == '/survery_app/template/response-list.jsp'}">
								</c:when>
								<c:when
									test="${pageContext.request.requestURI == '/survery_app/template/index.jsp'}">
									<c:url var="surveyLink" value="home">
										<c:param name="mode" value="PARTICIPATE" />
										<c:param name="surveyId" value="${survey.surveyId }" />
									</c:url>
									<c:choose>
										<c:when test="${survey.completedByCurrentUser}">
											<span
												onclick="completed()"
												class="cursor-pointer flex-shrink-0 flex items-center justify-center text-xs font-bold bg-blue-600 text-white px-3 py-1.5  text-gray-700 w-15 h-15 rounded-full bg-gradient-to-b from-indigo-50 to-indigo-100 hover:from-white hover:to-indigo-50 focus:outline-none focus-visible:from-white focus-visible:to-white transition duration-150 ml-2"
												> Completed </span>
										</c:when>
										<c:when test="${survey.isActive && survey.surveyStarted }">
											<a
												class="flex-shrink-0 flex items-center justify-center text-xs font-bold bg-blue-600 text-white px-3 py-1.5 hover:bg-blue-700 text-gray-700 w-15 h-15 rounded-full bg-gradient-to-b from-indigo-50 to-indigo-100 hover:from-white hover:to-indigo-50 focus:outline-none focus-visible:from-white focus-visible:to-white transition duration-150 ml-2"
												href="${surveyLink }"> Complete </a>
										</c:when>

										
										<c:otherwise>
											<span onclick="expire()"
												class="cursor-pointer flex-shrink-0 flex items-center justify-center text-xs font-bold bg-blue-600 text-white px-3 py-1.5 hover:bg-blue-700 text-gray-700 w-15 h-15 rounded-full bg-gradient-to-b from-indigo-50 to-indigo-100 hover:from-white hover:to-indigo-50 focus:outline-none focus-visible:from-white focus-visible:to-white transition duration-150 ml-2">
												Complete </span>

										</c:otherwise>
									</c:choose>



								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>

<script>
	function expire() {
		const messageBox = document.getElementById('message');
		messageBox.classList.remove('hidden')
		setTimeout(function() {
			messageBox.classList.add("hidden");
		}, 2500);
	}
	function completed() {
		const messageBox = document.getElementById('completed');
		messageBox.classList.remove('hidden')
		setTimeout(function() {
			messageBox.classList.add("hidden");
		}, 2500);
	}
</script>

