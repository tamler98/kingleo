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
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'>
                      <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.3.1/css/all.css'>
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
     <main>
    <section class="vh-100 gradient-custom-2">
    <div class="row">
    <h1 class="order_h1"><span>BẠN CÓ</span><span style="font-size:120%; color:#ffee00;font-weight:bold;margin:0px 8px; padding-bottom: 2px;" th:text="${orderList.size()}"></span><span> ĐƠN HÀNG</span><h1>
    </div>
        <div class="row">
            <div class="col-sm-4" th:each="item: ${orderList}">
                <div class="modal fade" th:id="'deleteItem'+${item.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true" style="top:60px;">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="staticBackdropLabel">Hủy đơn hàng</h5>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          Bạn muốn hủy đơn hàng này chứ? Hãy chắc chắn trước khi quyết định nhé!
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                          <a th:href="'../account/cancelorderid='+${item.id}" type="button" class="btn btn-primary">Đúng vậy!</a>
                        </div>
                      </div>
                    </div>
                  </div>



                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                      <div class="col-md-10 col-lg-8 col-xl-6" style="min-width: 100%;">
                        <div class="card card-stepper" style="border-radius: 16px;">
                          <div class="card-header p-4">
                            <div class="d-flex justify-content-between align-items-center">
                              <div class="order_header_left">
                                <p class="text-muted mb-2"> Mã VĐ: <span class="fw-bold text-body" th:text="${item.orderCode}"></span></p>
                                <p class="text-muted mb-0"> Ngày đặt: <span class="fw-bold text-body" th:text="${item.orderDate}"></span> </p>
                              </div>
                              <div class="order_header_right">
                                <p class="text-muted mb-0" style="margin-top:5px; font-size: 16px;"> Status: <span class="fw-bold text-body" style="font-weight:500; color: #009b0d;" th:text="${item.orderStatus}"></span> </p>
                              </div>
                            </div>
                          </div>
                          <div class="card-body p-4">
                            <div class="d-flex flex-row mb-4 pb-2">
                              <div class="flex-fill" style="max-width: 50%;">
                              <div th:if="${item.getOrderDetailEntityList().size()} == 1">
                              <h5 class="bold limit-text" th:text="${item.orderDetailEntityList[0].productEntity.product_name}"></h5>
                              </div>
                              <div th:if="${item.getOrderDetailEntityList().size()}>1">
                                <h5 class="bold limit-text" th:text="${item.orderDetailEntityList[0].productEntity.product_name}+' ,'+${item.orderDetailEntityList[1].productEntity.product_name}+' ,'+${item.orderDetailEntityList[1].productEntity.product_name}+' ,'+${item.orderDetailEntityList[1].productEntity.product_name}"></h5>
                               </div>
                                <p class="text-muted" th:text="'SL: '+${item.orderDetailEntityList.size()}+' item'"> </p>
                                <h4 class="mb-3" th:text="'Cost: '+${#numbers.formatDecimal((item.totalPrice + item.shippingCod)/1000, 0, 'COMMA', 3, 'POINT')}"> <span class="small text-muted"></span></h4>
                                <p class="text-muted">Cập nhật:  <span class="text-body">11:30pm, Today</span></p>
                              </div>
                              <div>
                                <img class="align-self-center img-fluid"
                                  th:src="'/getImagePhoto/'+${item.orderDetailEntityList[0].productEntity.id}" width="250">
                              </div>
                            </div>
                            <ul id="progressbar-1" class="mx-0 mt-0 mb-5 px-0 pt-0 pb-4" th:if="${item.orderStatus} == 'ORDERED'">
                              <li class="step0 active" id="step1"><span style="margin-left: 22px; margin-top: 12px;">Đã đặt</span></li>
                              <li class="step0 text-center" id="step2"><span></span></li>
                              <li class="step0 text-muted text-end" id="step3"><span style="margin-right: 22px;"></span></li>
                            </ul>
                            <ul id="progressbar-1" class="mx-0 mt-0 mb-5 px-0 pt-0 pb-4" th:if="${item.orderStatus} == 'RECEIVED'">
                              <li class="step0 active" id="step1"><span style="margin-left: 22px; margin-top: 12px;">Đã đặt</span></li>
                              <li class="step0 active text-center" id="step2"><span>Đã tiếp nhận</span></li>
                              <li class="step0 text-muted text-end" id="step3"><span style="margin-right: 22px;"></span></li>
                            </ul>
                            <ul id="progressbar-1" class="mx-0 mt-0 mb-5 px-0 pt-0 pb-4" th:if="${item.orderStatus} == 'SHIPPING'">
                              <li class="step0 active" id="step1"><span style="margin-left: 22px; margin-top: 12px;">Đã đặt</span></li>
                              <li class="step0 active text-center" id="step2"><span>Đã tiếp nhận</span></li>
                              <li class="step0 text-muted text-end" id="step3"><span style="margin-right: 22px;">Đang vận chuyển</span></li>
                            </ul>
                            <ul id="progressbar-1" class="mx-0 mt-0 mb-5 px-0 pt-0 pb-4" th:if="${item.orderStatus} == 'DELIVERED'">
                              <li class="step0 active" id="step1"><span style="margin-left: 22px; margin-top: 12px;">Đã đặt</span></li>
                              <li class="step0 active text-center" id="step2"><span>Đã tiếp nhận</span></li>
                              <li class="step0 active text-muted text-right" id="step3"><span style="margin-right:20px;">Đã giao</span></li>
                            </ul>
                            <ul id="progressbar-1" class="mx-0 mt-0 mb-5 px-0 pt-0 pb-4" th:if="${item.orderStatus} == 'CANCEL'">
                              <li class="step0 active" id="step1"><span style="margin-left: 22px; margin-top: 12px;">Đã đặt</span></li>
                              <li class="step0 active text-center" id="step2"><span>Đã tiếp nhận</span></li>
                              <li class="step0 active text-muted text-right" id="step3"><span style="margin-right:20px;  color: red; font-weight:bold;">CANCEL</span></li>
                            </ul>
                            <ul id="progressbar-1" class="mx-0 mt-0 mb-5 px-0 pt-0 pb-4" th:if="${item.orderStatus} == 'BOOM'">
                              <li class="step0 active" id="step1"><span style="margin-left: 22px; margin-top: 12px;">Đã đặt</span></li>
                              <li class="step0 active text-center" id="step2"><span>Đã tiếp nhận</span></li>
                              <li class="step0 active text-muted text-right" id="step3"><span style="margin-right:17px; color: red; font-weight:bold;">BOOM</span></li>
                            </ul>
                          </div>
                          <div class="card-footer p-4">
                            <div class="d-flex justify-content-between">
                              <h5 class="fw-normal mb-0"><a class="card-footer-a" th:href="'../account/orderDetail&orderid='+${item.id}">Chi tiết</a></h5>
                              <div class="border-start h-100"></div>
                              <button type="button" class="btn btn-primary" data-bs-toggle="modal" th:data-bs-target="'#deleteItem'+${item.id}" style="background: none;border: none; color: red; font-weight: 600;">Hủy đơn</button>
                              <div class="border-start h-100"></div>
                              <h5 class="fw-normal mb-0"><a class="card-footer-a" th:href="'../account/repayorderid='+${item.id}">Mua lại</a></h5>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
            </div>
            </div>
        </div>
      </section>
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