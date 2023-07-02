<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
	xmlns:sec="https://www.thymeleaf.org/thymeleaf-extras-springsecurity5">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resources/static/css/orderdetail.css">
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="../resources/static/css/admin/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="../resources/static/css/admin/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
            <link href='../resources/static/images/favicon_KL.svg' rel='shortcut icon'>
    <title>Quản lý đơn hàng</title>
</head>
<body>
    <div class="header_top">
        <div class="header-left">
          <a href="/" class="logo"><img src="../resources/static/images/logo_KL-06.png" alt=""></a>
        </div>
        <div class="header-right">
          <a href="../account/profile">Thông tin</a>
          <a class="active" href="../account/order">Đơn hàng</a>
          <a href="/cart">Giỏ hàng</a>
        </div>
      </div>
   <div class="header_top">
       <div class="header-left">
         <a href="/" class="logo"><img src="../resources/static/images/logo_KL-06.png" alt=""></a>
       </div>
       <div class="header-right">
         <a href="#home">Thông tin</a>
         <a class="active" href="/order">Đơn hàng</a>
         <a href="/cart">Giỏ hàng</a>
       </div>
     </div>
         <section class="container">
           <div class="container py-5 h-100" style="margin-bottom: -60px;">
             <div class="row d-flex justify-content-center align-items-center h-100">
               <div class="col-lg-10 col-xl-8">
                 <div class="card" style="border-radius: 10px;">
                   <div class="card-header px-4 py-5">
                     <h5 class="text-muted mb-0">Cảm ơn bạn đã đặt hàng, <span style="color: #18b5f9;"th:text="${session.account.username}"></span>!</h5>
                   </div>
                   <div class="card-body p-4">
                     <div class="d-flex justify-content-between align-items-center mb-4">
                       <p class="lead fw-normal mb-0" style="color: #a8729a;">Sản phẩm</p>
                       <p class="small text-muted mb-0">Mã vận đơn : <span th:text="${orderDetailList[0].orderEntity.orderCode}"></span></p>
                     </div>
                     <div class="card shadow-0 border mb-4" th:each="item :${orderDetailList}">
                       <div class="card-body">
                         <div class="row">
                           <div class="col-md-2">
                             <img th:src="'../getImagePhoto/'+${item.productEntity.id}"
                               class="img-fluid" alt="Phone">
                           </div>
                               <div class="col-md-3 text-center d-flex justify-content-center align-items-center">
                                 <p class="text-muted mb-0" th:text="${item.productEntity.product_name}"></p>
                               </div>
                               <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                 <p class="text-muted mb-0 small">Màu: <span th:text="${item.color}"></span></p>
                               </div>
                               <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                 <p class="text-muted mb-0 small">Size: <span th:text="${item.size}"></span></p>
                               </div>
                               <div class="col-md-1 text-center d-flex justify-content-center align-items-center">
                                 <p class="text-muted mb-0 small">SL: <span th:text="${item.quantity}"></span></p>
                               </div>
                               <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                 <p class="text-muted mb-0 small"><span th:text="${item.price}+' VND'"></span></p>
                               </div>
                         </div>
                       </div>
                     </div>
                     <div class="d-flex justify-content-between pt-2">
                       <p class="fw-bold mb-0" style="width: 60%; font-weight: bold;">Chi tiết đơn hàng</p>
                     </div>
                     <div class="order_footer">
                     <div class="d-flex justify-content-between pt-2">
                       <p class="text-muted mb-0" style="width: 60%; line-height:25px;">Người nhận : <span style="font-weight: bold;" th:text="${orderDetailList[0].customer_name}">Thanh Tâm</span></p>
                       <p class="text-muted mb-0" style="width: 40%; line-height:25px;padding: 0px 5px;"><span class="fw-bold me-4">Giảm giá:</span> <span style="font-weight: bold;" th:text="${orderDetailList[0].discount}">30.000</span></p>
                     </div>

                     <div class="d-flex justify-content-between">
                       <p class="text-muted mb-0" style="width: 60%;">Số điện thoại: <span style="font-weight: bold;" th:text="${orderDetailList[0].customer_phone}">0384203345</span></p>
                       <p class="text-muted mb-0" style="width: 40%;line-height:25px;padding: 0px 5px;"><span class="fw-bold me-4">Phí ship:</span> <span style="font-weight: bold;" th:text="${#numbers.formatDecimal(orderDetailList[0].cod_shipping/1000, 0, 'COMMA', 3, 'POINT')}+' VND'">30.000</span></p>
                     </div>

                     <div class="d-flex justify-content-between mb-5">
                       <p class="text-muted mb-0" style="width: 60%;">Đại chỉ: <span style="font-weight: bold;padding: 0px 10px 0px 0px;" th:text="${orderDetailList[0].customer_address}">K85/58 Nguyễn Chánh, Liên Chiểu, Đà Nẵng</span></p>
                       <p class="text-muted mb-0" style="width: 40%;line-height:25px;padding: 0px 5px;"><span class="fw-bold me-4">Ngày đặt: </span> <span style="font-weight: bold;" th:text="${orderDetailList[0].orderEntity.orderDate}">21/02/2023</span></p>
                     </div>
                   </div>
                   <div class="card-footer border-0 px-4 py-5"
                     style="background-color: #18b5f9; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                     <h5 class="d-flex align-items-center justify-content-center text-white text-uppercase mb-0"><span class="h2 mb-0 ms-2" th:text="'₫ '+${#numbers.formatDecimal(orderDetailList[0].orderEntity.totalPrice/1000, 0, 'COMMA', 3, 'POINT')}"> 300.000 VNĐ</span></h5>
                   </div>
                 </div>
                 </div>
               </div>
             </div>
             <div class="back_btn">
             <a class="a_btn" href="../account/order" style="border: 1px solid #00000021;">
               <svg height="16" width="16" xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 1024 1024"><path d="M874.690416 495.52477c0 11.2973-9.168824 20.466124-20.466124 20.466124l-604.773963 0 188.083679 188.083679c7.992021 7.992021 7.992021 20.947078 0 28.939099-4.001127 3.990894-9.240455 5.996574-14.46955 5.996574-5.239328 0-10.478655-1.995447-14.479783-5.996574l-223.00912-223.00912c-3.837398-3.837398-5.996574-9.046027-5.996574-14.46955 0-5.433756 2.159176-10.632151 5.996574-14.46955l223.019353-223.029586c7.992021-7.992021 20.957311-7.992021 28.949332 0 7.992021 8.002254 7.992021 20.957311 0 28.949332l-188.073446 188.073446 604.753497 0C865.521592 475.058646 874.690416 484.217237 874.690416 495.52477z"></path></svg>
               <span>Back</span>
             </a>
             </div>
           </div>
         </section>
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