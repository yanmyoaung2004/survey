<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<button data-drawer-target="logo-sidebar"
	data-drawer-toggle="logo-sidebar" aria-controls="logo-sidebar"
	type="button"
	class="inline-flex items-center p-2 mt-2 ms-3 text-sm text-gray-500 rounded-lg sm:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600">
	<span class="sr-only">Open sidebar</span>
	<svg class="w-6 h-6" aria-hidden="true" fill="currentColor"
		viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path clip-rule="evenodd" fill-rule="evenodd"
			d="M2 4.75A.75.75 0 012.75 4h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 4.75zm0 10.5a.75.75 0 01.75-.75h7.5a.75.75 0 010 1.5h-7.5a.75.75 0 01-.75-.75zM2 10a.75.75 0 01.75-.75h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 10z"></path>
            </svg>
</button>

<aside id="logo-sidebar"
	class="fixed top-0 left-0 z-40 w-64 h-screen transition-transform -translate-x-full sm:translate-x-0 border-r border-gray-200 dark:border-gray-700"
	aria-label="Sidebar">
	<div
		class="h-full px-3 py-4 overflow-y-auto bg-gray-50 dark:bg-gray-800">
		<a href="home" class="flex items-center ps-2.5 mb-5"> <img
			src="https://play-lh.googleusercontent.com/QBR4_b0G2bXWnNx8WOOL-3XmSC6yLkBrX8IuAM6Jpq_aDTnB3crN8GI0bdIp1eJPrW8"
			class="h-6 me-3 sm:h-7" alt="Logo" /> <span
			class="self-center text-xl font-semibold whitespace-nowrap dark:text-white">Surveys</span>
		</a>
		<ul class="space-y-2 font-medium">

			<c:if test="${not empty sessionScope.user}">

				<li><a href="dashboard"
					class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
						<svg
							class="flex-shrink-0 w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white"
							aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24"
							height="24" fill="none" viewBox="0 0 24 24">
  <path stroke="currentColor" stroke-linejoin="round" stroke-width="2"
								d="M4 5a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V5Zm16 14a1 1 0 0 1-1 1h-4a1 1 0 0 1-1-1v-2a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v2ZM4 13a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v6a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-6Zm16-2a1 1 0 0 1-1 1h-4a1 1 0 0 1-1-1V5a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v6Z" />
</svg> <span class="ms-3">Dashboard</span>
				</a></li>



			</c:if>
			<li><a href="home"
				class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
					<svg
						class="flex-shrink-0 w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white"
						aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24"
						height="24" fill="none" viewBox="0 0 24 24">
                                <path stroke="currentColor"
							stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
							d="M10 3v4a1 1 0 0 1-1 1H5m4 8h6m-6-4h6m4-8v16a1 1 0 0 1-1 1H6a1 1 0 0 1-1-1V7.914a1 1 0 0 1 .293-.707l3.914-3.914A1 1 0 0 1 9.914 3H18a1 1 0 0 1 1 1Z" />
                            </svg> <span class="flex-1 ms-3 whitespace-nowrap">
						Surveys</span>
			</a></li>
			<c:if test="${not empty sessionScope.user}">
				<li><a href="response"
					class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
						<svg
							class="flex-shrink-0 w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white"
							aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24"
							height="24" fill="none" viewBox="0 0 24 24">
                                <path stroke="currentColor"
								stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
								d="M3 15v4m6-6v6m6-4v4m6-6v6M3 11l6-5 6 5 5.5-5.5" />
                            </svg> <span class="flex-1 ms-3 whitespace-nowrap">Responses</span>
				</a></li>
			</c:if>
			
			<c:if test="${not empty sessionScope.user}">
				<li><a href="/survery_app/sign-in?mode=LOG_OUT"
				class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
					<svg
						class="flex-shrink-0 w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white"
						aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24"
						height="24" fill="none" viewBox="0 0 24 24">
                                <path stroke="currentColor"
							stroke-linecap="square" stroke-linejoin="round" stroke-width="2"
							d="M10 19H5a1 1 0 0 1-1-1v-1a3 3 0 0 1 3-3h2m10 1a3 3 0 0 1-3 3m3-3a3 3 0 0 0-3-3m3 3h1m-4 3a3 3 0 0 1-3-3m3 3v1m-3-4a3 3 0 0 1 3-3m-3 3h-1m4-3v-1m-2.121 1.879-.707-.707m5.656 5.656-.707-.707m-4.242 0-.707.707m5.656-5.656-.707.707M12 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                            </svg> <span class="flex-1 ms-3 whitespace-nowrap">
						Logout</span>
			</a></li>
			</c:if>
				<c:if test="${empty sessionScope.user}">
				<li><a href="/survery_app/sign-in"
				class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
					<svg
						class="flex-shrink-0 w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white"
						aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24"
						height="24" fill="none" viewBox="0 0 24 24">
                                <path stroke="currentColor"
							stroke-linecap="square" stroke-linejoin="round" stroke-width="2"
							d="M10 19H5a1 1 0 0 1-1-1v-1a3 3 0 0 1 3-3h2m10 1a3 3 0 0 1-3 3m3-3a3 3 0 0 0-3-3m3 3h1m-4 3a3 3 0 0 1-3-3m3 3v1m-3-4a3 3 0 0 1 3-3m-3 3h-1m4-3v-1m-2.121 1.879-.707-.707m5.656 5.656-.707-.707m-4.242 0-.707.707m5.656-5.656-.707.707M12 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                            </svg> <span class="flex-1 ms-3 whitespace-nowrap">
						Login</span>
			</a></li>
			</c:if>
			



		</ul>
	</div>
</aside>

