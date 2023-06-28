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
    <link rel="icon" type="image/svg" href="resources/static/image/favicon_KL.svg">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href='../resources/static/css/style.css' rel='stylesheet'>
    <!--FAVICON -->
    <link href='../resources/static/images/favicon_KL.svg' rel='shortcut icon'>
    <meta name="robots" content="noindex,follow" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>KingLeo Football</title>
</head>
<body>
    <header th:include="header :: header"></header>
        <main style="background: white;">
            <div class="slogan">KING LEO FOOTBALL - NÂNG NIU ĐÔI BÀN CHÂN BẠN!</div>
            <div class="slider">
                <div class="slide active">
                    <img src="resources/static/images/slide/slide-02.png" alt="Image 1">
                </div>
                <div class="slide">
                    <img src="resources/static/images/slide/slide-03.png" alt="Image 2">
                </div>
                <div class="slide">
                    <img src="resources/static/images/slide/slide-05.png" alt="Image 3">
                </div>
                <a class="prev" onclick="prevSlide()">&#10094;</a>
                <a class="next" onclick="nextSlide()">&#10095;</a>
            </div>
            <div class="nav_branch_logo">
                <a href=""><img src="resources/static/images/brand/logo__nike.jpg" alt="" class="brand_logo"></a>
                <a href=""><img src="resources/static/images/brand/logo__adidas.jpg" alt="" class="brand_logo"></a>
                <a href=""><img src="resources/static/images/brand/logo__ct3.jpg" alt="" class="brand_logo"></a>
                <a href=""><img src="resources/static/images/brand/logo__kamito.jpg" alt="" class="brand_logo"></a>
                <a href=""><img src="resources/static/images/brand/logo__mizuno.jpg" alt="" class="brand_logo"></a>
                <a href=""><img src="resources/static/images/brand/logo__kingleo.jpg" alt="" class="brand_logo"></a>
            </div>
            <div class="popular_product">
                <div class="popular_product_header">
                    <h2>SẢN PHẨM <b>BÁN CHẠY</b></h2>
                </div>
                <div class="popular_product_product_lines">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="popular_product_product_line">
                                <div class="astra-shop-thumbnail-wrap">
                                    <a href=""><img src="resources/static/images/product/product2.jpg"
                                            alt="Image 1"></a>
                                </div>
                                <div class="astra-shop-summary-wrap">
                                    <div class="product_category"><a href="" class="product_link">Nike - Vapo 15 Pro</a>
                                    </div>
                                    <div class="product_name"><a href="">Vapo 15 Pro Vàng</a></div>
                                    <div class="product_rating"><i class="fas fa-star"></i><i class="fas fa-star"></i><i
                                            class="fas fa-star"></i><i class="fas fa-star"></i><i
                                            class="fas fa-star"></i></div>
                                    <div class="product_price">520.000 VNĐ</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="popular_product_product_line">
                                <div class="astra-shop-thumbnail-wrap">
                                    <a href=""><img src="resources/static/images/product/product2.jpg"
                                            alt="Image 1"></a>
                                </div>
                                <div class="astra-shop-summary-wrap">
                                    <div class="product_category"><a href="" class="product_link">Nike - Vapo 15 Pro</a>
                                    </div>
                                    <div class="product_name"><a href="">Vapo 15 Pro Vàng</a></div>
                                    <div class="product_rating"><i class="fas fa-star"></i><i class="fas fa-star"></i><i
                                            class="fas fa-star"></i><i class="fas fa-star"></i><i
                                            class="fas fa-star"></i></div>
                                    <div class="product_price">520.000 VNĐ</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="popular_product_product_line">
                                <div class="astra-shop-thumbnail-wrap">
                                    <a href=""><img src="resources/static/images/product/product2.jpg"
                                            alt="Image 1"></a>
                                </div>
                                <div class="astra-shop-summary-wrap">
                                    <div class="product_category"><a href="" class="product_link">Nike - Vapo 15 Pro</a>
                                    </div>
                                    <div class="product_name"><a href="">Vapo 15 Pro Vàng</a></div>
                                    <div class="product_rating"><i class="fas fa-star"></i><i class="fas fa-star"></i><i
                                            class="fas fa-star"></i><i class="fas fa-star"></i><i
                                            class="fas fa-star"></i></div>
                                    <div class="product_price">520.000 VNĐ</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="popular_product_product_line">
                                <div class="astra-shop-thumbnail-wrap">
                                    <a href=""><img src="resources/static/images/product/product2.jpg"
                                            alt="Image 4"></a>
                                </div>
                                <div class="astra-shop-summary-wrap">
                                    <div class="product_category"><a href="" class="product_link">Nike - Vapo 15 Pro</a>
                                    </div>
                                    <div class="product_name"><a href="">Vapo 15 Pro Vàng</a></div>
                                    <div class="product_rating"><i class="fas fa-star"></i><i class="fas fa-star"></i><i
                                            class="fas fa-star"></i><i class="fas fa-star"></i><i
                                            class="fas fa-star"></i></div>
                                    <div class="product_price">520.000 VNĐ</div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="popular_product1">
                <div class="container-xl">
                    <h2><b>SẢN PHẨM</b></h2>
                    <!-- Wrapper for carousel items -->
                    <div class="item">
                        <div class="row">
                            <div id="product_${item.id}" class="col-sm-3" th:each="item : ${productList}">
                                <form th:action="'addToCart/' + ${item.id}" method="POST">
                                    <div class="thumb-wrapper">
                                        <span class="wish-icon"><i class="fa fa-heart-o"></i></span>
                                        <div class="img-box">
                                            <a th:href="'product/productId=' + ${item.id}">
                                                <img src="resources/static/images/product/product2.jpg" alt="Image 1">
                                            </a>
                                        </div>
                                        <div class="thumb-content">
                                            <h4><a th:href="'product/productId=' + ${item.id}"
                                                    th:text="${item.product_name}"></a></h4>
                                            <div class="choose_color">
                                                <label for="" class="size_label">Màu:</label>
                                                <div th:each="color : ${item.productColorEntities}">
                                                    <button class="color_btn" th:id="'colorInput_' + ${color.color_name}"
                                                        th:text="${color.color_name}"
                                                        th:attr="data-product-id=${item.id}, data-color=${color.color_name}, onclick='setColor(this, event)'"></button>
                                                </div>
                                            </div>
                                            <div class="choose_size">
                                                <label for="" class="size_label">Size:</label>
                                                <div th:each="sizeShoe : ${sizeList}">
                                                    <button type="button" class="size_btn" th:id="'sizeInput_' + ${sizeShoe}"
                                                        th:text="${sizeShoe}"
                                                        th:attr="data-product-id=${item.id}, data-size=${sizeShoe}, onclick='setSize(this, event)'"></button>
                                                </div>
                                            </div>
                                            <input type="hidden" th:id="'colorInput_' + ${item.id}" name="color" value="">
                                            <input type="hidden" th:id="'sizeInput_' + ${item.id}" name="size" value="">
                                            <div class="thumb-content_footer">
                                                <p class="item-price" th:text="${item.price}+VNĐ"><b></b></p>
                                                <button class="btn btn-primary" onclick="updateOrderDetails()">Mua
                                                    ngay</button>
                                            </div>
                                        </div>
                                    </div>
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
                            <a th:href="'?page=' + (${currentPage -1})">&laquo;</a>
                        </th:block>
                        <th:block th:each="i : ${#numbers.sequence(0, totalPages-1)}">
                            <a th:href="'?page='+${i}" th:class="${currentPage == i ? 'active-page' : ''}">
                                <p th:text="${i+1}"></p>
                            </a>
                        </th:block>
                        <th:block th:if="${currentPage < totalPages - 1}">
                            <a th:href="'?page=' + (${currentPage + 1})">&raquo;</a>
                        </th:block>
                    </th:block>
                </div>
            </div>

        </main>
        <footer>
            <div class="footer_container">
                <div class="footer-contents">
                    <div class="footer-content" style="text-align: center;">
                        <img src="resources/static/images/logo_KL-06.png" alt="Image 1">
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
    $(document).ready(function () {
        $(".wish-icon i").click(function () {
            $(this).toggleClass("fa-heart fa-heart-o");
        });
    });
</script>

<script>
    function setColor(button, event) {
            event.preventDefault();
            var productId = button.getAttribute('data-product-id');
            var color = button.getAttribute('data-color');

            var colorInput = document.getElementById("colorInput_" + productId);
            if (colorInput) {
                colorInput.value = color;
            }

            var colorButtons = document.getElementsByClassName("color_btn");
            for (var i = 0; i < colorButtons.length; i++) {
                colorButtons[i].classList.remove("selected");
            }
            button.classList.add("selected");
        }

   function setSize(button, event) {
           event.preventDefault();
           var productId = button.dataset.productId;
           var size = button.dataset.size;
           var sizeInput = document.getElementById("sizeInput_" + productId);
           if (sizeInput) {
               sizeInput.value = size;
           }
           var sizeButtons = document.getElementsByClassName("size_btn");
           Array.from(sizeButtons).forEach(function(btn) {
               btn.classList.remove("selected");
           });
           button.classList.add("selected");
       }

    function updateOrderDetails() {
        var selectedColorBtn = document.querySelector(".color_btn.selected");
              var color = selectedColorBtn ? selectedColorBtn.getAttribute("data-color") : "";
              var productId = selectedColorBtn ? selectedColorBtn.getAttribute("data-product-id") : "";
              var colorInput = document.getElementById("colorInput_" + productId);
              if (colorInput) {
                colorInput.value = color;
              }
        var selectedSizeBtn = document.querySelector(".size_btn.selected");
                var size = selectedSizeBtn ? selectedSizeBtn.dataset.size : "";
                var productId = selectedSizeBtn ? selectedSizeBtn.dataset.productId : "";
                var sizeInput = document.getElementById("sizeInput_" + productId);
                if (sizeInput) {
                    sizeInput.value = size;
                }

        var form = document.querySelector("form");
        if (form) {
            form.submit();
        }
    }
</script>
<script src="resources/static/js/slide.js"></script>

</html>