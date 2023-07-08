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
    <link href='../resources/static/css/successpage.css' rel='stylesheet'>
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
     <main>
     <div class="container mt-4 mb-4" style="padding-top:3em; min-height:500px;">
       <div class="row d-flex cart align-items-center justify-content-center">
           <div class="col-md-10">
               <div class="card">
                   <div class="row g-0">
                       <div class="col-md-6 border-right p-5">
                           <div class="text-center order-details">
                               <div class="d-flex justify-content-center mb-5 flex-column align-items-center">
                               <span class="check1">
                               <div class="typewriter">
                                   <div class="slide"><i></i></div>
                                   <div class="paper"></div>
                                   <div class="keyboard"></div>
                               </div>
                               </span>
                               <span class="font-weight-bold" style="color: green; font-size: 130%;">Đặt hàng thành công</span>
                               <small class="mt-2" style="font-size: 130%;" th:text="'Mã VĐ: '+${orderEntity.orderCode}"> 3234324324</small>
                               <small class="mt-2">Đơn hàng của bạn sẽ sớm được giao</small> <a th:href="'/account/orderDetail&orderid='+${orderEntity.id}" class="text-decoration-none invoice-link">Xem chi tiết đơn hàng</a> </div>
                               <a th:href="'../'" class="btn_back">Trang chủ</a>
                           </div>
                       </div>
                       <div class="col-md-6 background-muted">
                           <div class="p-3 border-bottom">
                               <div class="d-flex justify-content-between align-items-center"> <span><i class="fa fa-clock-o text-muted"></i> Nhận hàng 3-4 ngày</span> <span><i class="fa fa-refresh text-muted"></i> Hỗ trợ đổi trả</span> </div>
                           </div>
                           <div class="row g-0 border-bottom">
                               <div class="col-md-6">
                                   <div class="p-3 d-flex justify-content-center align-items-center"> <span>Tổng</span> </div>
                               </div>
                               <div class="col-md-6">
                                   <div class="p-3 d-flex justify-content-center align-items-center"> <span th:text="${#numbers.formatDecimal((orderEntity.totalPrice - orderEntity.shippingCod)/1000, 0, 'COMMA', 3, 'POINT')}">$60</span> </div>
                               </div>
                           </div>
                           <div class="row g-0 border-bottom">
                               <div class="col-md-6">
                                   <div class="p-3 d-flex justify-content-center align-items-center"> <span>Giảm giá</span> </div>
                               </div>
                               <div class="col-md-6">
                                   <div class="p-3 d-flex justify-content-center align-items-center"> <span th:text="${#numbers.formatDecimal(orderEntity.shippingCod/1000, 0, 'COMMA', 3, 'POINT')}">$60</span> </div>
                               </div>
                           </div>
                           <div class="row g-0 border-bottom">
                               <div class="col-md-6">
                                   <div class="p-3 d-flex justify-content-center align-items-center"> <span>Phí ship</span> </div>
                               </div>
                               <div class="col-md-6">
                                   <div class="p-3 d-flex justify-content-center align-items-center"> <span th:text="${#numbers.formatDecimal(orderEntity.shippingCod/1000, 0, 'COMMA', 3, 'POINT')}">$1.80</span> </div>
                               </div>
                           </div>
                           <div class="row g-0">
                               <div class="col-md-6">
                                   <div class="p-3 d-flex justify-content-center align-items-center"> <span class="font-weight-bold">Thành tiền</span> </div>
                               </div>
                               <div class="col-md-6">
                                   <div class="p-3 d-flex justify-content-center align-items-center" style="font-size: 150%;"> <span class="font-weight-bold" th:text="${#numbers.formatDecimal(orderEntity.totalPrice/1000, 0, 'COMMA', 3, 'POINT')}">$61.80</span> </div>
                               </div>
                           </div>
                       </div>
                   </div>
                   <div> </div>
               </div>
           </div>
       </div>
   </div>
   </main>
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
