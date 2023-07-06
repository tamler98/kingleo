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
    <link href='../resources/static/css/rating.css' rel='stylesheet'>
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
              <img th:src="'../getImagePhotoByColor/'+${product.id}+'_'+${product.productColorEntities[0].color_name}" alt="Default Image" class="brand_logo active"
                                th:data-image="${product.productColorEntities[0].color_name}">
          </a>
      </div>
      <div th:unless="${not #lists.isEmpty(product.productColorEntities)}">
          <img th:src="@{/resources/static/images/default.png}" alt="Default Image" class="brand_logo active"
               th:data-image="default">
      </div>
      <div th:each="color, loop : ${product.productColorEntities}" th:if="${loop.index > 0}">
          <a href="">
               <img th:src="'../getImagePhotoByColor/'+${product.id}+'_'+${color.color_name}" alt="Default Image" class="brand_logo"
                  th:data-image="${color.color_name}"s>
          </a>
      </div>

      </div>


      <!-- Right Column -->
      <div class="right-column">

        <!-- Product Description -->
        <form th:action="'/addToCart/' + ${product.id}" method="POST">
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
                <div th:each="color, loop : ${product.productColorEntities}">
                  <div>
                    <input class="input_color"
                           th:data-image="${color.color_name}"
                           type="radio"
                           th:id="${color.color_name}"
                           th:attr="data-product-id=${product.id}, data-color=${color.color_name}, onclick='setColor(event, ${color.color_name})'"
                           th:classappend="${loop.index == 0} ? 'active'">
                    <label th:for="${color.color_name}"><span></span></label>
                  </div>
                </div>
              </div>

            </div>
            <!-- Cable Configuration -->
            <div class="cable-config">
                <span>size</span>
                <div class="cable-choose">
                  <button type="button" class="input_size"
                    th:id="'sizeInput_' + ${product.id}"
                    th:text="38"
                    th:attr="data-product-id=${product.id}, data-size='38', onclick='setSize(this, event)'">
                  </button>
                  <button type="button" class="input_size"
                    th:id="'sizeInput_' + ${product.id}"
                    th:text="39"
                    th:attr="data-product-id=${product.id}, data-size='39', onclick='setSize(this, event)'">
                  </button>
                  <button type="button" class="input_size"
                    th:id="'sizeInput_' + ${product.id}"
                    th:text="40"
                    th:attr="data-product-id=${product.id}, data-size='40', onclick='setSize(this, event)'">
                  </button>
                  <button type="button" class="input_size"
                    th:id="'sizeInput_' + ${product.id}"
                    th:text="41"
                    th:attr="data-product-id=${product.id}, data-size='41', onclick='setSize(this, event)'">
                  </button>
                  <button type="button" class="input_size"
                    th:id="'sizeInput_' + ${product.id}"
                    th:text="42"
                    th:attr="data-product-id=${product.id}, data-size='42', onclick='setSize(this, event)'">
                  </button>
                  <button type="button" class="input_size"
                    th:id="'sizeInput_' + ${product.id}"
                    th:text="43"
                    th:attr="data-product-id=${product.id}, data-size='43', onclick='setSize(this, event)'">
                  </button>

                  <button type="button" class="input_size"
                    th:id="'sizeInput_' + ${product.id}"
                    th:text="44"
                    th:attr="data-product-id=${product.id}, data-size='44', onclick='setSize(this, event)'">
                  </button>
                </div>

                <a href="#">How to configurate your headphones</a>
            </div>
          </div>
          <div class="product-price">
            <span th:text="${#numbers.formatDecimal(product.price/1000, 0, 'COMMA', 3, 'POINT')} + ' VNĐ'"></span>
            <input type="hidden" id="colorInput" name="color" value="">
            <input type="hidden" id="sizeInput" name="size" value="">
            <button onclick="updateOrderDetails()" class="cart-btn" style="text-decoration: none; border: none; color: white;">Thêm vào giỏ hàng</button>
          </div>
        </form>

        </div>
      </div>
    </main>





    <div class="comment_card">
    <h4>Đánh giá sản phẩm:</h4>
        <div class="row">
          <div class="col-md-12">
            <div class="card_content" th:each="rating : ${ratingList}">
              <div class="comment-widgets" style="width: 100%;">
                <div class="rating_area">
                  <div class="col_avatar" style="max-width:80px;"><span class="round"><img th:src="'/account/getImagePhoto/'+${rating.accountEntity.id}" alt="user"
                        width="50"></span></div>
                  <div class="col_rating">
                    <div class="comment-text w-100">
                      <h5 style="text-align: left;" th:text="${rating.accountEntity.first_name}"></h5>
                      <p style="width: 100%;" class="content" th:text="${rating.content}"></p>
                      <div class="comment-footer">
                      <span class="date">Ngày: </span>
                        <span class="date" th:text="' '+${#dates.format(rating.date_comment, 'dd-MM-yyyy')}"></span>
                        <span id="ratingSpan" class="label label-info" th:text="${rating.rating}" th:class="'rating-' + ${rating.rating}"></span>
                        <form th:action="'/rating/like_rating_id=' + ${rating.id}" method="POST">
                        <span style="text-decoration: none; color: red; margin-left: 4px; font-weight: 500;" th:text="${rating.count_like}" ></span>
                          <button type="submit" data-abc="true" style="color:red; background: none; border: none; padding: 0; font-size:14px;"><i class="fa fa-heart"></i> thích</button>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <form th:action="'/rating/productId='+${product.id}" method="POST">
            <div class="card_content">
              <div class="comment-widgets" style="width: 100%;">
                <div class="rating_area">
                  <div class="col_avatar" th:if="${session.account == null}">
                  <span class="round"> <img src="../resources/static/images/no-avatar.png" alt="user" width="50"></span>
                  </div>
                  <div class="col_avatar" th:if="${session.account != null}">
                  <span class="round"> <img th:src="'/account/getImagePhoto/'+${session.account.id}" alt="user" width="50"></span>
                  </div>
                  <div class="col_rating">
                    <div class="comment-text w-100">
                      <h5 style="text-align: left;">Đánh giá của bạn</h5>
                      <div id="rating">
                          <input type="radio" id="star5" name="rating" value="5" />
                          <label for="star5"><i class="fas fa-star"></i></label>

                          <input type="radio" id="star4" name="rating" value="4" />
                          <label class = "full" for="star4"><i class="fas fa-star"></i></label>

                          <input type="radio" id="star3" name="rating" value="3" />
                          <label class = "full" for="star3"><i class="fas fa-star"></i></label>

                          <input type="radio" id="star2" name="rating" value="2" />
                          <label class = "full" for="star2"><i class="fas fa-star"></i></label>

                          <input type="radio" id="star1" name="rating" value="1" />
                          <label class = "full" for="star1"><i class="fas fa-star"></i></label>
                      </div>
                      <div class="comment-area">
                        <textarea class="form-control" name="content" placeholder="Bạn thấy sản phẩm thế nào?" rows="4"></textarea>
                      </div>
                      <div class="comment-btns mt-2">
                        <div class="col-lg">
                          <div class="col-12" style="text-align:left;">
                            <div class="pull-left">
                              <button type="submit" class="btn btn-success btn-sm">Đánh giá</button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          </form>
        </div>
      </div>

</body>
    <script>
      function setColor(event, color) {
        event.preventDefault();
        var colorInput = document.getElementById(color);
        if (colorInput) {
          colorInput.value = color;
        }
      }
      function setSize(button, event) {
              event.preventDefault();

              var productId = button.getAttribute('data-product-id');
              var size = button.getAttribute('data-size');

              var sizeInput = document.getElementById("sizeInput_" + productId);
              if (sizeInput) {
                  sizeInput.value = size;
              }
              var sizeButtons = document.getElementsByClassName("input_size");
              for (var i = 0; i < sizeButtons.length; i++) {
                  sizeButtons[i].classList.remove("active");
              }
              button.classList.add("active");
          }

      function updateOrderDetails() {
        var selectedColorBtn = document.querySelector(".input_color.active");
        var color = selectedColorBtn ? selectedColorBtn.getAttribute("data-color") : "";
        var size = document.querySelector(".input_size.active").getAttribute("data-size");
        console.log("Selected color:", color); // Thêm dòng này để kiểm tra giá trị của color

        document.getElementById("colorInput").value = color;
        document.getElementById("sizeInput").value = size;
        var form = document.querySelector("form");
        if (form) {
          form.submit();
        }
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

<script>
  var ratingElements = document.querySelectorAll("#ratingSpan");

  ratingElements.forEach(function(ratingElement) {
    var ratingValue = parseInt(ratingElement.textContent);
    var ratingText = "";

    switch (ratingValue) {
      case 1:
        ratingText = "Rất tệ";
        break;
      case 2:
        ratingText = "Tệ";
        break;
      case 3:
        ratingText = "Ổn";
        break;
      case 4:
        ratingText = "Tốt";
        break;
      case 5:
        ratingText = "Tuyệt vời";
        break;
      default:
        ratingText = "Không đánh giá!";
    }

    ratingElement.textContent = ratingText;
  });
</script>

<script>
function calcRate(r) {
 const f = ~~r,//Tương tự Math.floor(r)
 id = 'star' + f + (r % f ? 'half' : '')
 id && (document.getElementById(id).checked = !0)
}
</script>

</html>
