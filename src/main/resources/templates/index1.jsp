	<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
	xmlns:sec="https://www.thymeleaf.org/thymeleaf-extras-springsecurity5">
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
        <link href='resources/static/css/style.css' rel='stylesheet'>
    <title>Trang chủ</title>
</head>
<body>
 <div th:include="header :: header"></div>
    <main>
	<div align="center">
		<h1>Student List</h1>
		
		<div sec:authorize="isAuthenticated()">
			Welcome <b><span sec:authentication="name">Username</span></b> &nbsp;
			<i><span sec:authentication="principal.authorities">Roles</span></i>
		</div>
		
		<form th:action="@{/logout}" method="post">
			<input type="submit" value="Logout" />
		</form>
		
		<div sec:authorize="hasAnyAuthority('ADMIN')">
		<a href="/new">Add Student</a>
		</div>
		
		<table border="1" cellpadding="10">
			<thead>
				<tr>
					<th>Student ID</th>
					<th>Student Name</th>
					<th>Student City</th>
					<th sec:authorize="hasAnyAuthority('ADMIN', 'EDITOR')">Action</th>
				</tr>
			</thead>
			<tbody>
				<tr th:each="student : ${listStudent}">
					<td th:text="${student.sid}">Student ID</td>
					<td th:text="${student.sname}">Student Name</td>
					<td th:text="${student.scity}">Student City</td>

					<td sec:authorize="hasAnyAuthority('ADMIN', 'EDITOR')">
						<div sec:authorize="hasAnyAuthority('ADMIN', 'EDITOR')">
							<a th:href="@{'/edit/' + ${student.sid}}">Edit</a>
						</div> &nbsp;&nbsp;&nbsp;
						<div sec:authorize="hasAnyAuthority('ADMIN')">
							<a th:href="@{'/delete/' + ${student.sid}}">Delete</a>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	</main>
	<footer>
	<div class="footer_container">
                      <div class="footer-content">
                        <div class="footer-column" style="text-align: center;">
                            <img src="resources/static/images/logo_KL-06.png" alt="Image 1">
                        </div>
                        <div class="footer-column" style="padding-top: .5em;">
                          <h3>Về chúng tôi</h3>
                          <p>Cung cấp các loại giày bóng đá giá rẻ, phù hợp với thị trường và nhu cầu của anh em đam mê đá bóng.</p>
                        </div>
                        <div class="footer-column" style="padding-top: .5em;">
                          <h3>Liên hệ</h3>
                          <p><strong>Địa chỉ:</strong> K25 Đỗ Thế Chấp, Tam Kỳ, Quảng Nam</p>
                          <p><strong>Phone:</strong> 038 571 8282</p>
                          <p><strong>Email:</strong> trinhthanhdat8282@gmail.com</p>
                        </div>
                        <div class="footer-column" style="padding-top: .5em;">
                          <h3>Theo dõi</h3>
                          <ul class="social-media">
                            <li><a href="#"><i class="fab fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                          </ul>
                        </div>
                      </div>
                      <p class="footer-copy">&copy; 2023 Tamler98. All rights reserved.</p>
                    </div>
	</footer>
</body>
</html>