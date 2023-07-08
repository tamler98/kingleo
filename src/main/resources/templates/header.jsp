<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link href='resources/static/css/header.css' rel='stylesheet'>
</head>
<body>
<header>
    <div class="row">
        <div class="col-sm-2">
            <div class="header_logo">
                <a href="/"><img src="../resources/static/images/logo_KL-06.png" alt=""></a>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="header_nav">
                <a href="" class="nav_header_a">KINGLEO CT3</a>
                <a href="" class="nav_header_a">CT3</a>
                <a href="" class="nav_header_a">11PRO TONI</a>
                <a href="" class="nav_header_a">MIZUNO</a>
                <a href="" class="nav_header_a">KAMITO</a>
                <a href="" class="nav_header_a">MUA GIÀY LƯỚT</a>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="account_action">
                <form action="/search" method="get" class="search_input">
                    <div class="search-container">
                        <input type="search" name="keyword" placeholder="Tìm kiếm..." />
                        <button type="submit"><i class="fas fa-search"></i></button>
                    </div>
                </form>
                <div class="account_icons" th:if="${session.account != null}">
                    <ul>
                        <li>
                            <div th:if="${session.account.getPhoto() == null}">
                                <img src="../resources/static/images/no-avatar.png" class="profile" id="profile-image" />
                            </div>
                            <div th:if="${session.account.getPhoto() != null}">
                                <img th:src="'../account/getImagePhoto/'+${session.account.id}" class="profile" id="profile-image" />
                            </div>
                            <ul class="avatar_ul">
                                <li class="sub-item" style="width:100%">
                                    <span class="material-icons-outlined"> <i class="far fa-user"></i>
                                    </span>
                                    <div sec:authorize="isAuthenticated()">
                                        <b><span sec:authentication="name">${session.account.username}</span></b>
                                        <i><span sec:authentication="principal.authorities">Roles</span></i>
                                    </div>
                                </li>
                                <a href="../admin/dashboard" class="logout">
                                <li class="sub-item" sec:authorize="hasAnyAuthority('ADMIN')">
                                    <span class="material-icons-outlined"> <i class="fas fa-braille"></i>
                                    </span>
                                    <p>Dashboard</p>
                                </li>
                                </a>
                                <a href="../admin/newProduct" class="logout">
                                <li class="sub-item" sec:authorize="hasAnyAuthority('ADMIN')">
                                    <span class="material-icons-outlined">
                                        <i class="fas fa-list"></i>
                                    </span>
                                    <p>Thêm sản phẩm</p>
                                </li>
                                </a>
                                <a href="/account/order" class="logout">
                                <li class="sub-item" sec:authorize="hasAnyAuthority('USER')">
                                    <span class="material-icons-outlined">
                                        <i class="fas fa-list"></i>
                                    </span>
                                    <p>Đơn hàng của tôi</p>
                                </li>
                                </a>
                                <a href="/account/profile" class="logout">
                                <li class="sub-item">
                                    <span class="material-icons-outlined"> <i class="fas fa-users-cog"></i>
                                    </span>
                                    <p>Quản lý tài khoản</p>
                                </li>
                                </a>
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
                        <li class="menu_dropdown">
                                                                            <i class="fas fa-bars"></i>
                                                                            <ul>
                                                                                <a href="../login" class="logout">
                                                                                    <li class="sub-item">
                                                                                        <span class="material-icons-outlined"> <i class="fas fa-futbol"></i> </span>
                                                                                        <p>11 Pro Toni</p>
                                                                                    </li>
                                                                                </a>
                                                                                <a href="../signup" class="logout">
                                                                                    <li class="sub-item">
                                                                                        <span class="material-icons-outlined">
                                                                                            <i class="fas fa-futbol"></i>
                                                                                        </span>
                                                                                        <p>King Leo</p>
                                                                                    </li>
                                                                                </a>
                                                                                <a href="../signup" class="logout">
                                                                                    <li class="sub-item">
                                                                                        <span class="material-icons-outlined">
                                                                                            <i class="fas fa-futbol"></i>
                                                                                        </span>
                                                                                        <p>Kamito</p>
                                                                                    </li>
                                                                                </a>
                                                                                <a href="../signup" class="logout">
                                                                                    <li class="sub-item">
                                                                                        <span class="material-icons-outlined">
                                                                                            <i class="fas fa-futbol"></i>
                                                                                        </span>
                                                                                        <p>Mizuno</p>
                                                                                    </li>
                                                                                </a>
                                                                                <a href="../signup" class="logout">
                                                                                    <li class="sub-item">
                                                                                        <span class="material-icons-outlined">
                                                                                            <i class="fas fa-futbol"></i>
                                                                                        </span>
                                                                                        <p>CT3 Chính hãng</p>
                                                                                    </li>
                                                                                </a>
                                                                            </ul>
                                                                        </li>
                    </ul>
                </div>
                <div class="account_icons" th:if="${session.account == null}">
                    <ul>
                        <li >
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
                        <li class="menu_dropdown">
                            <i class="fas fa-bars"></i>
                            <ul>
                                <a href="../login" class="logout">
                                    <li class="sub-item">
                                        <span class="material-icons-outlined"> <i class="fas fa-futbol"></i> </span>
                                        <p>11 Pro Toni</p>
                                    </li>
                                </a>
                                <a href="../signup" class="logout">
                                    <li class="sub-item">
                                        <span class="material-icons-outlined">
                                            <i class="fas fa-futbol"></i>
                                        </span>
                                        <p>King Leo</p>
                                    </li>
                                </a>
                                <a href="../signup" class="logout">
                                    <li class="sub-item">
                                        <span class="material-icons-outlined">
                                            <i class="fas fa-futbol"></i>
                                        </span>
                                        <p>Kamito</p>
                                    </li>
                                </a>
                                <a href="../signup" class="logout">
                                    <li class="sub-item">
                                        <span class="material-icons-outlined">
                                            <i class="fas fa-futbol"></i>
                                        </span>
                                        <p>Mizuno</p>
                                    </li>
                                </a>
                                <a href="../signup" class="logout">
                                    <li class="sub-item">
                                        <span class="material-icons-outlined">
                                            <i class="fas fa-futbol"></i>
                                        </span>
                                        <p>CT3 Chính hãng</p>
                                    </li>
                                </a>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</header>
    <script src="resources/static/js/header.js"></script>


 </body>
 </html >