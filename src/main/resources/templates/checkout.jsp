<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
	xmlns:sec="https://www.thymeleaf.org/thymeleaf-extras-springsecurity5">
<head>
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Booking Cart</title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Racing+Sans+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <!-- CSS -->
    <link rel="icon" type="image/svg" href="resources/static/image/favicon_KL.svg">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'>
          <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.3.1/css/all.css'>
    <link href='../resources/static/css/checkout.css' rel='stylesheet'>
    <!--FAVICON -->
    <link href='../resources/static/images/favicon_KL.svg' rel='shortcut icon'>
    <meta name="robots" content="noindex,follow" />
</head>

<body>
    <div class="header_top">
        <div class="header-left">
          <a href="/" class="logo"><img src="../resources/static/images/logo_KL-06.png" alt=""></a>
        </div>
        <div class="header-right">
          <a href="../account/profile">Thông tin</a>
          <a href="../account/order">Đơn hàng</a>
          <a class="active" href="/cart">Giỏ hàng</a>
        </div>
      </div>
      <div class="mainscreen">
        <!-- <img src="../resources/static/images/logo_KL-06.png"  class="bgimg " alt="">-->
          <div class="card">
            <div class="leftside">
              <div class="leftside_img"> <img src="../resources/static/images/logo_KL-06.png" alt=""></div>
              <div class="leftside_content">
                <div class="leftside_content_card">
                  <div class="order_footer" style="margin-bottom: 1em;">
                    <div class="d-flex justify-content-between">
                      <p class="fw-bold mb-0" style="width: 100%; font-weight: bold; font-size: 20px;">Thông tin đơn hàng</p>
                    </div>
                   <div class="d-flex justify-content-between pt-2">
                     <p class="text-muted mb-0" style="width: 100%; line-height:25px;">Số lượng SP : <span style="font-weight: bold;" th:text="${session.bookingCartItemList.size()}+' sản phẩm'"> Sản phẩm</span></p>
                   </div>
                   <div class="d-flex justify-content-between pt-2">
                     <p class="text-muted mb-0" style="width: 100%; line-height:25px;">Giảm giá : <span style="font-weight: bold;">30.000 VNĐ</span></p>
                   </div>
                   <div class="d-flex justify-content-between pt-2">
                     <p class="text-muted mb-0" style="width: 100%; line-height:25px;">Phí ship : <span style="font-weight: bold;">30.000 VNĐ</span></p>
                   </div>
                   <div class="d-flex justify-content-between pt-2">
                     <p class="text-muted mb-0" style="width: 100%; line-height:25px;">Tổng cộng : <span style="font-weight: bold;" th:text="${#numbers.formatDecimal(session.lastTotalPrice/1000, 0, 'COMMA', 3, 'POINT')+ ' VNĐ'}">600.000 VNĐ</span></p>
                   </div>
                   </div>
                </div>
              </div>
            </div>
            <div class="rightside">
              <form action="checkout" method="POST" modelAttribute="orderEntity">
                <h2 class="card_h1">Đặt hàng</h2>
                <p>Người nhận hàng</p>
                <input type="text" class="inputbox" name="first_name" required th:value="${account.first_name}"/>
                <p>Số điện thoại</p>
                <input type="text" class="inputbox" name="customer_phone" id="card_number" required th:value="${account.phone}" />
                <p>Địa chỉ</p>
                <input type="text" class="inputbox" name="customer_address" id="card_number" required th:value="${account.address}"/>
                <p>Ghi chú</p>
                <input type="text" class="inputbox" name="order_note" id="card_number"/>

                <!-- <p>Card Type</p>
                <select class="inputbox" name="card_type" id="card_type" required>
                  <option value="">--Select a Card Type--</option>
                  <option value="Visa">Visa</option>
                  <option value="RuPay">RuPay</option>
                  <option value="MasterCard">MasterCard</option>
                </select> -->
                <button type="submit" class="button">Đặt hàng</button>
              </form>
            </div>
          </div>
        </div>
        <footer>
          <div class="footer_container">
            <div class="footer-contents">
              <div class="footer-content" style="text-align: center;">
                <img src="../resources/static/images/logo_KL-06.png" alt="Image 1">
              </div>
              <div class="footer-content" style="padding-top: .5em;">
                <h3>Về chúng tôi</h3>
                <p>Cung cấp các loại giày bóng đá giá rẻ, phù hợp với thị trường và nhu cầu của anh em đam mê đá
                  bóng.</p>
              </div>
              <div class="footer-content" style="padding-top: .5em;">
                <h3>Liên hệ</h3>
                <p><strong>Địa chỉ:</strong> K25 Đỗ Thế Chấp, Tam Kỳ, Quảng Nam</p>
                <p><strong>Phone:</strong> 038 571 8282</p>
                <p><strong>Email:</strong> trinhthanhdat8282@gmail.com</p>
              </div>
              <div class="footer-content" style="padding-top: .5em;">
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
