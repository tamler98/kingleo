<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
  <html>

  <head>
    <title>Available rooms | Azure Hotel</title>
    <link href='<c:url value="/resources/static/css/search.css" />' rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="resources/static/assets/vendor/css/pages/page-misc.css" />
    <link href='<c:url value="/resources/static/css/bookingdetail.css" />' rel='stylesheet'>
    <link href='<c:url value="/resources/static/css/bookingcart.css" />' rel='stylesheet'>
    <jsp:include page="head.jsp" />


  </head>

  <body>
    <header style="display: flex;">

      <div class="logo_top">
        <a href="./">
          <img src="resources/static/images/Logo_logo_white.png" />
        </a>
      </div>

      <nav>
        <ul class="navbar_nav ">
          <li class="li_active"><a href="./bookingcart">Availability</a></li>
          <li><a href="./about">About</a></li>
          <li><a href="./contact">Contact</a></li>
          <li class="nav-item d-flex align-items-center  ">
            <a href="<c:url value="/bookingcart" />" class="nav-link d-flex align-items-center px-0
            py-0">My Cart
            <span class="cart-basket d-flex align-items-center justify-content-center"
              style="height: 1.4em;border-radius: 50%;width: 1.4em;background-color: #fff700b8;position: relative;top: -18px;left: 0px;font-size: 12px;color: #a67f01;font-weight: 500">
              ${cartItemList.size()}
            </span>
            </a>
          </li>
        </ul>
      </nav>

      <div class="user_info">
        <sec:authorize access="isAuthenticated()">

          <ul class="user_ul d-flex justify-item-center">

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
    <main style="padding-top:10px;">
      <c:if test="${not empty availableRoomList}">
        <div class="section section-properties" style="margin-bottom: 5em;">
          <div class="container">
            <div class="row">
              <c:forEach items="${availableRoomList}" var="room">
                  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                      <!-- Carousel-->
                      <div class="property-item mb-30">
                        <a href="property-single.html" class="img">
                          <div id="myCarousel" class="carousel slide" data-ride="carousel">
                              <!-- Indicators -->
                              <ol class="carousel-indicators">
                                  <c:forEach items="${imageList}" var="image" varStatus="status">
                                      <li data-target="#myCarousel" data-slide-to="${status.index}"
                                          class="${status.index == 0 ? 'active' : ''}"></li>
                                  </c:forEach>
                              </ol>

                              <!-- Wrapper for slides -->
                              <div class="carousel-inner" role="listbox">
                                  <c:forEach items="${imageList}" var="image" varStatus="status">
                                      <div class="item ${status.index == 0 ? 'active' : ''}" style="width:400px;max-height:300px;;min-height:300px;">
                                          <img style="border-radius:10px;" class="img-fluid" src="getImagePhoto/${image.id}" />
                                      </div>
                                  </c:forEach>
                              </div>

                              <!-- Controls -->
                              <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                  <span class="sr-only">Previous</span>
                              </a>
                              <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                  <span class="sr-only">Next</span>
                              </a>
                          </div>
                        </a>

                          <div class="property-content">
                              <div class="price mb-2"><span>
                                      <fmt:formatNumber value="${room.categoryEntity.price}" pattern="#,###.##" /> VND
                                  </span></div>
                              <div>
                                  <span style="font-size: 17px;"
                                      class="d-block mb-2 text-black-50"><strong>${fn:toUpperCase(room.room_name)} -
                                          ${room.categoryEntity.category_name}</strong></span>
                                  <div class="specs d-flex mb-4">
                                      <span style="margin-right: 1em;" class="d-block d-flex align-items-center me-3">
                                          <span class="icon-bed me-2" style="margin-right: .5em;"></span>
                                          <span class="caption" style="margin-right: .5em;">${room.categoryEntity.bed_info}
                                              beds</span>
                                      </span>
                                      <span class="d-block d-flex align-items-center">
                                          <span class="icon-bath me-2" style="margin-right: .5em;"></span>
                                          <span class="caption" style="margin-right: .5em;">2 baths</span>
                                      </span>

                                  </div>
                                  <div class="specs d-flex mb-4">

                                      <span class="d-block d-flex align-items-center">
                                          <span class="fas fa-user" style="margin-right: .5em;"></span>
                                          <span class="caption"
                                              style="margin-right: .5em;">${availableRoomList[0].categoryEntity.max_occupancy}
                                              guests</span>
                                      </span>
                                      <span class="d-block d-flex align-items-center">
                                          <span class="fa-solid fa-square" style="margin-right: .5em;"></span>
                                          <span class="caption" style="margin-right: .5em;">
                                              ${availableRoomList[0].categoryEntity.square} m2</span>
                                      </span>
                                      <span class="d-block d-flex align-items-center" style="margin-left: 1em;">
                                          <span class="fas fa-map-marker" style="margin-right: .5em;"></span>
                                          <span class="caption" style="margin-right: .5em;">
                                              ${availableRoomList[0].position}</span>
                                      </span>
                                  </div>
                                  <a href="addToCart/room=${room.id}" class="btn btn-primary py-2 px-3"
                                      style="margin-top: 7px; color:hover: black !important; height:35px; font-size:16px; font-weight:505;">Add to cart</a>
                              </div>
                          </div>
                      </div> <!-- .item -->
                  </div>
              </c:forEach>
              <c:if test="${totalPages > 1}">
                <div class="row align-items-center py-5" style="justify-content: center;">
                  <div class="col-lg-6 text-center">
                    <div class="custom-pagination">
                      <c:if test="${currentPage > 0}">
                        <li style="list-style: none;"><a
                            href="?checkin=${param.checkin}&checkout=${param.checkout}&roomType=${param.roomType}&guests=${param.guests}&page=${currentPage - 1}">&laquo;</a>
                        </li>
                      </c:if>
                      <c:forEach begin="0" end="${totalPages - 1}" var="i">
                        <li style="list-style: none; "
                          class="page-item text-center ${currentPage == i ? 'active' : ''}"><a
                            class="page-link" style="padding: 0px; font-size:14px;"
                            href="?checkin=${param.checkin}&checkout=${param.checkout}&roomType=${param.roomType}&guests=${param.guests}&page=${i}">${i
                            + 1}</a></li>
                      </c:forEach>
                      <c:if test="${currentPage < totalPages - 1}">
                        <li style="list-style: none;"><a
                            href="?checkin=${param.checkin}&checkout=${param.checkout}&roomType=${param.roomType}&guests=${param.guests}&page=${currentPage + 1}">&raquo;</a>
                        </li>
                      </c:if>
                    </div>
                  </div>
                </div>
              </c:if>


            </div>
          </div>
        </div>

      </c:if>
      <c:if test="${empty availableRoomList}">
        <div class="misc-wrapper">
          <h2 class="mx-2">No available rooms found!</h2>
          <p class="mb-4 mx-2">Sorry for the inconvenience</p>
          <a
            href="./"
            class="btn btn-primary btn-lg"
            style="background-color: #cca772; border: none"
            >Back to home</a
          >
          <div class="mt-4">
            <img
              src="resources/static/assets/img/illustrations/girl-doing-yoga-light.png"
              alt="girl-doing-yoga-light"
              width="500"
              class="img-fluid"
              data-app-dark-img="illustrations/girl-doing-yoga-dark.png"
              data-app-light-img="illustrations/girl-doing-yoga-light.png"
            />
          </div>
        </div>
      </c:if>
    </main>
    <jsp:include page="footer.jsp" />
    <script>
      $(document).ajaxStart(function () {
        $("#overlayer").fadeIn();
        $(".loader").fadeIn();
      });

      $(document).ajaxStop(function () {
        $("#overlayer").fadeOut();
        $(".loader").fadeOut();
      });
    </script>
    <script>
      $(document).ready(function () {
        // Activate the first slide
        $(".carousel-inner .item:first-child").addClass("active");
        // Loop through each slide
        $(".carousel").carousel({
          interval: 2000, // Change the interval time here
        });
      });
    </script>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src='<c:url value="/resources/static/css/aboutpage/js/aos.js" />'></script>
    <script src='<c:url value="/resources/static/css/aboutpage/js/counter.js" />'></script>
    <script src='<c:url value="/resources/static/css/aboutpage/js/custom.js" />'></script>
    <jsp:include page="scripts.jsp" />
    <link href="https://cdn.bootcss.com/font-awesome/5.11.2/css/all.min.css" rel="stylesheet" />

  </body>

  </html>