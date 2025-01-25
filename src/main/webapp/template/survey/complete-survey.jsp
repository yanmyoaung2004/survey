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

@media (min-width: 860px) {
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

	<%
	List<Question> questions = (List<Question>) request.getAttribute("questions");
	%>

	<div
		class="p-5 container flex flex-col w-xl gap-3 border border-yellow-600 mx-auto"
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
							<h2 class="text-lg mt-1 sm:mb-0 text-gray-700">
								${survey.description }</h2>

						</div>
					</div>
				</div>
			</div>
		</div>



		<c:forEach var="question" items="${questions }" varStatus="status">
			<div class="w-full rounded-lg border border-gray-200">
				<div class="px-6 py-5 w-full">
					<div class="flex flex-col gap-1">
						<div class="w-full sm:flex justify-between items-start mb-1">
							<div class="flex flex-col w-full">
								<h2
									class="text-xs font-bold leading-snug truncate sm:mb-0 text-gray-700">
									Question ${status.index + 1}</h2>
								<h2 class="text-lg font-bold mb-1 sm:mb-0 text-gray-700">
									${question.question }</h2>
							</div>
						</div>
						<div class="flex flex-col gap-2">
							<c:choose>
								<c:when
									test="${question.questionType.equals('Multiple Choice')}">
									<c:forEach var="option" items="${question.answers }"
										varStatus="index">
										<div class="flex items-center mb-1">
											<input name="${status.index + 1}" type="checkbox"
												value="${option}"
												class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
											<label for=""
												class="ms-2 text-sm font-medium text-gray-700 dark:text-gray-300">${option }</label>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach var="option" items="${question.answers }">
										<div class="flex items-center mb-1">
											<input name="${status.index + 1}" type="radio"
												value="${option}"
												class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
											<label for="default-radio-1"
												class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">${option }</label>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>



			</div>
		</c:forEach>
		<div class="flex align-center pb-5 gap-5">

			<div onclick="submitSurveyForm()"
				class="flex align-center bg-green-500  px-2 py-2 rounded-xl text-white cursor-pointer hover:bg-green-700">
				<svg class="w-5 h-5 text-white dark:text-white" aria-hidden="true"
					xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					fill="none" viewBox="0 0 24 24">
		  					<path stroke="currentColor" stroke-linecap="round"
						stroke-linejoin="round" stroke-width="2"
						d="m8.032 12 1.984 1.984 4.96-4.96m4.55 5.272.893-.893a1.984 1.984 0 0 0 0-2.806l-.893-.893a1.984 1.984 0 0 1-.581-1.403V7.04a1.984 1.984 0 0 0-1.984-1.984h-1.262a1.983 1.983 0 0 1-1.403-.581l-.893-.893a1.984 1.984 0 0 0-2.806 0l-.893.893a1.984 1.984 0 0 1-1.403.581H7.04A1.984 1.984 0 0 0 5.055 7.04v1.262c0 .527-.209 1.031-.581 1.403l-.893.893a1.984 1.984 0 0 0 0 2.806l.893.893c.372.372.581.876.581 1.403v1.262a1.984 1.984 0 0 0 1.984 1.984h1.262c.527 0 1.031.209 1.403.581l.893.893a1.984 1.984 0 0 0 2.806 0l.893-.893a1.985 1.985 0 0 1 1.403-.581h1.262a1.984 1.984 0 0 0 1.984-1.984V15.7c0-.527.209-1.031.581-1.403Z" />
						</svg>
				<span class="text-sm pl-1.5">Submit Survey</span>
			</div>
		</div>

	</div>

	<!-- footer -->
	<c:import url="../common/footer.jsp" />
	<script>
	var questionList = [<%for (int i = 0; i < questions.size(); i++) {
	out.print("'" + questions.get(i).getQuestionId() + "'");
	if (i < questions.size() - 1) {
		out.print(", ");
	}
}%>];
	
	let data = [];
	let i = 1;

	function submitSurveyForm(){
		questionList.forEach(q => {
			data.push({
				questionId : q, 
				answers : getSelectedAnswers(i++)  
			});
		});
		let passedData = {
				questions : data,
				userId : 1
		}
		
		fetch('home?mode=SUBMIT', {
			method : 'POST',
    		headers : {
    			'Content-Type' : 'application/json'
    		},
    		body : JSON.stringify(passedData)
		}).then(response => {
    	    if (response.ok) {
    	        return response.text();
    	    } else {
    	        return response.json();
    	    }
    	})
    	.then(data => {
    	    if (typeof data === 'string') {
    	        window.location.href = 'home';
    	    } else {
    	        console.error('Survey submition failed:', data.message);
    	    }
    	})
    	.catch(error => console.error('Error:', error));
		
	}

	function getSelectedAnswers(id) {
	    const selectedValues = [];
		const btns = document.getElementsByName(id);

		if (btns[0].type === 'radio') {
			for (const radio of btns) {
		        if (radio.checked) {
		            selectedValues.push(radio.value); 
		            break;
		        }
		    }
		} else { 
			for (const checkbox of btns) {
		        if (checkbox.checked) {
		            selectedValues.push(checkbox.value);
		        }
		    }
		}
		
		return selectedValues;
	}
</script>

</body>
</html>