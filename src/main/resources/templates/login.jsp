<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <!-- Reference Bootstrap and local files -->
        <link href="https://cdn.bootcss.com/font-awesome/5.11.2/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href='resources/static/images/favicon_KL.svg' rel='shortcut icon'>
        <link href='resources/static/css/signup.css' rel='stylesheet'>
    <title>Đăng nhập</title>
</head>
<body>
    <div class="wrapper fadeInDown">
  <div id="formContent">
       <!-- Icon -->
       <div class="fadeIn first">
        <a href="/"><img src="resources/static/images/logo_KL-06.png" id="icon" alt="User Icon" /></a>
      </div>
    <!-- Tabs Titles -->
    <a href="login"><h2 class="active" style="cursor: pointer;"> Đăng nhập </h2></a>
        <a href="signup"><h2 class="inactive underlineHover" style="cursor: pointer;">Đăng ký </h2></a>

    <!-- Login Form -->
    <p id="msg" style="color: red; font-weight: 500;" th:text="${msg}" class="notification"></p>
    <form id="regForm" name="regForm" action="j_spring_security_check" method="POST">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      <input type="text" id="login" class="fadeIn second" name="username" placeholder="Tài khoản">
      <input type="password" id="password" class="fadeIn third" name="password" placeholder="Mặt khẩu">
      <input type="submit" class="fadeIn fourth" value="Đăng nhập" style="margin-top: 20px;cursor: pointer;">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="#">Quên mật khẩu?</a>
    </div>

  </div>
</div>
</body>
<script src="resources/static/js/login.js"></script>
</html>