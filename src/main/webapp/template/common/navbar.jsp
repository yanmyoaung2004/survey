<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<%
String title = request.getParameter("title");
String showBtn = request.getParameter("showBtn");
%>


<div class="p-5 sm:ml-64 flex justify-between" style="font-weight: 400">
	<p class="text-3xl font-bold hidden md:flex"><%=title%></p>

	<div class="flex gap-5 justify-between lg:justify-center align-center">
		<form class="max-w-md mx-auto" action="home" method="POST">
			<input type="hidden" name="mode" value="SEARCH"> <label
				for="default-search"
				class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white">Search</label>
			<div class="relative">
				<div
					class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
					<svg class="w-4 h-4 text-gray-500 dark:text-gray-400"
						aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
						viewBox="0 0 20 20">
                                <path stroke="currentColor"
							stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
							d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                            </svg>
				</div>
				<input type="search" id="search" name="search"
					class="block w-full p-3 ps-10 text-sm text-gray-900 border border-gray-300 rounded-xl bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
					placeholder="Search..." />
			</div>
		</form>
		<c:if test="TRUE">
			<div>
				<a href="home?mode=FORM"
					class="text-white bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-xl text-sm px-3 py-2.5 text-center me-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800 inline-flex items-center">
					<svg class="w-6 h-6 text-white dark:text-white" aria-hidden="true"
						xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="none" viewBox="0 0 24 24">
                            <path stroke="currentColor"
							stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
							d="M5 12h14m-7 7V5" />
                        </svg> <span class="pl-1.5">Create Survey</span>
				</a>
			</div>
		</c:if>

		<c:if test="${not empty sessionScope.user}">
			<div>
				<img class="w-10 h-10 rounded-full"
					src="https://th.bing.com/th/id/R.50b75a289fa726538066a479953a145a?rik=3jntFvTKUScxyg&pid=ImgRaw&r=0"
					alt="Rounded avatar" />
			</div>
		</c:if>
	</div>
</div>
