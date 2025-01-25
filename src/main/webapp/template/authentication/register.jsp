<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/flowbite@2.5.1/dist/flowbite.min.css"
	rel="stylesheet" />
</head>
<body>

	<div class="mx-auto max-w-xl w-full mt-10">
		<div
			class="flex flex-col justify-center items-center min-h-screen bg-gray-50 p-4">
			<h2 class="text-4xl font-extrabold mb-3 dark:text-white">Sign Up</h2>
			<p class="text-base text-gray-500 mb-6 text-center dark:text-white">Become
				a part of our survey community and help us understand what matters
				most. Register now to contribute your thoughts and ideas!</p>
		</div>

		<form class="max-w-md mx-auto" action="sign-up" method="post">
			<div class="relative z-0 w-full mb-5 group">
				<input type="text" name="username" id="username"
					class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
					placeholder=" " required /> <label for="floating_username"
					class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Username</label>
			</div>
			<div class="relative z-0 w-full mb-5 group">
				<input type="email" name="email" id="email"
					class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
					placeholder=" " required /> <label for="floating_email"
					class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Email
					address</label>
			</div>
			<div class="relative z-0 w-full mb-5 group">
				<input type="password" name="password"
					id="password"
					class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
					placeholder=" " required /> <label for="floating_password"
					class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Password</label>
			</div>
			<div class="relative z-0 w-full mb-5 group">
				<input type="password" name="confirm_password"
					id="confirm_password"
					class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
					placeholder=" " required /> <label for="floating_repeat_password"
					class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Confirm
					password</label>
			</div>
			<button type="submit"
				class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Sign
				Up</button>
		</form>
		<div class=" flex align-center justify-center">
			<p class="text-sm text-gray-500 font-semibold">
				Already have an account?	<a href="sign-in" class="hover:text-gray-600">Sign in</a> 
			</p>
		</div>
		
	</div>
	
	<div id="toast-container" class="fixed top-5 left-1/2 transform -translate-x-1/2">
        <div id="toast" class="hidden flex items-center p-4 mb-4 text-sm bg-red-100 text-red-800 rounded-lg shadow dark:bg-green-200 dark:text-green-900" role="alert">
            <svg class="w-5 h-5 mr-3 dark:text-green-800" aria-hidden="true" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m-2 2h6M5 12L3 9l4-4m-2 2H2"></path>
            </svg>
            <div class="text-center">
                <span id="toast-message"></span>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.1/dist/flowbite.min.js"></script>
    <script>
        function showToast(message) {
            const toast = document.getElementById("toast");
            const toastMessage = document.getElementById("toast-message");
            toastMessage.textContent = message;
            toast.classList.remove("hidden");
            
            setTimeout(function() {
                toast.classList.add("hidden");
            }, 2500);
            
            <%session.removeAttribute("toastMessage"); %>
        }

        window.onload = function() {
            const message = "<%= request.getAttribute("toastMessage") != null ? request.getAttribute("toastMessage") : "" %>";
            if (message !== "") {
                showToast(message);
            }
        };
    </script>
</body>
</html>