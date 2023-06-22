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
    <link href='<c:url value="/resources/static/css/login.css" />' rel='stylesheet'>
    <title>Azure Member Login</title>
</head>
<body>
<div class="container" id="container">
        <!-- Login Form -->
        <div class="form-container sign-in-container">
            <form id="regForm" name="regForm" action="<c:url value=" j_spring_security_check" />""
            method="POST">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

            <h1>Log In</h1>

            <!-- Place for icons: social content ... -->
            <div class="social-container">
                <a href="https://www.facebook.com/themoon.eec/" target="_blank" class="social"><i
                        class="fab fa-github"></i></a> <a href="https://www.facebook.com/themoon.eec/" target="_blank"
                    class="social"><i class="fab fa-linkedin"></i></a>
                <a href="https://www.facebook.com/themoon.eec/" target="_blank" class="social"><i
                        class="fab fa-facebook"></i></a>
            </div>
            <c:if test="${message != null && message != ''}">
                <div class="alert alert-danger col-xs-offset-1 col-xs-10" id="error-msg">${message}</div>
            </c:if>
            <!-- Login Error -->

            <!-- Email  -->
            <span>Welcome to Azure Hotel Website? Log In Now!</span>
            <input type="email" placeholder="Username" name="username" required />

            <!-- Password -->
            <input type="password" placeholder="Password" name="password" required minlength="6"/> <br>

            <!-- sign in button submit -->
            <button type="submit" id="button">Log In</button>
            </form>
        </div>

        <!-- switch overlay -->
        <div class="overlay-container">
            <div class="overlay">
                <!-- sign up switch -->
                <div class="overlay-panel overlay-right">
                    <div class="overlay-panel-right-logo"><img src="resources/static/images/Logo_logo_yellow.png"
                            alt=""></div>
                    <h1>Don't Have Account?</h1>
                    <p>SIGN UP NOW</p>
                    <a href="signup"><button class="ghost" id="signUp">Sign Up</button></a>
                </div>
            </div>
        </div>
    </div>
    <c:if test="${success_msg != null && message != ''}">
        <div id="notification-container">
            <div class="notification-box success">
                <p>${success_msg}</p>
            </div>
        </div>
    </c:if>
    <!-- Reference Javascript and local files -->
    <script th:src="@{scripts/login-page.js}"></script>
</body>

<script>
    // hide success message after 5 seconds
    setTimeout(function () {
        var successMsg = document.getElementById("error-msg");
        if (successMsg) {
            successMsg.parentNode.removeChild(successMsg);
        }
    }, 5000);
</script>

<script>
    // hide success message after 5 seconds
    setTimeout(function () {
        var successMsg = document.getElementById("notification-container");
        if (successMsg) {
            successMsg.parentNode.removeChild(successMsg);
        }
    }, 5000);
</script>
</html>