<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>

</head>
<header>
    <div class="row">
        <div class="col-sm-2">
            <div class="header_logo">
                <a href="/"><img src="../resources/static/images/logo_KL-06.png" alt=""></a>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="header_nav">
                <a href="" class="nav_header_a">NIKE</a>
                <a href="" class="nav_header_a">ADIDAS</a>
                <a href="" class="nav_header_a">MIZUNO</a>
                <a href="" class="nav_header_a">CT3</a>
                <a href="" class="nav_header_a">KINGLEO</a>
                <a href="" class="nav_header_a">11PRO TONI</a>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="account_action">
                <form action="search" method="GET" class="search_input">
                    <div class="search-container">
                        <input type="search" name="searchInput" placeholder="Tìm kiếm...">
                        <button type="submit"><i class="fas fa-search"></i></button>
                    </div>
                </form>
                <div class="account_icons" th:if="${session.account != null}">
                    <ul>
                        <li>
                            <img src="../resources/static/images/tam.jpg" class="profile" id="profile-image" />
                            <ul>
                                <li class="sub-item">
                                    <span class="material-icons-outlined"> <i class="far fa-user"></i>
                                    </span>
                                    <div sec:authorize="isAuthenticated()">
                                        <b><span sec:authentication="name">${session.account.username}</span></b>
                                        <i><span sec:authentication="principal.authorities">Roles</span></i>
                                    </div>
                                </li>
                                <li class="sub-item">
                                    <span class="material-icons-outlined"> <i class="fas fa-braille"></i>
                                    </span>
                                    <p>Dashboard</p>
                                </li>
                                <li class="sub-item">
                                    <span class="material-icons-outlined">
                                        <i class="fas fa-list"></i>
                                    </span>
                                    <p>My Orders</p>
                                </li>
                                <li class="sub-item">
                                    <span class="material-icons-outlined"> <i class="fas fa-users-cog"></i>
                                    </span>
                                    <p>Update Profile</p>
                                </li>
                                <a href="../logout" class="logout">
                                    <li class="sub-item">
                                        <span class="material-icons-outlined"> <i class="fas fa-sign-out-alt"></i>
                                        </span>
                                        <p>Logout</p>
                                    </li>
                                </a>
                            </ul>
                        </li>
                        <li>
                            <a href="cart"><span class="material-icons-outlined"
                                    style="padding-top: 23px; font-size: 27px;">
                                    <i class="fas fa-cart-plus"></i>
                                </span></a>
                            <p><span class='badge badge-warning' id='lblCartCount' th:text="${session.count}"></span>
                            </p>
                        </li>
                    </ul>
                </div>
                <div class="account_icons" th:if="${session.account == null}">
                    <ul>
                        <li>
                            <img src="../resources/static/images/no-avatar.png" class="profile" />
                            <ul>
                                <a href="../login" class="logout">
                                    <li class="sub-item">
                                        <span class="material-icons-outlined"> <i class="fas fa-braille"></i> </span>
                                        <p>Đăng nhập</p>
                                    </li>
                                </a>
                                <a href="../signup" class="logout">
                                    <li class="sub-item">
                                        <span class="material-icons-outlined">
                                            <i class="fas fa-list"></i>
                                        </span>
                                        <p>Đăng ký</p>
                                    </li>
                                </a>
                            </ul>
                        </li>
                        <li>
                            <a href="cart"><span class="material-icons-outlined"
                                    style="padding-top: 23px; font-size: 27px;">
                                    <i class="fas fa-cart-plus"></i>
                                </span></a>
                            <p><span class='badge badge-warning' id='lblCartCount' th:text="${session.count}"></span>
                            </p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</header>
    <script src="resources/static/js/header.js"></script>