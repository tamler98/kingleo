<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.bootcss.com/font-awesome/5.11.2/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<link href='<c:url value="/resources/static/images/Logo_icon.svg" />' rel='shortcut icon'>
<link href='<c:url value="/resources/static/css/bookingdetail.css" />' rel='stylesheet'>
<link href='<c:url value="/resources/static/css/bookingcart.css" />' rel='stylesheet'>
<link href='<c:url value="/resources/static/css/footer.css" />' rel='stylesheet'>
<title>Booking Cart |  Azure Hotel</title>
</head>
<style>
.thankyou-wrapper{
  width:100%;
  height:auto;
  margin:auto;
  padding:10px 0px 50px;
}
.thankyou-wrapper h1{
  font:100px Arial, Helvetica, sans-serif;
  text-align:center;
  color:#333333;
  padding:0px 10px 10px;
}
.thankyou-wrapper p{
  font:19px Arial, Helvetica, sans-serif;
  text-align:center;
  color:#333333;
  padding: 20px;
  padding-bottom: 40px;
}
.thankyou-wrapper a {
    font: 15px Arial, Helvetica, sans-serif;
    text-align: center;
    color: #ffffff;
    display: block;
    text-decoration: none;
    width: 130px;
    background: #cca772;
    margin: 10px auto 0px;
    padding:10px;
    border-bottom: 5px solid #cca772;
    border-radius: 10px;
    }
.thankyou-wrapper a:hover{
  font: 15px Arial, Helvetica, sans-serif;
  text-align:center;
  color:#ffffff;
  display:block;
  text-decoration:none;
  width: 130px;
  margin:10px auto 0px;
  padding:10px;
  box-shadow: 0px 0px 2px black;
}
</style>

<body>

<header>
  <div class="logo_top">
    <a href="./">
      <img src="resources/static/images/Logo_logo_white.png" />
    </a>
    </a>
  </div>
  <nav>
    <ul class="navbar_nav">
      <li class="li_active"><a href="./bookingcart">Availability</a></li>
      <li><a href="./about">About</a></li>
      <li><a href="./contact">Contact</a></li>
    </ul>
  </nav>
  <div class="user_info">

    <sec:authorize access="isAuthenticated()">
      <ul class="user_ul">
        <li class="nav_item">
          <a href="<c:url value="user/account" />" class="nav_link" style="font-weight: 500;">
          ${accountEntity.username}
          </a>
        </li>
        <li class="nav_item">
          <a href="<c:url value="/logout" />" class="nav_link">LogOut</a>
        </li>
      </ul>
    </sec:authorize>

  </div>
</header>
<main>
  <div class="container">
    <section class="login-main-wrapper" style="width:100%">
          <div class="main-container">
              <div class="login-process">
                  <div class="login-main-container">
                      <div class="thankyou-wrapper">
                          <h1><img src="http://montco.happeningmag.com/wp-content/uploads/2014/11/thankyou.png" alt="thanks" /></h1>
                            <p>Thanks so much for sharing your experience with us. We hope to see you again soon.</p>
                            <a href="./">Back to home</a>
                            <div class="clr"></div>
                        </div>
                        <div class="clr"></div>
                    </div>
                </div>
                <div class="clr"></div>
            </div>
        </section>
  </div>
</main>
<footer class="footer_cart" style="top:1471px;">
  <div class="footer_cart_logo">
    <a href="./bookingcart"><img src="resources/static/images/Logo_logo.png" alt=""></a>
  </div>
  <div class="footer_cart_content">
    Website was designed by Thanh Tam and Ngan Pham, please don't copyright.
  </div>
</footer>

</body>

</html>