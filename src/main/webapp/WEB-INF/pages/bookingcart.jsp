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
    <c:if test="${type.equals('listNull')}">
      <div class="container-fluid  mt-100">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="col-sm-12 empty-cart-cls text-center">
                <img src="https://i.imgur.com/dCdflKN.png" width="130" height="130"
                  class="img-fluid mb-4 mr-3">
                <h3><strong>Your Booking Items is Empty</strong></h3>
                <h4>Please choose room and add to cart <3 </h4>
                    <a href="./" class="btn btn-primary cart-btn-transform m-3" data-abc="true">Homepage</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </c:if>
    <c:if test="${cartItemList.size() > 0}">

      <div class="main-content-left">
        <div class="room-card-list">
          <c:forEach var="cartItem" items="${cartItemList}">
            <div class="room-card">
              <div class="room-card-image">
                <img src="getImagePhoto/${cartItem.roomEntity.categoryEntity.id}" />
              </div>
              <div class="room-card-content">
                <div class="room-name">
                  <h1>${cartItem.roomEntity.room_name}</h1>
                </div>
                <div class="room-name" style="margin-top:-5px;">
                  <h1>${cartItem.roomEntity.categoryEntity.category_name} </h1>
                </div>
                <div class="room-number_of_person">${cartItem.roomEntity.categoryEntity.max_occupancy}
                  Guestss</div>
                <div class="room-info">
                  <div class="room-number_of_bed"><i class="fas fa-user"></i> Sleeps
                    ${cartItem.roomEntity.categoryEntity.max_occupancy}</div>
                  <div class="room-number_of_double_bed"><i class="fas fa-bed"></i>
                    ${cartItem.roomEntity.categoryEntity.bed_info} Double bed</div>
                  <div class="room-number_of_bathroom"><i class="fas fa-bath"></i>
                    ${cartItem.roomEntity.categoryEntity.bed_info} Bathroom</div>
                </div>
                <div class="room-info-special">
                  <div class="room-square">${cartItem.roomEntity.categoryEntity.square} m&#178; </div>
                  <div class="heart_icon"> <i class="fas fa-map-marker"></i></div>
                  <div class="room-smoking">Non-smoking</div>
                  <div class="heart_icon"> <i class="fas fa-map-marker"></i></div>
                  <div class="room-views">Various views</div>
                </div>
                <div class="room-cost">
                  <div class="cost-before">
                    <fmt:formatNumber value="${cartItem.roomEntity.categoryEntity.price*1.2}"
                      pattern="#,###.##" /> VND
                  </div>
                  <div class="cost-after">
                    <fmt:formatNumber value="${cartItem.roomEntity.categoryEntity.price}"
                      pattern="#,###.##" /> VND
                  </div>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>

        <div class="customer-dtails">
          <div id="customer-detail">
            <div class="dropbtn">
              <div class="dropbtn-detail">Check Your Information</div>
              <div class="dropbtn-space"></div>
              <div class="dropbtn-icon"><i class="fas fa-chevron-down"></i></div>
            </div>
          </div>
          <div id="customer-detail-content" style="font-family: inherit;">
            <div class="customer-info">
              <form:form class="form-horizontal" action="bookingcart/saveuserinfo"
                modelAttribute="accountEntity">
                <div class="form-group row"
                  style="display: flex; align-items: center; width: 97%; margin-bottom: 1.3em;">
                  <label class="col-sm-4 col-form-label" style="font-size: 16px;">First Name:</label>
                  <form:input path="first_name" type="text" class="input" placeholder="First Name"
                    style="text-align: left; height: 40px;"/>
                </div>
                <div class="form-group row"
                  style="display: flex; align-items: center; width: 97%; margin-bottom: 1.3em;">
                  <label for="inputEmail" class="col-sm-4 col-form-label" style="font-size: 16px;">Last
                    Name:</label>
                  <form:input path="last_name" type="text" class="input" placeholder="Last Name"
                    style="text-align: left;height: 40px;"/>
                </div>
                <div class="form-group row"
                  style="display: flex; align-items: center; width: 97%; margin-bottom: 1.3em;">
                  <label class="col-sm-4 col-form-label" style="font-size: 16px;">Email:</label>
                  <form:input path="email" type="email" class="input" placeholder="Email"
                    style="text-align: left;height: 40px;" readonly="true"/>
                </div>
                <div class="form-group row"
                  style="display: flex; align-items: center; width: 97%;margin-bottom: 1.3em;">
                  <label class="col-sm-4 col-form-label" style="font-size: 16px;">Phone Number:</label>
                  <form:input path="phone_number" type="text" class="input" placeholder="Phone Number" minlength="10"
                    style="text-align: left;height: 40px;"/>
                </div>
                <div class="form-group row" style="display: flex; align-items: center; width: 97%; ">
                  <label class="col-sm-4 col-form-label" style="font-size: 16px;">Address:</label>
                  <form:input path="address" type="text" class="input" placeholder="Address"
                    style="text-align: left;height: 40px;"/>
                </div>
                <div class="form-group row" style="display: flex; align-items: center; width: 97%;">
                  <label class="col-sm-4 col-form-label" style="font-size: 16px;"></label>
                  <button class="btn_submit_payment" type="submit" style="height: 45px;">Save</button>
                </div>
              </form:form>
            </div>
          </div>
        </div>
        <div class="customer-dtails">
          <div id="customer-review">
            <div class="dropbtn">
              <div class="dropbtn-detail">Check Your Payment Info</div>
              <div class="dropbtn-icon"><i class="fas fa-chevron-down"></i></div>
            </div>
          </div>
          <div id="customer-review-content">
            <c:if test="${payment_status.equals('payment_unavailable')}">
              <div class="wrapper">
                <div class="payment">
                  <div class="form">
                    <form:form action="bookingcart/payment" method="POST" modelAttribute="accountBanking">
                      <div class="card space icon-relative">
                        <label class="label">Full name</label>
                        <form:input path="full_name" type="text" class="input" placeholder="Full name"
                          required="true" />
                        <i class="fas fa-user"></i>
                      </div>
                      <div class="card space icon-relative">
                        <label class="label">Card number:</label>
                        <form:input path="card_number" type="text" class="input"
                          placeholder="0000 0000 0000 0000" minlength="16" maxlength="16" required="true" />
                        <i class="far fa-credit-card"></i>
                      </div>
                      <div class="card-grp space">
                        <div class="card-item icon-relative">
                          <label class="label">Expired date:</label>
                          <form:input path="expired_date" type="text" class="input" data-mask="dd/MM/yyyy"
                            placeholder="dd/MM/yyyy" required="true"/>
                          <i class="far fa-calendar-alt"></i>
                        </div>
                        <div class="card-item icon-relative">
                          <label class="label">CVV:</label>
                          <form:input path="cvv" type="text" class="input" placeholder="000"
                            maxlength="3" minlength="3" required="true" />
                          <i class="fas fa-lock"></i>
                        </div>
                      </div>

                      <button class="btn_submit_payment" type="submit">Add Payment</button>
                    </form:form>
                  </div>
                </div>
              </div>
            </c:if>
            <c:if test="${payment_status.equals('payment_available')}">
              <div class="wrapper">
                <div class="payment">
                  <div class="form">
                    <form:form action="bookingcart/payment" method="POST" modelAttribute="accountBanking">
                      <div class="card space icon-relative">
                        <label class="label">Full name</label>
                        <input type="text" class="input" readonly="readonly"
                          value="${accountBanking.full_name}">
                        <i class="fas fa-user"></i>
                      </div>
                      <div class="card space icon-relative">
                        <label class="label">Card number:</label>
                        <input value="${accountBanking.card_number}" class="input" id="cardNumberInput" placeholder="Card Number" readonly="readonly">
                        <i class="far fa-credit-card"></i>
                      </div>
                      <div class="card-grp space">
                        <div class="card-item icon-relative">
                          <label class="label">Expired date:</label>
                          <div class="input">
                            <fmt:formatDate value="${accountBanking.expired_date}" pattern="MM/yy" />
                          </div>
                          <i class="far fa-calendar-alt"></i>
                        </div>
                        <div class="card-item icon-relative">
                          <label class="label">CVV:</label>
                          <input value="${accountBanking.cvv}" class="input" data-mask="000"
                            placeholder="000" readonly="readonly">
                          <i class="fas fa-lock"></i>
                        </div>
                      </div>
                    </form:form>
                  </div>
                </div>
              </div>
            </c:if>
          </div>
        </div>
      </div>
      <div class="main-content-right">
        <div class="booking-summary">
          <div class="booking-summary-info-top">
            <div class="booking-summary-heading">
              <div class="room-p_vnd">VND</div>
              <div class="room-price">
                <fmt:formatNumber value="${totalPrices}" pattern="#,###.##" />
              </div>
              <div class="room-p_total">total</div>
            </div>
            <div class="booking-summary-date_and_staynight">
              <div class="booking-summary-accupancy-room">
                <div class="booking-summary-accupancy-number_of_room">${cartItemList.size()} room,</div>
                <div class="booking-summary-accupancy-number_of_guest">${totalGuests} guests</div>
              </div>
              <div class="booking_space"></div>
              <div class="booking_staynight">${totalDays} night</div>
            </div>
            <div class="booking-summary-room_info"></div>
          </div>
          <div class="booking-summary-stay-detail">
            <div class="booking-summary-stay-detail-heading">Stay details</div>
            <div class="booking-summary-stay-detail-room-detail-list">
              <c:forEach var="cartItem" items="${cartItemList}">
                <div class="booking-summary-stay-detail-room-detail">
                  <div class="booking-summary-stay-detail-room-detail_name"
                    style="display:flex;  justify-content: space-between; flex-direction: row;">
                    <div>${cartItem.roomEntity.room_name}</div>
                    <div>
                      <a href="bookingcart/delete&cartitemid=${cartItem.id}"><i
                          style="color: black; font-size: 13px;" class="far fa-trash-alt"></i></a>
                    </div>
                  </div>

                  <div class="booking-summary-stay-detail-room-detail_info">
                    <div class="booking-summary-stay-detail-room-detail_info_guest">
                      ${cartItem.roomEntity.categoryEntity.max_occupancy} guests</div>
                    <div class="booking-summary-stay-detail-room-detail_info_staynight">
                      ${cartItem.getTotal_night()} night
                    </div>
                    <div class="booking-summary-stay-detail-room-detail_info_space"></div>
                    <div class="booking_staynight"></div>
                  </div>
                  <div class="booking-summary-date_and_staynight">
                    <div class="booking_checkin">
                      <fmt:formatDate value="${cartItem.getCheck_in()}" pattern="dd MMM yy" />
                    </div>
                    <div class="booking-to" style="margin:0px .1em;">-</div>
                    <div class="booking_checkout">
                      <fmt:formatDate value="${cartItem.getCheck_out()}" pattern="dd MMM yy" />
                    </div>
                    <div class="booking_space"></div>

                    <div class="booking-summary-stay-detail-room-detail_info_price">VND
                      <fmt:formatNumber
                        value="${cartItem.roomEntity.categoryEntity.price*cartItem.total_night}"
                        pattern="#,###.##" />
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
            <div class="booking-summary-stay-detail-total">
              <div class="booking-summary-stay-detail-total_total">Total</div>
              <div class="booking-summary-stay-detail-total_space"></div>
              <div  class="booking-summary-stay-detail-total_totalprice">VND
                <fmt:formatNumber value="${totalPrices}" pattern="#,###.##" />
              </div>

            </div>
            <c:if test="${not empty sessionScope.discountedPrice}">
              <div style="margin: 10px; margin-top:2em;" class="alert alert-success" role="alert">
                Discount applied successfully! Total price: <strong style="font-size:120%;">VND <fmt:formatNumber value="${sessionScope.discountedPrice}" pattern="#,###.##" /><strong>
              </div>
            </c:if>
          </div>
            <form style="padding: 0px 20px 0px 20px;" action="bookingcart/discount" method="post">
                <div class="form-group">
                    <label for="discount">Select discount:</label>
                    <div class="row">
                        <div class="col-md-8">
                            <select name="discountId" id="discount-select" onchange="storeDiscountId()" style="height:40px;" class="form-control mb-0 pb-0">
                                <option value="">Choose discount</option>
                                <c:forEach items="${discountList}" var="discount">
                                    <option value="${discount.key}">${discount.value}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-4" style="padding-left: 0px;">
                            <button type="submit" class="btn btn-primary" style="width:100%;height:40px; font-size: 12px;margin-top: 0px;">Apply</button>
                        </div>
                    </div>
                </div>
            </form>
          <c:if test="${payment_status.equals('payment_available')}">
            <form action="bookingcart/checkout" id="checkoutForm" method="POST">
              <div style="padding-top: 0px;" class="customer_note ">
                <input name="note" class="input_note" type='text' placeholder='Enter your note...' />
              </div>
              <div class="button_checkout">
                <button style="margin-top: 0px;" type="submit" class="btn_checkout" id="checkout-button"
                  onclick="display_data()">Check Out</button>
            </form>
        </div>
    </c:if>
  </div>
  </div>
  </c:if>
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
<!-- Preloader -->
<div id="loader-overlay">
<div class="loader">
  <div class="inner one"></div>
  <div class="inner two"></div>
  <div class="inner three"></div>
</div>
</div>
</div>

<script>
function storeDiscountId() {
  var discountSelect = document.getElementById("discount-select");
  var selectedValue = discountSelect.options[discountSelect.selectedIndex].value;
  localStorage.setItem("discount", selectedValue);
}

window.onload = function() {
  var discountSelect = document.getElementById("discount-select");
  var storedValue = localStorage.getItem("discount");
  if (storedValue) {
    discountSelect.value = storedValue;
  }
}

$(document).ready(function () {
  $("#customer-detail").click(function () {
    $("#customer-detail-content").slideToggle("slow");
  });
});
</script>
<script>
$(document).ready(function () {
  $("#customer-review").click(function () {
    $("#customer-review-content").slideToggle("slow");
  });
});
</script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<!-- Include Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</html>