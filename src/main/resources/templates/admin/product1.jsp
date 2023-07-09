<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
	xmlns:sec="https://www.thymeleaf.org/thymeleaf-extras-springsecurity5">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Kingleo Football - Dashboard</title>
    <!-- FONT -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <!-- ICON -->
    <link rel="stylesheet" href="../resources/static/css/admin/fontawesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="../resources/static/css/admin/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link href='../resources/static/css/admin/templatemo-style.css' rel='stylesheet'>
    <!--FAVICON -->
    <link href='../resources/static/images/favicon_KL.svg' rel='shortcut icon'>
</head>

  <body>
    <nav class="navbar navbar-expand-xl">
      <div class="container h-100">
        <a class="navbar-brand" href="index.html">
          <h1 class="tm-site-title mb-0">Product Admin</h1>
        </a>
        <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse"
          data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
          aria-label="Toggle navigation">
          <i class="fas fa-bars tm-nav-icon"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mx-auto h-100">
            <li class="nav-item">
              <a class="nav-link" href="index.html">
                <i class="fas fa-tachometer-alt"></i> Dashboard
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <i class="far fa-file-alt"></i>
                <span> Reports <i class="fas fa-angle-down"></i> </span>
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Daily Report</a>
                <a class="dropdown-item" href="#">Weekly Report</a>
                <a class="dropdown-item" href="#">Yearly Report</a>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="products.html">
                <i class="fas fa-shopping-cart"></i> Products
              </a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="accounts.html">
                <i class="far fa-user"></i> Accounts
              </a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-cog"></i>
                <span> Settings <i class="fas fa-angle-down"></i> </span>
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Profile</a>
                <a class="dropdown-item" href="#">Billing</a>
                <a class="dropdown-item" href="#">Customize</a>
              </div>
            </li>
          </ul>
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link d-block" href="login.html">
                Admin, <b>Logout</b>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="container tm-mt-big tm-mb-big">
      <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
              <div class="col-12">
                <h2 class="tm-block-title d-inline-block">Add Product</h2>
              </div>
            </div>
            <div class="row tm-edit-product-row">
              <div class="col-xl-6 col-lg-6 col-md-12">
              <form class="tm-edit-product-form" action="newProduct" method="POST" modelAttribute="product" enctype="multipart/form-data">
                  <div class="form-group mb-3">
                    <label for="name">Product Name
                    </label>
                    <input id="product_name" th:value="${product.product_name}" name="product_name" placeholder="PRODUCT NAME" class="form-control validate" required="" type="text">
                  </div>
                  <div class="form-group mb-3">
                    <label for="description">Description</label>
                    <textarea class="form-control validate" rows="3" required></textarea>
                  </div>
                  <div class="form-group mb-3">
                    <label for="category">Category</label>
                    <select id="product_category" name="product_category" class="custom-select tm-select-accounts">
                      <option selected>Select category</option>
                      <option th:each="item : ${categoryList}" th:value="${item.key}" th:text="${item.value}"></option>
                    </select>
                  </div>
                  <div class="form-group mb-3">
                    <label for="category">Giá</label>
                    <input id="product_name_fr" th:value="${product.price}" name="price" placeholder="PRODUCT PRICE" class="form-control validate" required="" type="text">
                  </div>
                  <div class="row">
                    <div class="form-group mb-3 col-xs-12 col-sm-4">
                        <div class="form-group mb-3">
                          <label for="category">Màu sắc</label>
                          <select class="custom-select tm-select-accounts" id="category">
                          <select id="product_color" name="product_colors" class="custom-select tm-select-accounts">
                            <option selected>Màu</option>
                            <option value="Xanh">Xanh</option>
                            <option value="Đỏ">Đỏ</option>
                            <option value="Tím">Tím</option>
                            <option value="Vàng">Vàng</option>
                            <option value="Đen">Đen</option>
                            <option value="Xám">Xám</option>
                            <option value="Hồng">Hồng</option>
                          </select>
                        </div>
                    </div>
                    <div class="form-group mb-3 col-xs-12 col-sm-5">
                      <label for="stock">Ảnh
                      </label>
                      <input id="fileInput" name="photos" type="file" class="account-file-input upload" multiple accept="image/png, image/jpeg" style="display:none;"/>
                      <input type="button" class="btn btn-primary btn-block mx-auto" value="Chọn ảnh"/>
                    </div>
                    <div class="form-group mb-3 col-xs-12 col-sm-1">
                      <label for="stock">Thêm
                      </label>
                      <button style="height: 30px; border-radius: 50%; width: 30px; margin-top: 0.6em; background: #00baee;  border: 2px solid white; color: white;">
                      <i class="fas fa-plus"></i>
                      </button>
                    </div>
                  </div>
              </div>
              <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                <div class="tm-product-img-dummy mx-auto">
                  <i class="fas fa-cloud-upload-alt tm-upload-icon"
                    onclick="document.getElementById('fileInput').click();"></i>
                </div>
                <div class="custom-file mt-3 mb-3">
                  <input id="fileInput" type="file" style="display:none;" />
                  <input type="button" class="btn btn-primary btn-block mx-auto" value="UPLOAD PRODUCT IMAGE"
                    onclick="document.getElementById('fileInput').click();" />
                </div>
              </div>
              <div class="col-12">
                <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Product Now</button>
              </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <footer class="tm-footer row tm-mt-small">
      <div class="col-12 font-weight-light">
        <p class="text-center text-white mb-0 px-4 small">
          Copyright &copy; <b>2018</b> All rights reserved.

          Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
        </p>
      </div>
    </footer>

    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
    <!-- https://jqueryui.com/download/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script>
      $(function () {
        $("#expire_date").datepicker();
      });
    </script>
  </body>
</html>