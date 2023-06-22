	<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
	xmlns:sec="https://www.thymeleaf.org/thymeleaf-extras-springsecurity5">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <!-- Fonts -->
            <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
            <link href="https://fonts.googleapis.com/css2?family=Racing+Sans+One&display=swap" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
            <!-- CSS -->
            <link href='/resources/static/css/product.css' rel='stylesheet'>
            <link rel="icon" type="image/svg" href="resources/static/image/favicon_KL.svg">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
            <link href='../resources/static/css/style.css' rel='stylesheet'>
            <!--FAVICON -->
            <link href='../resources/static/images/favicon_KL.svg' rel='shortcut icon'>
            <meta name="robots" content="noindex,follow" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <title>Trang chủ</title>
</head>
<body>
 <header th:include="header :: header"></header>
    <main>
	<div class="popular_product1">
        <div class="container-xl">
            <h2>Featured <b>Products</b></h2>
            <!-- Wrapper for carousel items -->
            <div class="item">
                <div class="row">
                    <div id="product_${item.id}" class="col-sm-3" th:each="item : ${productList}">
                        <form action="addToCart/${item.id}" method="POST" modelAttribute="product">
                            <div class="thumb-wrapper">
                                <span class="wish-icon"><i class="fa fa-heart-o"></i></span>
                                <div class="img-box">
                                    <a th:href="'product/productId=' + ${item.id}">
                                        <img src="resources/static/images/product/product2.jpg" alt="Image 1">
                                    </a>
                                </div>
                                <div class="thumb-content">
                                    <h4><a href="/product/productId=${item.id}" th:text="${item.product_name}"></a></h4>
                                    <div class="choose_color">
                                        <label for="" class="size_label">Màu:</label>
                                        <th:block th:each="color : ${item.productColorEntities}">
                                            <button class="color_btn"
                                                th:onclick="setColor(${item.id}, event, '${color.color_name}')"
                                                th:text="${color.color_name}"></button>
                                        </th:block>
                                    </div>
                                    <div class="choose_size">
                                        <label for="" class="size_label">Size:</label>
                                        <button type="button" class="size_btn"
                                            onclick="setSize(${item.id}, event, '38')">38</button>
                                        <button type="button" class="size_btn"
                                            onclick="setSize(${item.id}, event, '39')">39</button>
                                        <button type="button" class="size_btn"
                                            onclick="setSize(${item.id}, event, '40')">40</button>
                                        <button type="button" class="size_btn"
                                            onclick="setSize(${item.id}, event, '41')">41</button>
                                        <button type="button" class="size_btn"
                                            onclick="setSize(${item.id}, event, '42')">42</button>
                                        <button type="button" class="size_btn"
                                            onclick="setSize(${item.id}, event, '43')">43</button>
                                    </div>
                                    <div class="thumb-content_footer">
                                        <p class="item-price" th:text="${item.price}+VNĐ"><b></b></p>
                                        <button type="submit" class="btn btn-primary" onclick="updateOrderDetails()">Mua
                                            ngay</button>
                                    </div>
                                </div>
                            </div>

                            <!-- Thêm hai trường ẩn để lưu trữ giá trị màu và kích thước -->
                            <input type="hidden" id="colorInput_${item.id}" name="color" value="">
                            <input type="hidden" id="sizeInput_${item.id}" name="size" value="">
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>


                <div class="product_footer">
                    <div class="pagination">
                        <th:block th:if="${totalPages > 1}">
                            <th:block th:if="${currentPage > 0}">
                                <a th:href="@{(${currentPage - 1})}">&laquo;</a>
                            </th:block>
                            <th:block th:each="i : ${#numbers.sequence(0, totalPages - 1)}">
                                <a th:href="@{${i}}">${i + 1}</a>
                            </th:block>
                            <th:block th:if="${currentPage < totalPages - 1}">
                                <a th:href="@{(${currentPage + 1})}">&raquo;</a>
                            </th:block>
                        </th:block>
                    </div>
                </div>

	</main>
	<footer>
	<div class="footer_container">
                      <div class="footer-content">
                        <div class="footer-column" style="text-align: center;">
                            <img src="resources/static/images/logo_KL-06.png" alt="Image 1">
                        </div>
                        <div class="footer-column" style="padding-top: .5em;">
                          <h3>Về chúng tôi</h3>
                          <p>Cung cấp các loại giày bóng đá giá rẻ, phù hợp với thị trường và nhu cầu của anh em đam mê đá bóng.</p>
                        </div>
                        <div class="footer-column" style="padding-top: .5em;">
                          <h3>Liên hệ</h3>
                          <p><strong>Địa chỉ:</strong> K25 Đỗ Thế Chấp, Tam Kỳ, Quảng Nam</p>
                          <p><strong>Phone:</strong> 038 571 8282</p>
                          <p><strong>Email:</strong> trinhthanhdat8282@gmail.com</p>
                        </div>
                        <div class="footer-column" style="padding-top: .5em;">
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
    $(document).ready(function(){
        $(".wish-icon i").click(function(){
            $(this).toggleClass("fa-heart fa-heart-o");
        });
    });
    </script>

 <script>
  function setColor(productId, event, color) {
    event.preventDefault();
    // Cập nhật giá trị màu trong trường ẩn của sản phẩm có productId
    var colorInput = document.getElementById("colorInput_" + productId);
    colorInput.value = color;

    // Loại bỏ lớp 'selected' từ tất cả các nút màu của sản phẩm
    var colorButtons = document.querySelectorAll("#product_" + productId + " .color_btn");
    colorButtons.forEach(function(button) {
      button.classList.remove("selected");
    });

    // Thêm lớp 'selected' vào nút màu được chọn
    event.target.classList.add("selected");
  }

  function setSize(productId, event, size) {
    event.preventDefault();
    // Cập nhật giá trị kích thước trong trường ẩn của sản phẩm có productId
    var sizeInput = document.getElementById("sizeInput_" + productId);
    sizeInput.value = size;

    // Loại bỏ lớp 'selected' từ tất cả các nút kích thước của sản phẩm
    var sizeButtons = document.querySelectorAll("#product_" + productId + " .size_btn");
    sizeButtons.forEach(function(button) {
      button.classList.remove("selected");
    });

    // Thêm lớp 'selected' vào nút kích thước được chọn
    event.target.classList.add("selected");
  }

  function updateOrderDetails() {
    // Thực hiện bất kỳ xử lý bổ sung trước khi gửi biểu mẫu (nếu cần)

    // Gửi biểu mẫu
    document.querySelector("form").submit();
  }
 </script>
    <script>
      document.addEventListener("DOMContentLoaded", function() {
          var currentPage = "${currentPage}"; // Lấy giá trị của biến currentPage từ JSP

          // Tìm tất cả các thẻ <a> trong phần tử có lớp pagination
          var pageLinks = document.querySelectorAll(".pagination a");

          // Lặp qua các thẻ <a> và kiểm tra xem có phải là trang hiện tại hay không
          for (var i = 0; i < pageLinks.length; i++) {
            if (pageLinks[i].textContent - 1 === parseInt(currentPage)) {
              pageLinks[i].classList.add("active-page"); // Thêm lớp active-page cho liên kết hiện tại
            }
          }
        });
    </script>
</html>