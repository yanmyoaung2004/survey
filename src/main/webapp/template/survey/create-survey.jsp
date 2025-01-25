 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/header.jsp" />
</head>
<body>
	<c:set var="questionIndex" value="1" />
	<c:import url="../common/side-bar.jsp" />


	<!-- body -->
	<h1
		class=" px-5 pt-5 pb-1 sm:ml-64 text-3xl font-bold leading-snug truncate mb-1 sm:mb-0 text-gray-900">Create
		Survey</h1>

	<div class="p-5 sm:ml-64 flex flex-col gap-3" id="create-container"
		style="font-weight: 400; position: relative; height: 100vh;">
		<div id="toast-container"
			class="hidden fixed top-5 left-1/2 transform -translate-x-1/2 flex items-center justify-center w-full max-w-sm"
			style="z-index: 1000;">

			<div id="toast"
				class="flex items-center p-4 mb-4 text-sm bg-red-100 text-red-600 rounded-lg shadow dark:bg-green-200 dark:text-green-900"
				role="alert">
				<svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true"
					xmlns="http://www.w3.org/2000/svg" fill="currentColor"
					viewBox="0 0 20 20">
    <path
						d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
  </svg>
				<span class="sr-only">Info</span>
				<div class="text-center">
					<span id="toast-message">Please fill all the required
						fields.</span>
				</div>
			</div>

		</div>




		<!-- Survey Title -->
		<div class="w-full rounded-lg border border-gray-200 ">
			<div class="px-6 py-5 w-full">
				<div class="flex items-start pr-5"></div>
				<div class="flex-grow truncate flex-1">
					<div class="w-full sm:flex justify-between items-center mb-3">
						<div
							class="flex justify-start md:justify-center align-center gap-5">
							<h2
								class="text-sm font-bold leading-snug truncate mb-1 sm:mb-0 text-gray-700">
								Survey Title</h2>
						</div>
					</div>
					<div class="flex flex-col gap-2 justify-center whitespace-normal">
						<input type="text" id="title"
							class="bg-gray-50  border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-300 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
							placeholder="Enter Your Survey Title" />
					</div>
				</div>
			</div>
		</div>

		<!-- description -->
		<div class="w-full rounded-lg border border-gray-200">
			<div class="px-6 py-5 w-full">
				<div class="flex items-start pr-5"></div>
				<div class="flex-grow truncate flex-1">
					<div class="flex flex-col gap-2 justify-center whitespace-normal">

						<label for="message"
							class="block mb-2 text-sm font-bold text-gray-700 dark:text-white">Survey
							Description</label>
						<textarea id="message" rows="4"
							class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
							placeholder="Survey Description..."></textarea>

					</div>
				</div>
			</div>
		</div>




		<!-- public or priavte -->
		<div class="w-full rounded-lg border border-gray-200">
			<div class="px-6 py-5 w-full">
				<div class="flex items-start pr-5"></div>
				<div class="flex-grow truncate flex-1">
					<div class="flex flex-col gap-2 justify-center whitespace-normal">
						<label for="skip"
							class="block text-sm font-bold text-gray-700 dark:text-white">Is
							this survey Public or Prvate?</label> <select id="isPublic"
							class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
							<option selected>Choose one</option>
							<option value="Private">Private</option>
							<option value="Public">Public</option>
						</select>

					</div>
				</div>
			</div>
		</div>

		<!-- 		date picker -->

		<div class="w-full rounded-lg border border-gray-200 ">
			<div class="px-6 py-5 w-full">
				<div class="flex items-start pr-5"></div>
				<div class="flex-grow truncate flex-1">
					<div class="flex flex-col lg:flex-row gap-2">

						<!-- 				start date -->
						<div class="flex-1">
							<div class="w-full sm:flex justify-between items-center mb-3">
								<div
									class="flex justify-start md:justify-center align-center gap-5">
									<h2
										class="text-sm font-bold leading-snug truncate mb-1 sm:mb-0 text-gray-700">
										Start Date</h2>
								</div>
							</div>
							<div class="flex flex-col md:flex-row gap-2 whitespace-normal">
								<!-- 						date -->
								<div class="relative max-w-md">
									<div
										class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
										<svg class="w-4 h-4 text-gray-500 dark:text-gray-400"
											aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
											fill="currentColor" viewBox="0 0 20 20">
						        <path
												d="M20 4a2 2 0 0 0-2-2h-2V1a1 1 0 0 0-2 0v1h-3V1a1 1 0 0 0-2 0v1H6V1a1 1 0 0 0-2 0v1H2a2 2 0 0 0-2 2v2h20V4ZM0 18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8H0v10Zm5-8h10a1 1 0 0 1 0 2H5a1 1 0 0 1 0-2Z" />
						      </svg>
									</div>
									<input id="startDate" datepicker datepicker-autohide
										type="text"
										class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
										placeholder="Select date">
								</div>
								<!-- 						time -->
								<div class="relative">
									<div
										class="absolute inset-y-0 end-0 top-0 flex items-center pe-3.5 pointer-events-none">
										<svg class="w-4 h-4 text-gray-500 dark:text-gray-400"
											aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
											fill="currentColor" viewBox="0 0 24 24">
					                <path fill-rule="evenodd"
												d="M2 12C2 6.477 6.477 2 12 2s10 4.477 10 10-4.477 10-10 10S2 17.523 2 12Zm11-4a1 1 0 1 0-2 0v4a1 1 0 0 0 .293.707l3 3a1 1 0 0 0 1.414-1.414L13 11.586V8Z"
												clip-rule="evenodd" />
					            </svg>
									</div>
									<input type="time" id="startTime"
										class="bg-gray-50 border leading-none border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
										min="09:00" max="18:00" value="00:00" required />
								</div>

							</div>
						</div>

						<!-- 				   end date -->
						<div class="flex-1">
							<div class="w-full sm:flex justify-between items-center mb-3">
								<div
									class="flex justify-start md:justify-center align-center gap-5">
									<h2
										class="text-sm font-bold leading-snug truncate mb-1 sm:mb-0 text-gray-700">
										End Date</h2>
								</div>
							</div>
							<div class="flex flex-col md:flex-row gap-2 whitespace-normal">
								<!-- 						date -->
								<div class="relative max-w-md ">
									<div
										class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
										<svg class="w-4 h-4 text-gray-500 dark:text-gray-400"
											aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
											fill="currentColor" viewBox="0 0 20 20">
						        <path
												d="M20 4a2 2 0 0 0-2-2h-2V1a1 1 0 0 0-2 0v1h-3V1a1 1 0 0 0-2 0v1H6V1a1 1 0 0 0-2 0v1H2a2 2 0 0 0-2 2v2h20V4ZM0 18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8H0v10Zm5-8h10a1 1 0 0 1 0 2H5a1 1 0 0 1 0-2Z" />
						      </svg>
									</div>
									<input id="endDate" datepicker datepicker-autohide type="text"
										class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
										placeholder="Select date">
								</div>
								<!-- 						time -->
								<div class="relative">
									<div
										class="absolute inset-y-0 end-0 top-0 flex items-center pe-3.5 pointer-events-none">
										<svg class="w-4 h-4 text-gray-500 dark:text-gray-400"
											aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
											fill="currentColor" viewBox="0 0 24 24">
					                <path fill-rule="evenodd"
												d="M2 12C2 6.477 6.477 2 12 2s10 4.477 10 10-4.477 10-10 10S2 17.523 2 12Zm11-4a1 1 0 1 0-2 0v4a1 1 0 0 0 .293.707l3 3a1 1 0 0 0 1.414-1.414L13 11.586V8Z"
												clip-rule="evenodd" />
					            </svg>
									</div>
									<input type="time" id="endTime"
										class="bg-gray-50 border leading-none border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
										min="09:00" max="18:00" value="00:00" required />
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>





		<!-- done  -->
		<div id="doneQuestion" class="flex flex-col gap-3"></div>



		<div class="w-full rounded-lg border border-gray-200" id="1">
			<div class="px-6 py-5 w-full">
				<div class="flex items-start pr-5">
					<div class="flex-grow truncate flex-1">
						<div class="w-full sm:flex justify-between items-center mb-3">
							<div
								class="flex justify-start md:justify-center align-center gap-5">
								<h2 id="Question 1"
									class="text-sm font-bold leading-snug truncate mb-1 sm:mb-0 text-gray-700">
									Question 1</h2>
							</div>
						</div>
						<div class="flex flex-col justify-center whitespace-normal">
							<label for="question"
								class="block mb-2 text-sm font-medium text-gray-800 dark:text-white">Question</label>
							<input type="text" id="question1"
								class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-300 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
								placeholder="Enter your question" />
							<div class="flex flex-col lg:flex-row w-full mt-5 gap-3">
								<div class="flex-1">
									<label for="questionType"
										class="block mb-2 text-sm font-medium text-gray-800 dark:text-white">Question
										Type</label> <select onchange="questionType(this)" id="questionType1"
										class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
										<option selected>Choose Question Type</option>
										<option value="Single Choice">Single Choice</option>
										<option value="Multiple Choice">Multiple Choice</option>
									</select>
								</div>
								<div class="flex-1 hidden">
									<label for="skip"
										class="block mb-2 text-sm font-medium text-gray-800 dark:text-white">Can
										this question be skipped?</label> <select id="skip1"
										class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
										<option selected>Choose one</option>
										<option value="Yes">Yes</option>
										<option value="No">No</option>
									</select>
								</div>
							</div>
							<fieldset class="mt-2" id="optionContainer1">
								<div class="flex items-center mb-4 hidden" id="answer1">
									<input type="radio" value=""
										class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600" />
									<label ondblclick="editLabel(this)" for="default-checkbox"
										class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">Option</label>
								</div>
							</fieldset>
							<div class="h-10 hidden" id="addOptionBtn1">
								<span onclick="addOption(this)" id="addOption1"
									class="bg-blue-600 hover:bg-blue-700 text-white text-xs font-medium me-2 px-3 py-1 rounded-lg dark:bg-blue-900 dark:text-blue-300 cursor-pointer">Add
									Option</span>
							</div>
							<div class="h-8 mt-3 flex justify-end align-center">
								<span onclick="confirm(this)" id="1"
									class="bg-green-500 hover:bg-green-700 text-white text-xs font-medium me-2 px-4 py-2 rounded-lg dark:bg-blue-900 dark:text-blue-300 cursor-pointer">
									Confirm </span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="flex align-center pb-5 gap-5">
			<div onclick="createNewQuestion()"
				class="flex bg-blue-600 px-2 py-2 rounded-xl text-white cursor-pointer hover:bg-blue-700">
				<svg class="w-5 h-5 text-white dark:text-white" aria-hidden="true"
					xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					fill="none" viewBox="0 0 24 24">
                        <path stroke="currentColor"
						stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
						d="M12 7.757v8.486M7.757 12h8.486M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
                    </svg>

				<span class="text-sm pl-1.5">Add Question</span>
			</div>
			<div onclick="completeSurvey()"
				class="flex align-center bg-green-500  px-2 py-2 rounded-xl text-white cursor-pointer hover:bg-green-700">
				<svg class="w-5 h-5 text-white dark:text-white" aria-hidden="true"
					xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					fill="none" viewBox="0 0 24 24">
  					<path stroke="currentColor" stroke-linecap="round"
						stroke-linejoin="round" stroke-width="2"
						d="m8.032 12 1.984 1.984 4.96-4.96m4.55 5.272.893-.893a1.984 1.984 0 0 0 0-2.806l-.893-.893a1.984 1.984 0 0 1-.581-1.403V7.04a1.984 1.984 0 0 0-1.984-1.984h-1.262a1.983 1.983 0 0 1-1.403-.581l-.893-.893a1.984 1.984 0 0 0-2.806 0l-.893.893a1.984 1.984 0 0 1-1.403.581H7.04A1.984 1.984 0 0 0 5.055 7.04v1.262c0 .527-.209 1.031-.581 1.403l-.893.893a1.984 1.984 0 0 0 0 2.806l.893.893c.372.372.581.876.581 1.403v1.262a1.984 1.984 0 0 0 1.984 1.984h1.262c.527 0 1.031.209 1.403.581l.893.893a1.984 1.984 0 0 0 2.806 0l.893-.893a1.985 1.985 0 0 1 1.403-.581h1.262a1.984 1.984 0 0 0 1.984-1.984V15.7c0-.527.209-1.031.581-1.403Z" />
				</svg>
				<span class="text-sm pl-1.5">Complete Survey</span>
			</div>
		</div>

	</div>


	<script>
        let questions = [];
        
        function formatToJavaDateTime(date, time) {
        	const formattedDate = convertDate(date);
            const formattedTime = time + `:00`;
            return formattedDate + ' ' + formattedTime;
        }
        
        function convertDate(dateString) {
            const [month, day, year] = dateString.split('/');
            return year + '-' + month + '-' + day;
        }
        

        function completeSurvey(){
        	const startDate = document.getElementById("startDate").value;
        	const startTime = document.getElementById("startTime").value;
        	const endDate = document.getElementById("endDate").value;
            const endTime = document.getElementById("endTime").value;
            if(startDate === "" || endDate === ""){
            	return;
            }
            
            const startDateTimeFormatted = formatToJavaDateTime(startDate, startTime);
            const endDateTimeFormatted = formatToJavaDateTime(endDate, endTime);
			const startDateTime = new Date(startDateTimeFormatted); 
			const endDateTime = new Date(endDateTimeFormatted);
			
            if (endDateTime < startDateTime) {
		        return;
    		}
            
        	const title = document.getElementById("title");
        	const description = document.getElementById("message");
        	const isPublic = document.getElementById("isPublic");
        	let data = {
        		title : title.value,
        		description : description.value,
        		isPublic : isPublic.value === "Private" ? false : true,
        		questions : questions,
        		startDateTime : startDateTimeFormatted,
        		endDateTime : endDateTimeFormatted
        	}
        	console.log(data)
        	fetch('home?mode=CREATE', {
        		method : 'POST',
        		headers : {
        			'Content-Type' : 'application/json'
        		},
        		body : JSON.stringify(data)
        	}).then(response => {
        	    if (response.ok) {
        	        return response.text();
        	    } else {
        	        return response.json();
        	    }
        	})
        	.then(data => {
        	    if (typeof data === 'string') {
        	        console.log('Survey created successfully');
        	        window.location.href = 'home';
        	    } else {
        	        console.error('Survey creation failed:', data.message);
        	    }
        	})
        	.catch(error => console.error('Error:', error));
        }
        
        function renderDoneQuestion() {
            var questionContainer = document.getElementById("doneQuestion");
            while (questionContainer.firstChild) {
                questionContainer.removeChild(questionContainer.firstChild);
            }
            if (Array.isArray(questions) && questions.length > 0) {
                questions.forEach(e => {
                    let questionDiv = document.createElement("div");
                    questionDiv.className = "w-full rounded-lg border border-gray-200";
                    const numberStr = e.questionNumber.replace(/\D/g, "");
                    

                    questionDiv.id = parseInt(numberStr, 10);
                    questionDiv.innerHTML = `
                        <div class="px-6 pt-3 pb-0 w-full">
                            <div class="flex items-start pr-5">
                                <div class="flex-grow truncate flex-1">
                                    <div class="w-full sm:flex justify-between items-center mb-3">
                                        <div class="flex justify-start md:justify-center align-center gap-5">
                                            <h2 class="text-sm font-bold leading-snug truncate mb-1 sm:mb-0 text-gray-700">
                                                `+e.questionNumber+`
                                            </h2>
                                        </div>
                                    </div>
                                    <div class="flex flex-col md:flex-row justify-between whitespace-normal">
                                        <div class="w-3xl mb-3">
                                            <p class="mb-4 mr-3 text-gray-900 text-lg">`+e.question+`</p>
                                            <h2 class="text-sm leading-snug truncate mb-1 sm:mb-0 text-gray-700">
                                                Question Type: `+ e.questionType +`
                                            </h2>
                                            <div class="flex-shrink-0 flex items-start mt-3 justify-start md:justify-center">
                                                <span
                                                id="`+e.questionNumber+`"
                                                	onClick="editQuestion(this)"
                                                    class="px-1 text-blue-700 hover:text-white border border-blue-900 hover:bg-blue-800  font-medium rounded-lg text-xs text-center me-2 mb-2 dark:border-blue-500 dark:text-blue-500 dark:hover:text-white dark:hover:bg-blue-500 cursor-pointer">
                                                    Edit
                                                </span>
                                                <span
													id="`+e.questionNumber+`"
                                                	onClick="deleteQuestion(this)"
                                                    class="px-1 text-red-700 hover:text-white border border-red-900 hover:bg-red-800  font-medium rounded-lg text-xs text-center me-2 mb-2 dark:border-red-500 dark:text-red-500 dark:hover:text-white dark:hover:bg-red-600 cursor-pointer">
                                                    Delete
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    `;
                    questionContainer.appendChild(questionDiv);
                });
            }
        }
        function deleteQuestion(element) {
            questions = questions.filter(e => e.questionNumber !== element.id);
            let i = 1;
            questions.forEach(e => {
                e.questionNumber = e.questionNumber.slice(0, 8) + i;
                i++;
            });
            renderDoneQuestion();
        }


        
        function editQuestion(element){
        	
        	const numberStr = element.id.replace(/\D/g, "");
            const index = parseInt(numberStr, 10);
            let root = document.querySelector(`div#\\3` + index);
       	
        	 while (root.firstChild) {
        	        root.removeChild(root.firstChild);
        	 }
        	
        	const existingIndex = questions.findIndex(q => q.questionNumber === element.id);
        	let question = questions[existingIndex];
        	
         	const otherOptionValueType = question.type === 'Single Choice' ? 'Multiple Choice' : 'Single Choice';
        	const otherOptionValueSkip = question.skippable === 'Yes' ? 'No' : 'Yes';
			 root.innerHTML =
                 `<div class="px-6 py-5 w-full">
                         <div class="flex items-start pr-5">
                             <div class="flex-grow truncate flex-1">
                                 <div
                                     class="w-full sm:flex justify-between items-center mb-3"
                                 >
                                     <div
                                         class="flex justify-center align-center gap-5"
                                     >
                                         <h2
                                             id="`+ question.questionNumber +`"
                                             class="text-sm font-bold leading-snug truncate mb-1 sm:mb-0 text-gray-700"
                                         >
                                              ` + question.questionNumber + `
                                         </h2>
                                     </div>
                                 </div>
                                 <div
                                     class="flex flex-col justify-center whitespace-normal"
                                 >
                                     <label
                                         for="question"
                                         class="block mb-2 text-sm font-medium text-gray-800 dark:text-white"
                                         >Question</label
                                     >
                                     <input
                                         type="text"
                                         id="question`+index+`"
                                         value="`+ question.question +`"
                                         class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-300 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                         placeholder="Enter your question"
                                     />
                                     <div
                                         class="flex flex-col lg:flex-row w-full mt-5 gap-3"
                                     >
                                         <div class="flex-1">
                                             <label
                                                 for="questionType"
                                                 class="block mb-2 text-sm font-medium text-gray-800 dark:text-white"
                                                 >Question Type</label
                                             >
                                             <select
                                                 onchange="questionType(this)"
                                                 id="questionType`+index+`"
                                                 class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                             >
                                                 <option selected value="` + question.type + `">
                                                 ` + question.type + `
                                                 </option>
                                                 <option value="`+ otherOptionValueType +`">
                                                 	`+otherOptionValueType+`
                                                 </option>
                                             </select>
                                         </div>
                                         <div class="flex-1">
                                             <label
                                                 for="skip"
                                                 class="block mb-2 text-sm font-medium text-gray-800 dark:text-white"
                                                 >Can this question be
                                                 skipped?</label
                                             >
                                             <select
                                                 id="skip`+index+`"
                                                 class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                             >
                                                 <option selected value="`+question.skippable+`">`+question.skippable+`</option>
                                                 <option value="`+otherOptionValueSkip+`">`+otherOptionValueSkip+`</option>
                                             </select>
                                         </div>
                                     </div>
                                     <fieldset class="mt-2" id="optionContainer`+index+`">

                             </fieldset>
                                     <div class="h-10" id="addOptionBtn`+index+`">
                                         <span
                                             onclick="addOption(this)"
                                             id="addOption`+index+`"
                                             class="bg-blue-600 hover:bg-blue-700 text-white text-xs font-medium me-2 px-3 py-1 rounded-lg dark:bg-blue-900 dark:text-blue-300 cursor-pointer"
                                             >Add Option</span
                                         >
                                     </div>
                                     <div
                                            
                                         class="h-8 mt-3 flex justify-end align-center"
                                       
                                     >
                                         <span
                                         onclick="confirm(this)"
                                         id=` +
                                             index +
                                             `
                                             class="bg-green-500 hover:bg-green-700 text-white text-xs font-medium me-2 px-4 py-2 rounded-lg dark:bg-blue-900 dark:text-blue-300 cursor-pointer"
                                             >Confirm</span
                                         >
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>`;
                     const optionContainer = document.getElementById("optionContainer"+index);
                     question.answers.forEach((a) => {
                         const newOption = document.createElement('div');
                         newOption.className = "flex items-center mb-4";
                         newOption.id = "answer" + index;
                         
                         newOption.innerHTML = `
                             <input
                                 type="radio"
                                 name="answerGroup"
                                 value="${a}"
                                 class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
                             />
                             <label
                                 ondblclick="editLabel(this)"
                                 for="answer${index}"
                                 class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300"
                             >
                                 `+a+`
                             </label>
                         `;

                         optionContainer.appendChild(newOption);
                     });
	
        }
	
	
            function confirm(element) {
            	let divElement = document.querySelector(`div#\\3` + element.id);
            	
                const questionNumber = document
                    .getElementById("Question " + element.id)
                    .innerText.trim();        
                const question = document
                    .getElementById("question" + element.id)
                    .value.trim();
                const type = document.getElementById(
                    "questionType" + element.id
                ).value;
                const skippable = document.getElementById(
                    "skip" + element.id
                ).value;
                const answer = document.getElementById(
                    "optionContainer" + element.id
                );
                const child = answer.children;
                let answers = [];
                for (let i = 0; i < child.length; i++) {
                    const lblElement = child[i].querySelector("label");
                    answers.push(lblElement.textContent);
                }
                
                if (!questionNumber || !question || !type || !skippable || answers.length === 0) {
                   	const alert = document.getElementById("toast-container");
                   	if(alert){
                   		alert.classList.remove("hidden");
                        setTimeout(function() {
                        	alert.classList.add("hidden");
                        }, 3000);
                   	}
                }else{
                	const existingIndex = questions.findIndex(q => q.questionNumber === questionNumber);
                	if (existingIndex !== -1) {
                	    questions[existingIndex] = {
                	        questionNumber: questionNumber,
                	        question: question,
                	        type: type,
                	        skippable: skippable,
                	        answers: answers
                	    };
                	}else{
                	questions.push({
                		questionNumber: questionNumber,
                	    question: question,
                	    questionType: type,
                	    skippable: skippable,
                	    answers: answers
                	});                		
                	}
                	
                    renderDoneQuestion();
                    divElement.remove();
                    console.log(questions);
                }
              }

            
            let index = 1;
            
            function createNewQuestion() {
            	if(questions.length > 0){
            		index = questions.length + 1;
            	}else{            		
            	index++;
            	}
            	
            	const container = document.getElementById("create-container");
                const newQuestion = document.createElement("div");
                newQuestion.className =
                    "w-full rounded-lg border border-gray-200";
                newQuestion.id = index;
                newQuestion.innerHTML =
                    `<div class="px-6 py-5 w-full">
                            <div class="flex items-start pr-5">
                                <div class="flex-grow truncate flex-1">
                                    <div
                                        class="w-full sm:flex justify-between items-center mb-3"
                                    >
                                        <div
                                            class="flex justify-center align-center gap-5"
                                        >
                                            <h2
                                                id="Question `+index+`"
                                                class="text-sm font-bold leading-snug truncate mb-1 sm:mb-0 text-gray-700"
                                            >
                                                Question ` + index + `
                                            </h2>
                                        </div>
                                    </div>
                                    <div
                                        class="flex flex-col justify-center whitespace-normal"
                                    >
                                        <label
                                            for="question"
                                            class="block mb-2 text-sm font-medium text-gray-800 dark:text-white"
                                            >Question</label
                                        >
                                        <input
                                            type="text"
                                            id="question`+index+`"
                                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-300 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                            placeholder="Enter your question"
                                        />
                                        <div
                                            class="flex flex-col lg:flex-row w-full mt-5 gap-3"
                                        >
                                            <div class="flex-1">
                                                <label
                                                    for="questionType"
                                                    class="block mb-2 text-sm font-medium text-gray-800 dark:text-white"
                                                    >Question Type</label
                                                >
                                                <select
                                                    onchange="questionType(this)"
                                                    id="questionType`+index+`"
                                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                                >
                                                    <option selected>
                                                        Choose Question Type
                                                    </option>
                                                    <option value="Single Choice">
                                                        Single Choice
                                                    </option>
                                                    <option value="Multiple Choice">
                                                        Multiple Choice
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="flex-1 hidden">
                                                <label
                                                    for="skip"
                                                    class="block mb-2 text-sm font-medium text-gray-800 dark:text-white"
                                                    >Can this question be
                                                    skipped?</label
                                                >
                                                <select
                                                    id="skip`+index+`"
                                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                                >
                                                    <option selected>Choose one</option>
                                                    <option value="Yes">Yes</option>
                                                    <option value="No">No</option>
                                                </select>
                                            </div>
                                        </div>
                                        <fieldset class="mt-2" id="optionContainer`+index+`">
                                    <div
                                        class="flex items-center mb-4 hidden"
                                        id="answer`+index+`"
                                    >
                                        <input
                                            type="radio"
                                            value=""
                                            class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
                                        />
                                        <label
                                            ondblclick="editLabel(this)"
                                            for="default-checkbox"
                                            class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300"
                                            >Option</label
                                        >
                                    </div>
                                </fieldset>
                                        <div class="h-10 hidden" id="addOptionBtn`+index+`">
                                            <span
                                                onclick="addOption(this)"
                                                id="addOption`+index+`"
                                                class="bg-blue-600 hover:bg-blue-700 text-white text-xs font-medium me-2 px-3 py-1 rounded-lg dark:bg-blue-900 dark:text-blue-300 cursor-pointer"
                                                >Add Option</span
                                            >
                                        </div>
                                        <div
                                               
                                            class="h-8 mt-3 flex justify-end align-center"
                                          
                                        >
                                            <span
                                            onclick="confirm(this)"
                                            id=` +
                                                index +
                                                `
                                                class="bg-green-500 hover:bg-green-700 text-white text-xs font-medium me-2 px-4 py-2 rounded-lg dark:bg-blue-900 dark:text-blue-300 cursor-pointer"
                                                >Confirm</span
                                            >
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>`;
                const lastChild = container.lastElementChild;
                container.insertBefore(newQuestion, lastChild);
            }

            function questionType(element) {
                const numberStr = element.id.replace(/\D/g, "");
                const index = parseInt(numberStr, 10);
                const showBtn = document.getElementById("addOptionBtn" + index);
                const container = document.getElementById(
                    "optionContainer" + index
                );
                const children = container.children;
                const answer = document.getElementById("answer" + index);

                if (answer) {
                    answer.classList.remove("hidden");
                }

                if (showBtn) {
                    showBtn.classList.remove("hidden");
                }
                if (element.value === "single") {
                    for (let i = 0; i < children.length; i++) {
                        const inputElement = children[i].querySelector("input");
                        inputElement.className =
                            "w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300 dark:focus:ring-blue-600 dark:focus:bg-blue-600 dark:bg-gray-700 dark:border-gray-600";
                        inputElement.type = "radio";
                    }
                } else {
                    for (let i = 0; i < children.length; i++) {
                        const inputElement = children[i].querySelector("input");
                        inputElement.type = "checkbox";
                        inputElement.className =
                            "w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600";
                    }
                }
            }

            function addOption(element) {
                const numberStr = element.id.replace(/\D/g, "");
                const index = parseInt(numberStr, 10);
                const type = document.getElementById("questionType" + index);
                const container = document.getElementById(
                    "optionContainer" + index
                );
                const newElement = document.createElement("div");
                newElement.className = "flex items-center mb-4";
                if (type.value === "single") {
                    newElement.innerHTML = `<input
                                                        type="radio"
                                                        value="option 1"
                                                        class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300 dark:focus:ring-blue-600 dark:focus:bg-blue-600 dark:bg-gray-700 dark:border-gray-600"
                                                    />
                                                    <label
                                                        ondblclick="editLabel(this)"
                                                        id="editLabel"
                                                        for="country-option-1"
                                                        class="block ms-2 text-sm font-medium text-gray-900 dark:text-gray-300"
                                                    >
                                                        Option
                                                    </label>`;
                } else {
                    newElement.innerHTML = ` <input
                                                    id="default-checkbox"
                                                    type="checkbox"
                                                    value=""
                                                    class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
                                                />
                                                <label
                                                    ondblclick="editLabel(this)"
                                                    for="default-checkbox"
                                                    class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300"
                                                    >Option</label
                                                >`;
                }
                container.appendChild(newElement);
            }

            function editLabel(labelElement) {
                const currentValue = labelElement.textContent;
                const input = document.createElement("input");
                input.type = "text";
                input.value = currentValue.trim();
                input.className =
                    "block text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer";
                labelElement.replaceWith(input);
                input.focus();
                input.addEventListener("blur", () => {
                    setTimeout(() => {
                        labelElement.textContent = input.value;
                        input.replaceWith(labelElement);
                    }, 0);
                });

                input.addEventListener("keypress", (e) => {
                    if (e.key === "Enter") {
                        labelElement.textContent = input.value;
                        input.replaceWith(labelElement);
                    }
                });
            }
        </script>
	<c:import url="../common/footer.jsp" />

</body>
</html>


