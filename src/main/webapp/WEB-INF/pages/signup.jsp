<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">

	<!-- Reference Bootstrap and local files -->
	<link href="https://cdn.bootcss.com/font-awesome/5.11.2/css/all.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href='<c:url value="/resources/static/images/Logo_icon.svg" />' rel='shortcut icon'>
    <link href='<c:url value="/resources/static/css/signup.css" />' rel='stylesheet'>
	<title>Azure Member Sign Up</title>
</head>

<body>

    <!-- registration Form -->
    <div class="container" id="container">
        <div class="overlay-container">
            <div class="overlay">
                <!-- sign up switch -->
                <div class="overlay-panel overlay-right">
                    <div class="overlay-panel-right-logo"><img src="resources/static/images/Logo_logo_yellow.png"
                            alt=""></div>
                    <h1>Do you Have Account?</h1>
                    <p>LOG IN NOW</p>
                    <a href="login"><button class="ghost" id="signUp">Log In</button></a>
                </div>
            </div>
        </div>
        <!-- Login Form -->
        <div class="form-container sign-in-container">
            <form id="regForm" name="regForm" th:action="@{/process-login}" method="POST">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                <h1>Sign Up</h1>

                <!-- Place for icons: social content ... -->
                <div class="social-container">
                    <a href="https://www.facebook.com/themoon.eec/" target="_blank" class="social"><i
                            class="fab fa-github"></i></a> <a href="https://www.facebook.com/themoon.eec/"
                        target="_blank" class="social"><i class="fab fa-linkedin"></i></a>
                    <a href="https://www.facebook.com/themoon.eec/" target="_blank" class="social"><i
                            class="fab fa-facebook"></i></a>
                </div>
                <c:if test="${message != null && message != ''}">
                    <div class="alert alert-danger col-xs-offset-1 col-xs-10" id="error-msg">${message}</div>
                </c:if>
                <!-- Login Error -->
                <!-- <div th:if="${param.error}"
					class="alert alert-danger col-xs-offset-1 col-xs-10">Invalid
					username and password.</div> -->

                <!-- Logout notify -->
                <!-- <div th:if="${param.logout}"
					class="alert alert-success col-xs-offset-1 col-xs-10">You
					have been logged out.</div> -->

                <!-- Email  -->
                <span>Become a member of Azure Hotel! Sign Up Now!</span>
                <input type="email" placeholder="Email" name="email" required />

                <input type="text" placeholder="Username" name="username" required />
                <input type="text" placeholder="Phone Number" name="phone_number" required minlength="10" />

                <!-- Password -->
                <input type="password" placeholder="Password" name="password" required minlength="6"/>
                <input type="password" placeholder="Verify Password" style="margin-bottom: 2rem;" name="password_two"
                    required />
                <!-- sign in button submit -->
                <button id="button">Sign Up</button>
            </form>
        </div>
        <!-- switch overlay -->
    </div>
    <!-- Reference Javascript and local files -->
    <script th:src="@{scripts/login-page.js}"></script>
</body>
   <script>
      // hide success message after 5 seconds
      setTimeout(function() {
        var successMsg = document.getElementById("error-msg");
        if (successMsg) {
          successMsg.parentNode.removeChild(successMsg);
        }
      }, 5000);
    </script>

</html>
