<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>

<head>
    <title>Azure Hotel</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.bootcss.com/font-awesome/5.11.2/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href='<c:url value="/resources/static/images/Logo_icon.svg" />' rel='shortcut icon'>
    <link href='<c:url value="/resources/static/css/successpage.css" />' rel='stylesheet'>
    <link href='<c:url value="/resources/static/css/bookingcart.css" />' rel='stylesheet'>
    <link href='<c:url value="/resources/static/css/bookingdetail.css" />' rel='stylesheet'>
</head>
<body>
    <header>
        <div class="logo_top">
           <a href="../">
                <img src="<c:url value="/resources/static/images/Logo_logo_white.png" />"/>
            </a>
        </div>
        <nav>
            <ul class="navbar_nav">
                <li class="li_active"><a href="<c:url value="/bookingcart" />">Avaiability</a></li>
                <li><a href="<c:url value="/about" />">About</a></li>
                <li><a href="<c:url value="/contact" />">Contact</a></li>
                <li><a href="<c:url value="/policy" />">Policies</a></li>
              </ul>
        </nav>
        <div class="user_info">
            <sec:authorize access="isAuthenticated()">
            <ul class="user_ul">
                <li class="nav_item">
                      <a href="<c:url value="/user/account" />" class="nav_link" style="font-weight: 500;">
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
<c:if test="${status.equals('completed')}">
<div class="order-status order-success" style="height: 430px; margin-top: -200px;">
  <div class="top-part">
    <i class="far fa-check-circle"></i>
    <h3>
       Thank you for your reservation.
      <span>Order #: ${newBookingEntity.id}</span>
    </h3>
      <small>
        We have send an email for you to confirm this booking.
        We’re dedicated to giving you the best experience possible. If you have any questions, feel free to get in touch.
      </small>
  </div>
  <ul>
    <li>
      <div>Username</div>
      <div>${accountEntity.username}</div>
    </li>
    <li>
      <div>Total Price:</div>
      <div><fmt:formatNumber value="${newBookingEntity.total_price}" pattern="#,###.##" /> VND</div>
    </li>
    <li>
      <div>Created Date:</div>
      <div><fmt:formatDate value="${newBookingEntity.booking_date}" pattern="dd/MM/yyyy" /></div>
    </li>
    <li>
      <div>Status:</div>
      <div style="color:green;">completed</div>
    </li>
  </ul>
</div>
</c:if>
<c:if test="${status.equals('dismiss')}">
<div class="order-status order-error" style="height: 430px; margin-top:-200px;">
  <div class="top-part">
    <i class="far fa-times-circle"></i>
    <h3>
       Payment Failed
    </h3>
      <small>
        ${errorMessage}
      </small>
  </div>
  <ul>
    <li>
      <div>Username</div>
      <div>${accountEntity.username}</div>
    </li>
    <li>
      <div>Number Rooms:</div>
      <div>${cartItemList.size()} Rooms</div>
    </li>
    <li>
      <div>Total price:</div>
      <div><fmt:formatNumber value="${discountedPrice}" pattern="#,###.##" /> VND</div>
    </li>
    <li>
      <div>Created Date:</div>
      <div><script>
        document.write(new Date().getDate()+"/"+new Date().getMonth()+"/"+new Date().getFullYear());
       </script></div>
    </li>
    <li>
      <div>Status:</div>
      <div style="color:red;">Failed</div>
    </li>
  </ul>
</div>
</c:if>

<div>
<a href="../" class="btn btn-primary cart-btn-transform m-3" data-abc="true">Homepage</a>
</div>
</main>
<footer class="footer_cart" style="bottom:0px;">
   <div class="footer_cart_logo" style="width: 10%;">
       <a href="./bookingcart"><img src='<c:url value="/resources/static/images/Logo_logo.png" />' alt=""></a>
   </div>
   <div class="footer_cart_content">
       Website was designed by Thanh Tam and Ngan Pham, please don't copyright.
   </div>
</footer>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src='<c:url value="/resources/static/js/successpage.js" />'></script>
</body>
</html>