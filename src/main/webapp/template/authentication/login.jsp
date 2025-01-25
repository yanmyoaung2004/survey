<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign In Page</title>
<link
    href="https://cdn.jsdelivr.net/npm/flowbite@2.5.1/dist/flowbite.min.css"
    rel="stylesheet" />
</head>
<body>

    <div class="mx-auto max-w-xl w-full mt-10">
        <div class="flex flex-col justify-center items-center min-h-screen bg-gray-50 p-4">
            <h2 class="text-4xl font-extrabold mb-3 dark:text-white">Sign In</h2>
            <p class="text-base text-gray-500 mb-6 text-center dark:text-white">Welcome
                Back! Your insights help us grow and innovate. Log in to share your
                thoughts and see the impact.</p>
        </div>

        <form class="max-w-md mx-auto" action="sign-in" method="post">

            <div class="relative z-0 w-full mb-5 group">
                <input type="email" name="email" id="email"
                    class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                    placeholder=" " required /> 
                <label for="floating_email"
                    class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Email
                    address</label>
            </div>
            <div class="relative z-0 w-full mb-5 group">
                <input type="password" name="password" id="password"
                    class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                    placeholder=" " required /> 
                <label for="floating_password"
                    class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Password</label>
            </div>
            <button type="submit"
                class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Sign
                In</button>
        </form>
        <div class=" flex align-center justify-center">
			<p class="text-sm text-gray-500 font-semibold">
				Don't have an account?	<a href="sign-up" class="hover:text-gray-600">Register</a> 
			</p>
		</div>
    </div>

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
		<div class="ms-3 text-sm font-normal">Wrong credentials!</div>
	</div>
</div>

    <% Boolean ok = (Boolean) request.getAttribute("ok"); %>

    <script>
        function showToast() {
        	const messageBox = document.getElementById('message');
    		messageBox.classList.remove('hidden')
    		setTimeout(function() {
    			messageBox.classList.add("hidden");
            }, 2500);
            <%request.removeAttribute("ok"); %>

        }

        window.onload = function() {
            const message = "<%= ok != null ? ok.toString() : "" %>"; 
            if (message === "false") {
                showToast();
            }
        };
    </script>
    
</body>
</html>
