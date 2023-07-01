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
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <!-- CSS -->
    <link rel="icon" type="image/svg" href="resources/static/image/favicon_KL.svg">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href='../resources/static/css/account_page.css' rel='stylesheet'>
    <!--FAVICON -->
    <link href='../resources/static/images/favicon_KL.svg' rel='shortcut icon'>
    <meta name="robots" content="noindex,follow" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>KingLeo Football</title>
</head>
<body>
<div class="header_top">
    <div class="header-left">
      <a href="/" class="logo"><img src="../resources/static/images/logo_KL-06.png" alt=""></a>
    </div>
    <div class="header-right">
      <a class="active" href="#home">Thông tin</a>
      <a href="/order">Đơn hàng</a>
      <a href="/cart">Giỏ hàng</a>
    </div>
  </div>
  <div class="main-content">
    <!-- Top navbar -->
    <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
      <div class="container-fluid">
        <!-- Brand -->
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="https://www.creative-tim.com/product/argon-dashboard" target="_blank">Quản lý Tài khoản</a>
        <!-- Form -->
        <form class="navbar-search navbar-search-dark form-inline mr-3 d-none d-md-flex ml-lg-auto">
          <div class="form-group mb-0">
          </div>
        </form>
        <!-- User -->
        <ul class="navbar-nav align-items-center d-none d-md-flex">
          <li class="nav-item dropdown">
            <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <div class="media align-items-center">
                <span class="avatar avatar-sm rounded-circle" th:if="${account.getPhoto() == null}">
                  <img alt="Image placeholder" src="../resources/static/images/no-avatar.png">
                </span>
                <span class="avatar avatar-sm rounded-circle" th:if="${account.getPhoto() != null}">
                  <img alt="Image placeholder" th:src="'./getImagePhoto/'+${account.id}">
                </span>
                <div class="media-body ml-2 d-none d-lg-block">
                  <span class="mb-0 text-sm  font-weight-bold" th:text="${account.username}"></span>
                </div>
              </div>
            </a>
            <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
              <div class=" dropdown-header noti-title">
                <h6 class="text-overflow m-0">Xin Chào!</h6>
              </div>
              <a href="../examples/profile.html" class="dropdown-item">
                <i class="ni ni-single-02"></i>
                <span>My profile</span>
              </a>
              <a href="../examples/profile.html" class="dropdown-item">
                <i class="ni ni-settings-gear-65"></i>
                <span>Settings</span>
              </a>
              <a href="../examples/profile.html" class="dropdown-item">
                <i class="ni ni-calendar-grid-58"></i>
                <span>Activity</span>
              </a>
              <a href="../examples/profile.html" class="dropdown-item">
                <i class="ni ni-support-16"></i>
                <span>Support</span>
              </a>
              <div class="dropdown-divider"></div>
              <a href="#!" class="dropdown-item">
                <i class="ni ni-user-run"></i>
                <span>Logout</span>
              </a>
            </div>
          </li>
        </ul>
      </div>
    </nav>
    <!-- Header -->
    <div class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center" style="min-height: 400px; background-image: url(https://scontent.fsgn2-3.fna.fbcdn.net/v/t39.30808-6/332946562_872379353822222_4469527019744830126_n.png?_nc_cat=107&cb=99be929b-3346023f&ccb=1-7&_nc_sid=e3f864&_nc_ohc=OVndbs0fYOkAX_QKiuA&_nc_ht=scontent.fsgn2-3.fna&oh=00_AfCl1arOBdZWg4EvAGA5F8K21XNxfMlsKg2a4MHtZ9aXtA&oe=649F3586); background-size: cover; background-position: center top;">
      <!-- Mask -->
      <span class="mask bg-gradient-default opacity-8"></span>
      <!-- Header container -->
      <div class="container-fluid d-flex align-items-center">
        <div class="row">
          <div class="col-lg-7 col-md-10">
            <h1 class="display-2 text-white">Xin Chào <span th:text="${account.username}"></span>!</h1>
            <p class="text-white mt-0 mb-5">Đây là trang hồ sơ cá nhân tài khoản của bạn. Hãy cập nhật đầy đủ các thông tin cần thiết nhé!</p>
            <button href="#!" class="btn btn-info" onclick="scrollToPosition()">Chỉnh sửa thông tin</button>
          </div>
        </div>
      </div>
    </div>
    <!-- Page content -->
    <div class="container-fluid mt--7">
      <div class="row">
        <div class="col-xl-4 order-xl-2 mb-5 mb-xl-0">
          <div class="card card-profile shadow">
            <div class="row justify-content-center">
              <div class="col-lg-3 order-lg-2">

                    <div class="card-profile-image" th:if="${account.getPhoto() == null}">
                    <img id="avatarImg" src="../resources/static/images/no-avatar.png" class="rounded-circle" />
                  <div id="avatarOverlay" class="avatar-overlay">
                    <span id="changeAvatarText">Thay đổi avatar</span>
                  </div>
                  <input id="avatarInput" type="file" style="display: none;" accept="image/png, image/jpeg">
                </div>
                <div class="card-profile-image" th:if="${account.getPhoto() != null}">
                  <img id="avatarImg"  th:src="'./getImagePhoto/'+${account.id}" class="rounded-circle">
                  <div id="avatarOverlay" class="avatar-overlay">
                    <span id="changeAvatarText">Thay đổi avatar</span>
                  </div>
                  <input id="avatarInput" type="file" style="display: none;" accept="image/png, image/jpeg">
                </div>


              </div>
            </div>
            <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
              <div class="d-flex justify-content-between">
                <a href="#" class="btn btn-sm btn-info mr-4">Kết nối</a>
                <a href="#" class="btn btn-sm btn-default float-right">Nhắn tin</a>
              </div>
            </div>
            <div class="card-body pt-0 pt-md-4">
              <div class="row">
                <div class="col">
                  <div class="card-profile-stats d-flex justify-content-center mt-md-5">
                    <div>
                      <span class="heading">22</span>
                      <span class="description">Bạn bè</span>
                    </div>
                    <div th:if="${account.count_of_order == null}">
                      <span class="heading" th:text="0"></span>
                      <span class="description">SP đã mua</span>
                    </div>
                    <div th:if="${account.count_of_order != null}">
                      <span class="heading" th:text="${account.count_of_order}"></span>
                      <span class="description">SP đã mua</span>
                    </div>
                    <div th:if="${account.count_of_rate == null}">
                      <span class="heading">0</span>
                      <span class="description">Đánh giá</span>
                    </div>
                    <div th:if="${account.count_of_rate != null}">
                      <span class="heading" th:text="${account.count_of_rate}"></span>
                      <span class="description">Đánh giá</span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="text-center">
                <h3>
                  <span th:text="${account.first_name}"></span><span class="font-weight-light"></span>
                </h3>
                <div class="h5 font-weight-300">
                  <i class="ni location_pin mr-2"></i><span th:text="${account.address}"></span>
                </div>
                <hr class="my-4">
                <p th:text="${account.description}"></p>
                <a href="#">Show more</a>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-8 order-xl-1">
          <div class="card bg-secondary shadow">
            <div class="card-header bg-white border-0">
              <div class="row align-items-center">
                <div class="col-8">
                  <h3 class="mb-0">My account</h3>
                </div>
              </div>
            </div>
            <div class="card-body">
              <form action="update" method="POST" modelAttribute="account">
              <input th:value="${account.id}" name="id" type="hidden">
                <h6 class="heading-small text-muted mb-4">Thông tin người dùng</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-username">Tài khoản</label>
                        <input type="text" id="input-username" class="form-control form-control-alternative" placeholder="Username" th:value="${account.username}" name="username" readonly="True">
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">Email</label>
                        <input type="email" id="input-email" class="form-control form-control-alternative" th:value="${account.email}" name="email">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-first-name">Tên</label>
                        <input type="text" id="input-first-name" class="form-control form-control-alternative" placeholder="First name" th:value="${account.first_name}" name="first_name">
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-first-name">Số điện thoại</label>
                        <input type="text" id="input-first-name" class="form-control form-control-alternative" placeholder="Số điện thoại" name="phone" th:value="${account.phone}">
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="my-4">
                <!-- Address -->
                <h6 class="heading-small text-muted mb-4">Contact information</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-address">Địa chỉ</label>
                        <input type="text" id="input-first-name" class="form-control form-control-alternative" placeholder="Địa chỉ" name="address" th:value="${account.address}">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-4">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-city">Huyện/ Quận</label>
                        <input type="text" id="input-city" class="form-control form-control-alternative" placeholder="Huyện/ Quận" th:value="${account.district}" name="district">
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-country">Tỉnh/ Thành phố</label>
                        <input type="text" id="input-country" name="province" th:value="${account.province}" class="form-control form-control-alternative" placeholder="Tỉnh/ Thành phố" >
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="my-4">
                <!-- Description -->
                <h6 class="heading-small text-muted mb-4">About me</h6>
                <div class="pl-lg-4">
                  <div class="form-group focused">
                    <label>Mô tả</label>
                    <textarea rows="description" class="form-control form-control-alternative" placeholder="A few words about you ..." th:value="${account.description}" name="description"></textarea>
                  </div>
                </div>
                <div class="pl-lg-4">
                  <div class="form-group focused">
                    <button class="btn btn-primary" type="submit" style="background: #007bff;">Lưu</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <footer class="footer">
    <div class="row align-items-center justify-content-xl-between">
      <div class="col-xl-6 m-auto text-center">
        <div class="copyright">
          <p>Made by <a href="https://www.creative-tim.com/product/argon-dashboard" target="_blank">Tamler98</a> and <a href="https://www.creative-tim.com/product/argon-dashboard" target="_blank">Nganchaoxin</a></p>
        </div>
      </div>
    </div>
  </footer>
</body>
<script>
        // JavaScript code goes here
        function scrollToPosition() {
            var element = document.querySelector('.col-xl-8.order-xl-1');
            element.scrollIntoView({ behavior: "smooth" });
        }
    </script>

    <script>
      // Lấy các phần tử cần thiết
      const avatarImg = document.getElementById('avatarImg');
      const avatarOverlay = document.getElementById('avatarOverlay');
      const changeAvatarText = document.getElementById('changeAvatarText');
      const avatarInput = document.getElementById('avatarInput');

      // Hiển thị chữ "Thay đổi avatar" khi rê chuột vào ảnh
      avatarImg.addEventListener('mouseover', function() {
        avatarOverlay.style.display = 'block';
      });

      // Ẩn chữ "Thay đổi avatar" khi rời chuột ra khỏi ảnh
      avatarImg.addEventListener('mouseout', function() {
        avatarOverlay.style.display = 'none';
      });

      // Mở hộp thoại chọn ảnh khi người dùng nhấp chuột vào ảnh
      avatarImg.addEventListener('click', function() {
        avatarInput.click();
      });

      // Xử lý sự kiện khi người dùng chọn ảnh từ máy tính
      avatarInput.addEventListener('change', function(e) {
        const file = e.target.files[0];
        if (file) {
          // Thực hiện gửi ảnh đến controller (nếu cần)
          const formData = new FormData();
          formData.append('photo', file);

          fetch('updateAvatar', {
            method: 'POST',
            body: formData
          })
            .then(response => {
              // Xử lý phản hồi từ server (nếu cần)
              return response.json();
            })
            .then(data => {
              // Xử lý dữ liệu trả về từ server (nếu cần)
              console.log(data);

              // Reload trang sau khi hoàn thành
              window.location.reload();
            })
            .catch(error => {
              // Xử lý lỗi (nếu có)
              console.error(error);
            });
        }
      });
    </script>


</html>