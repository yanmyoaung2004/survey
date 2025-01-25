
<div class="p-5 sm:ml-64 flex flex-col gap-3 justify-between"
	style="font-weight: 400">
	<div class="w-full rounded-lg border border-gray-200">
		<div class="px-6 py-5 w-full">
			<div class="flex items-start pr-5">
				<div class="flex-grow truncate flex-1">
					<div class="w-full sm:flex justify-between items-center mb-3">
						<div class="flex justify-center align-center gap-5">
							<h2
								class="text-sm font-bold leading-snug truncate mb-1 sm:mb-0 text-gray-700">
								Question 2</h2>
						</div>
					</div>
					<div class="flex flex-col justify-center whitespace-normal">
						<label for="question"
							class="block mb-2 text-sm font-medium text-gray-800 dark:text-white">Question</label>
						<input type="email" id="question"
							class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-300 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
							placeholder="Enter your question" />
						<div class="flex flex-col lg:flex-row w-full mt-5 gap-3">
							<div class="flex-1">
								<label for="questionType"
									class="block mb-2 text-sm font-medium text-gray-800 dark:text-white">Question
									Type</label> <select onchange="questionType(this)" id="questionType"
									class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
									<option selected>Choose Question Type</option>
									<option value="single">Single Choice</option>
									<option value="multiple">Multiple Choice</option>
								</select>
							</div>
							<div class="flex-1">
								<label for="countries"
									class="block mb-2 text-sm font-medium text-gray-800 dark:text-white">Can
									this question be skipped?</label> <select id="countries"
									class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
									<option selected>Choose one</option>
									<option value="yes">Yes</option>
									<option value="no">No</option>
								</select>
							</div>
						</div>
						<fieldset class="mt-2" id="optionContainer">
							<div class="flex items-center mb-4 hidden" id="radioAnswer">
								<input type="radio" value="option 1"
									class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300 dark:focus:ring-blue-600 dark:focus:bg-blue-600 dark:bg-gray-700 dark:border-gray-600" />
								<label ondblclick="editLabel(this)" id="editLabel"
									for="country-option-1"
									class="block ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">
									Option </label>
							</div>

							<div class="flex items-center mb-4 hidden" id="checkboxAnswer">
								<input type="checkbox" value=""
									class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600" />
								<label ondblclick="editLabel(this)" for="default-checkbox"
									class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">Option</label>
							</div>
						</fieldset>
						<div class="h-10 hidden" id="addOptionBtn">
							<span onclick="addOption(this)"
								class="bg-blue-600 hover:bg-blue-700 text-white text-xs font-medium me-2 px-3 py-1 rounded-lg dark:bg-blue-900 dark:text-blue-300 cursor-pointer">Add
								Option</span>
						</div>
						<div class="h-8 mt-3 flex justify-end align-center" id="confirm">
							<span
								class="bg-green-500 hover:bg-green-700 text-white text-xs font-medium me-2 px-4 py-2 rounded-lg dark:bg-blue-900 dark:text-blue-300 cursor-pointer">Confirm</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
            function questionType(element) {
                const showBtn = document.getElementById("addOptionBtn");
                const radio = document.getElementById("radioAnswer");
                const check = document.getElementById("checkboxAnswer");
                const container = document.getElementById("optionContainer");
                const children = container.children;

                if (showBtn) {
                    showBtn.classList.remove("hidden");
                }
                if (element.value === "single") {
                    if (radio) {
                        for (let i = 0; i < children.length; i++) {
                            const inputElement =
                                children[i].querySelector("input");
                            inputElement.className =
                                "w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300 dark:focus:ring-blue-600 dark:focus:bg-blue-600 dark:bg-gray-700 dark:border-gray-600";
                            inputElement.type = "radio";
                        }
                    }
                } else {
                    if (check) {
                        for (let i = 0; i < children.length; i++) {
                            const inputElement =
                                children[i].querySelector("input");
                            inputElement.className =
                                "w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600";
                            inputElement.type = "radio";
                        }
                    }
                }
            }

            function addOption(element) {
                const type = document.getElementById("questionType");
                const container = document.getElementById("optionContainer");
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
