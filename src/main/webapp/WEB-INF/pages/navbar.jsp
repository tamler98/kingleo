<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href='<c:url value="/resources/static/css/header.css" />' rel='stylesheet'>
<header>
  <nav class="navbar navbar-expand-lg fixed-top px-0 mx-0 " id="">
    <div class="container">
      <a class="navbar-brand" href="./">
        <img class="navbar-logo" width="200" height="auto" src="resources/static/images/Logo_logo.png"/>
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="oi oi-menu"></span> Menu
      </button>
      <div class="collapse navbar-collapse my-auto" id="ftco-nav">
        <ul class="navbar-nav ml-auto align-items-center">
          <li class="nav-item active">
            <a href="./" class="nav-link">Home</a>
          </li>
          <li class="nav-item">
            <a href="<c:url value="/rooms" />" class="nav-link">Rooms</a>
          </li>
          <li class="nav-item">
            <a href="<c:url value="/restaurant" />" class="nav-link">Restaurant</a>
          </li>
          <li class="nav-item">
            <a href="<c:url value="/about" />" class="nav-link">About</a>
          </li>
          <li class="nav-item">
            <a href="<c:url value="/rating" />" class="nav-link">Rating</a>
          </li>
          <!-- Login -->
          <sec:authorize access="isAuthenticated()">
            <sec:authorize access="hasRole('ROLE_ADMIN')">
              <li class="nav-item">
                <a href="<c:url value="/admin/room" />" class="nav-link">Manage Hotel</a>
              </li>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_USER')">
              <li class="nav-item ">
                <a href="<c:url value="/bookingcart" />" class="nav-link d-flex align-items-center">My Cart
                  <span class="cart-basket d-flex align-items-center justify-content-center" style="height: 1.4em;border-radius: 50%;width: 1.4em;background-color: #fff700b8;position: relative;top: -18px;left: 0px;font-size: 105%;color: #a67f01;font-weight: 500">
                    ${cartItemList.size()}
                  </span>
                </a>
              </li>
            </sec:authorize>
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/user/account" class="nav-link" style="font-weight: 500;">
                ${accountEntity.username}
              </a>
            </li>
            <li class="nav-item">
              <a href="<c:url value="/logout" />" class="nav-link">LogOut</a>
            </li>
          </sec:authorize>
          <!-- If No login then will show Login Page -->
          <sec:authorize access="!isAuthenticated()">
            <li class="nav-item ">
              <a class="nav-link" href="<c:url value="/login" />">My Cart</a>
            </li>
            <li class="nav-item">
              <a href="<c:url value="/login" />" class="nav-link">Login</a>
            </li>
            <li class="nav-item">
              <a href="<c:url value="/signup" />" class="nav-link">SignUp</a>
            </li>
        </sec:authorize>
      </ul>
    </div>
  </div>
</nav>
</header>

