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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- CSS -->
    <link rel="icon" type="image/svg" href="resources/static/image/favicon_KL.svg">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'>
          <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.3.1/css/all.css'>
    <link href='../resources/static/css/bookingcart1.css' rel='stylesheet'>
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
        <div class="container mt-5 mb-5">
          <div class="d-flex justify-content-center row">
            <div class="col-md-12">
              <div class="p-2">
                <h4>Giỏ hàng của bạn</h4>
                <div class="d-flex flex-row align-items-center pull-right"><span class="mr-1">Sort by:</span><span
                    class="mr-1 font-weight-bold">Price</span><i class="fa fa-angle-down"></i></div>
              <p id="message" th:text="${session.msg}" style="display: none; color:red; padding-top:5px; font-weight:bold;"></p>


              <div class="d-flex flex-row justify-content-between align-items-center p-2 bg-white mt-4 px-3 rounded" style="min-height: 100px;" th:each="item,itemIndex : ${session.bookingCartItemList}">
                <div class="mr-1">
                    <div class="mr-1_img">
                        <img class="rounded"
                            th:src="'/getImagePhoto/'+${item.productDetailEntity.productEntity.id}"
                            width="70">
                    </div>
                </div>
                <div class="d-flex flex-column align-items-left product-details"><span class="product_name" th:text="${item.productDetailEntity.productEntity.product_name}">Giày bóng đá
                    Kingleo Football Wika 3 sọc</span>
                  <div class="d-flex flex-row product-desc">
                    <div class="size mr-1"><span class="text-grey" >Size:</span><span
                        class="font-weight-bold" th:text="${item.size}">&nbsp;39</span></div>
                    <div class="color"><span class="text-grey">Màu:</span><span class="font-weight-bold" th:text="${item.color}">&nbsp;Đỏ</span>
                    </div>
                  </div>
                </div>
                <div class="d-flex flex-row align-items-center qty">
                              <form th:action="'cart/decreaseitemid='+${itemIndex.index}" method="post">
                                <button class="de_in_btn" type="submit"><i class="fa fa-minus text-danger"></i></button>
                              </form>
                              <h5 class="text-grey mt-1 mr-1 ml-1" th:text="${item.quantity}"></h5>
                              <form th:action="'cart/increaseitemid='+${itemIndex.index}" method="post">
                                <button class="de_in_btn" type="submit"><i class="fa fa-plus text-success"></i></button>
                            </form>
                            </div>
                <div>
                  <h5 class="text-grey" th:text="${#numbers.formatDecimal((item.productDetailEntity.productEntity.price/1000)*item.quantity, 0, 'COMMA', 3, 'POINT')}">300.000</h5>
                </div>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" th:data-bs-target="'#deleteItem'+${itemIndex.index}" style="background: none;border: none;">
                <div class="d-flex align-items-center"><i class="fa fa-trash mb-1 text-danger"></i></div>
                </button>

                <div class="modal fade" th:id="'deleteItem'+${itemIndex.index}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true" style="top:60px;">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Xoá sản phẩm khỏi giỏ hàng</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        Bạn muốn xoá sản phẩm này khỏi giỏ hàng chứ?
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <a th:href="'cart/deleteItem'+${itemIndex.index}" type="button" class="btn btn-primary">Đúng vậy!</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <form th:action="'../cart/addDiscount'" method="post">
                <div class="d-flex flex-row align-items-center mt-3 p-2 bg-white rounded">
                <input type="text" class="form-control border-0 gift-card" name="discount_code" placeholder="Mã giảm giá">
                    <div class="discount_using" th:if="${session.discountEntity != null}">
                    <span style="min-width: 87px;">Đã áp dụng: </span>
                    <span style="min-width: 160px;"class="discount_name" type="button" th:text="${session.discountEntity.name}">Sử dụng</span>
                    </div>
                  <button class="btn btn-outline-warning btn-sm ml-2" type="submit">Sử dụng</button>
                </div>
              </form>
              <div class="d-flex flex-row align-items-center mt-3 p-2 bg-white rounded">
              <div class="order_info">
                  <div class="order_info_left">
                      <p th:text="Tổng"></p>
                      <p th:text="'Giảm giá:'"></p>
                      <p th:text="'Phí ship:'"></p>
                      <p th:text="'Thành tiền:'"></p>
                  </div>
                  <div class="order_info_right">
                    <p th:text="${#numbers.formatDecimal(session.totalPrice/1000, 0, 'COMMA', 3, 'POINT')}"></p>
                    <p th:text="${#numbers.formatDecimal(session.discount/1000, 0, 'COMMA', 3, 'POINT')}"></p>
                    <p th:text="${#numbers.formatDecimal(session.shipping_cod/1000, 0, 'COMMA', 3, 'POINT')}"></p>
                    <p th:text="${#numbers.formatDecimal(session.lastTotalPrice/1000, 0, 'COMMA', 3, 'POINT')}"></p>
                  </div>
              </div>
              </div>
              <div class="d-flex flex-row align-items-center mt-3 p-2 bg-white rounded"><a th:href="'/cart/checkout'"
                  class="btn btn-warning btn-block btn-lg ml-2 pay-button">Tiếp theo</a></div>
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
<script>
    // Lấy tham chiếu đến phần tử <p>
    var messageElement = document.getElementById("message");

    // Hiển thị phần tử <p> và nội dung trong 5 giây
    messageElement.style.display = "block";
    setTimeout(function() {
        messageElement.style.display = "none";
    }, 5000);
</script>
<script>
    setTimeout(function() {
        // Gửi yêu cầu HTTP để xóa session
        fetch('/remove-session', { method: 'POST' })
            .then(function() {
                // Xóa giá trị session.msg
                document.getElementById('message').innerText = '';
            })
            .catch(function(error) {
                console.log('Lỗi xảy ra khi gửi yêu cầu xóa session:', error);
            });
    }, 5000);
</script>
</html>
