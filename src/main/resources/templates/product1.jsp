	<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
	xmlns:sec="https://www.thymeleaf.org/thymeleaf-extras-springsecurity5">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title th:text="${product.product_name}"></title>
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
  </head>

  <body>
  <header th:include="header :: header"></header>
    <main class="container">

      <!-- Left Column / Headphones Image -->
      <div class="left-column">
      <div th:if="${not #lists.isEmpty(product.productColorEntities)}">
          <a href="">
              <img th:src="@{/resources/static/images/{colorName}.png(colorName=${product.productColorEntities[0].color_name})}"
                   alt="" class="brand_logo active" th:data-image="${product.productColorEntities[0].color_name}">
          </a>
      </div>
      <div th:unless="${not #lists.isEmpty(product.productColorEntities)}">
          <img th:src="@{/resources/static/images/default.png}" alt="Default Image" class="brand_logo active"
               th:data-image="default">
      </div>
      <div th:each="color, loop : ${product.productColorEntities}" th:if="${loop.index > 0}">
          <a href="">
              <img th:src="@{/resources/static/images/{colorName}.png(colorName=${color.color_name})}"
                   alt="" class="brand_logo" th:data-image="${color.color_name}">
          </a>
      </div>

      </div>


      <!-- Right Column -->
      <div class="right-column">

        <!-- Product Description -->
        <form th:action="'addToCart/' + ${product.id}" method="POST">
        <div class="product-description">
          <span>KingLeo Football</span>
          <h1 th:text="${product.product_name}"></h1>
          <p>The preferred choice of a vast range of acclaimed DJs. Punchy, bass-focused sound and high isolation. Sturdy headband and on-ear cushions suitable for live performance</p>
        </div>

        <!-- Product Configuration -->
        <div class="product-configuration">

          <!-- Product Color -->
          <div class="product-color">
            <span>Màu</span>

            <div class="color-choose">
              <div th:each="color : ${product.productColorEntities}">
                  <div>
                      <input
                        th:data-image="${color.color_name}" type="radio"
                        th:id="${color.color_name}"
                        th:onclick="setColor(${product.id}, event, '${color.color_name}')"
                        th:checked="${color == product.productColorEntities[0]}">
                      <label th:for="${color.color_name}"><span></span></label>
                  </div>
              </div>

            </div>

          </div>

          <!-- Cable Configuration -->
          <div class="cable-config">
            <span>size</span>

            <div class="cable-choose">
              <button type="button" th:attr="onclick='setSize(${product.id}, event, '38')'">38</button>
              <button type="button" class="size_btn" th:id="'sizeInput_' + ${item.id}"
                                                  th:text="38"
                                                  th:attr="data-product-id=${item.id}, data-size='38', onclick='setSize(this, event, '38')'">
              </button>
              <button type="button" onclick="setSize(${product.id}, event, '39')">39</button>
              <button type="button" onclick="setSize(${product.id}, event, '40')">40</button>
              <button type="button" onclick="setSize(${product.id}, event, '41')">41</button>
              <button type="button" onclick="setSize(${product.id}, event, '42')">42</button>
              <button type="button" onclick="setSize(${product.id}, event, '43')">43</button>
            </div>

            <a href="#">How to configurate your headphones</a>
          </div>
        </div>

        <!-- Product Pricing -->
        <div class="product-price">
          <span>148$</span>
          <input type="hidden" id="colorInput_${product.id}" name="color" value="">
           <input type="hidden" id="sizeInput_${product.id}" name="size" value="">
          <button type="submit" onclick="updateOrderDetails()" class="cart-btn" style="text-decoration: none; border: none; color: white;">Thêm vào giỏ hàng</button>

          </form>
        </div>
      </div>
    </main>>

    <!-- Scripts -->
    <script>
      function setColor(productId, event, color) {
        event.preventDefault();
        // Cập nhật giá trị màu trong trường ẩn của sản phẩm có productId
        var colorInput = document.getElementById("colorInput_" + productId);
        colorInput.value = color;
      }

      function setSize(productId, event, size) {
        event.preventDefault();
        // Cập nhật giá trị kích thước trong trường ẩn của sản phẩm có productId
        var sizeInput = document.getElementById("sizeInput_" + productId);
        sizeInput.value = size;
      }
      function updateOrderDetails() {
        // Thực hiện bất kỳ xử lý bổ sung trước khi gửi biểu mẫu (nếu cần)
        // Gửi biểu mẫu
        document.querySelector("form").submit();
      }
     </script>
       <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
      $('.color-choose input').on('click', function() {
          var headphonesColor = $(this).attr('data-image');

          $('.active').removeClass('active');
          $('.left-column img[data-image = ' + headphonesColor + ']').addClass('active');
          $(this).addClass('active');
      });

    });
    </script>

  </body>
</html>
