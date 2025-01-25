<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Created</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@3.2.4/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/flowbite@1.6.0/dist/flowbite.min.css" rel="stylesheet">
</head>
<body>
    <div id="toast-container" class="fixed top-5 left-1/2 transform -translate-x-1/2">
        <div id="toast" class="hidden flex items-center p-4 mb-4 text-sm text-green-800 bg-green-100 rounded-lg shadow dark:bg-green-200 dark:text-green-900" role="alert">
            <svg class="w-5 h-5 mr-3 text-green-700 dark:text-green-800" aria-hidden="true" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m-2 2h6M5 12L3 9l4-4m-2 2H2"></path>
            </svg>
            <div class="text-center">
                <span id="toast-message"></span>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/flowbite@1.6.0/dist/flowbite.js"></script>
    <script>
        function showToast(message) {
            const toast = document.getElementById("toast");
            const toastMessage = document.getElementById("toast-message");
            toastMessage.textContent = message;
            toast.classList.remove("hidden");

            setTimeout(function() {
                toast.classList.add("hidden");
                window.location.href = "sign-in";
            }, 5000); 
        }

        window.onload = function() {
            const message = "${message}";
            showToast(message);
        };
    </script>
</body>
</html>
