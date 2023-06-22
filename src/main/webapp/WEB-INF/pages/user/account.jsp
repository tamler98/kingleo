<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <meta charset="utf-8" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
    <title>Azure Hotel - Profile Management</title>
    <meta name="description" content="asdas" />
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href='<c:url value="/resources/static/assets/img/favicon/favicon.ico" />' />
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
        href='<c:url value="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" />'
        rel="stylesheet" />
    <!-- Icons. Uncomment required icon fonts -->
    <link href='<c:url value="/resources/static/assets/vendor/fonts/boxicons.css" />' rel='stylesheet'>
    <!-- Core CSS -->
    <link href='<c:url value="/resources/static/assets/vendor/css/core.css" />' class="template-customizer-core-css"
        rel='stylesheet'>
    <link href='<c:url value="/resources/static/assets/vendor/css/theme-default.css" />'
        class="template-customizer-theme-css" rel='stylesheet'>
    <link href='<c:url value="/resources/static/assets/assets/css/demo.css" />' rel='stylesheet'>
    <!-- Vendors CSS -->
    <link href='<c:url value="/resources/static/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />'
        rel='stylesheet'>
    <script src='<c:url value="/resources/static/assets/vendor/js/helpers.js" />'></script>
    <script src='<c:url value="/resources/static/assets/js/config.js" />'></script>
</head>

<body>
    <c:if test="${success_msg != null && success_msg != ''}">
        <div id="notification-container">
            <div class="notification-box success">
                <p style="padding-top:15px;">${success_msg}</p>
            </div>
        </div>
    </c:if>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">
            <!-- Menu -->

            <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
                <div class="app-brand demo" style="padding-top:1em;">
                    <a href="../" class="app-brand-link">
                        <span class="app-brand-text demo menu-text fw-bolder ms-2"><img
                                src='<c:url value="/resources/static/assets/img/Logo_logo.png" />' alt=""
                                width="190px"></span>
                    </a>

                    <a href="javascript:void(0);"
                        class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                        <i class="bx bx-chevron-left bx-sm align-middle"></i>
                    </a>
                </div>

                <div class="menu-inner-shadow"></div>

                <ul class="menu-inner py-1">
                    <!-- Dashboard -->

                    <li class="menu-header small text-uppercase">
                        <span class="menu-header-text">Account Management</span>
                    </li>
                    <li class="menu-item active open">
                        <a href="javascript:void(0);" class="menu-link menu-toggle">
                            <i class="menu-icon tf-icons bx bx-dock-top"></i>
                            <div data-i18n="Account Settings">Account Settings</div>
                        </a>
                        <ul class="menu-sub">
                            <li class="menu-item active">
                                <a href="account" class="menu-link">
                                    <div data-i18n="Account">Account</div>
                                </a>
                            </li>
                            <li class="menu-item">
                                <a href="forgotpassword" class="menu-link">
                                    <div data-i18n="Notifications">Forgot password</div>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="menu-item">
                        <a href="javascript:void(0);" class="menu-link menu-toggle">
                            <i class="menu-icon tf-icons bx bx-lock-open-alt"></i>
                            <div data-i18n="Authentications">Payment Info</div>
                        </a>
                        <ul class="menu-sub">
                            <li class="menu-item">
                                <a href="cardpayment" class="menu-link">
                                    <div data-i18n="Basic">Your Card</div>
                                </a>
                            </li>
                            <li class="menu-item">
                                <a href="paymenthistory" class="menu-link">
                                    <div data-i18n="Basic">History Payment</div>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!-- Components -->
                    <li class="menu-header small text-uppercase"><span class="menu-header-text">Booking
                            Managerment</span></li>
                    <!-- Cards -->
                    <li class="menu-item">
                        <a href="booking" class="menu-link">
                            <i class="menu-icon tf-icons bx bx-collection"></i>
                            <div data-i18n="Basic">Booking</div>
                        </a>
                    </li>
                </ul>
            </aside>
            <!-- / Menu -->

            <!-- Layout container -->
            <div class="layout-page">
                <!-- Navbar -->

                <nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                    id="layout-navbar">
                    <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                        <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                            <i class="bx bx-menu bx-sm"></i>
                        </a>
                    </div>

                    <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                        <!-- Search -->
                        <div class="navbar-nav align-items-center">
                            <div class="nav-item d-flex align-items-center">
                                <i class="bx bx-search fs-4 lh-0"></i>
                                <input type="text" class="form-control border-0 shadow-none" placeholder="Search..."
                                    aria-label="Search..." />
                            </div>
                        </div>
                        <!-- /Search -->

                        <ul class="navbar-nav flex-row align-items-center ms-auto">
                            <!-- Place this tag where you want the button to render. -->
                            <li class="nav-item lh-1 me-3">
                                <a href="../bookingcart" data-size="large" data-show-count="true"
                                    aria-label="../bookingcart"><svg xmlns="http://www.w3.org/2000/svg" width="16"
                                        height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                                        <path
                                            d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                                    </svg></a>
                            </li>

                            <!-- User -->
                            <li class="nav-item navbar-dropdown dropdown-user dropdown">
                                <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);"
                                    data-bs-toggle="dropdown">
                                    <div class="avatar avatar-online">
                                        <c:if test="${not empty accountEntity.photo}">
                                            <img src="<c:out value='getImagePhoto/${accountEntity.id}'/>" alt
                                                class="w-px-40 h-px-40 rounded-circle" />
                                        </c:if>
                                        <c:if test="${empty accountEntity.photo}">
                                            <img src="https://t4.ftcdn.net/jpg/03/59/58/91/360_F_359589186_JDLl8dIWoBNf1iqEkHxhUeeOulx0wOC5.jpg"
                                                alt class="w-px-40 h-px-40 rounded-circle" />
                                        </c:if>
                                    </div>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end">
                                    <li>
                                        <a class="dropdown-item" href="#">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0 me-3">
                                                    <div class="avatar avatar-online">
                                                        <c:if test="${not empty accountEntity.photo}">
                                                            <img src="getImagePhoto/<c:out value='${accountEntity.id}'/>"
                                                                alt class="w-px-40 h-px-40 rounded-circle" />
                                                        </c:if>
                                                        <c:if test="${empty accountEntity.photo}">
                                                            <img src="https://t4.ftcdn.net/jpg/03/59/58/91/360_F_359589186_JDLl8dIWoBNf1iqEkHxhUeeOulx0wOC5.jpg"
                                                                alt class="w-px-40 h-px-40 rounded-circle" />
                                                        </c:if>
                                                    </div>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <span class="fw-semibold d-block">${accountEntity.username}</span>
                                                    <small class="text-muted">User</small>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <div class="dropdown-divider"></div>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="account">
                                            <i class="bx bx-user me-2"></i>
                                            <span class="align-middle">My Profile</span>
                                        </a>
                                    </li>
                                    <li>
                                        <div class="dropdown-divider"></div>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="<c:url value=" /logout" />">
                                        <i class="bx bx-power-off me-2"></i>
                                        <span class="align-middle">Log Out</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <!--/ User -->
                        </ul>
                    </div>
                </nav>

                <!-- / Navbar -->

                <!-- Content wrapper -->
                <div class="content-wrapper">
                    <!-- Content -->

                    <div class="container-xxl flex-grow-1 container-p-y">
                        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Account Settings /</span>
                            Account</h4>

                        <div class="row">
                            <div class="col-md-12">
                                <ul class="nav nav-pills flex-column flex-md-row mb-3">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="javascript:void(0);"><i
                                                class="bx bx-user me-1"></i> Account</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="forgotpassword"><i class="bx bx-bell me-1"></i>
                                            Forgot password</a>
                                    </li>
                                </ul>
                                <div class="card mb-4">
                                    <h5 class="card-header">Profile Details</h5>
                                    <!-- Account -->
                                    <form:form action="account" method="POST" enctype="multipart/form-data"
                                        modelAttribute="accountEntity">
                                        <div class="card-body">
                                            <div class="d-flex align-items-start align-items-sm-center gap-4">
                                                <c:if test="${not empty accountEntity.photo}">
                                                    <img src="getImagePhoto/<c:out value='${accountEntity.id}'/>"
                                                        alt="user-avatar" class="d-block rounded" height="100"
                                                        width="100" id="uploadedAvatar" />
                                                </c:if>
                                                <c:if test="${empty accountEntity.photo}">
                                                    <img src="https://t4.ftcdn.net/jpg/03/59/58/91/360_F_359589186_JDLl8dIWoBNf1iqEkHxhUeeOulx0wOC5.jpg"
                                                        alt="user-avatar" class="d-block rounded" height="100"
                                                        width="100" id="uploadedAvatar" />
                                                </c:if>
                                                <div class="button-wrapper">
                                                    <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
                                                        <span class="d-none d-sm-block">Upload new photo</span>
                                                        <i class="bx bx-upload d-block d-sm-none"></i>
                                                        <input name="photo" type="file" id="upload"
                                                            class="account-file-input" hidden
                                                            accept="image/png, image/jpeg" />
                                                    </label>
                                                    <button type="button"
                                                        class="btn btn-outline-secondary account-image-reset mb-4">
                                                        <i class="bx bx-reset d-block d-sm-none"></i>
                                                        <span class="d-none d-sm-block">Reset</span>
                                                    </button>

                                                    <p class="text-muted mb-0">Allowed JPG, GIF or PNG. Max size of 800K
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <hr class="my-0" />
                                        <div class="card-body">

                                            <div class="row">
                                                <div class="mb-3 col-md-6">
                                                    <label for="firstName" class="form-label">First Name</label>
                                                    <input class="form-control" type="text" id="firstName"
                                                        name="first_name" value="${accountEntity.first_name}"
                                                        placeholder="First name" />
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label for="lastName" class="form-label">Last Name</label>
                                                    <input name="last_name" value="${accountEntity.last_name}"
                                                        class="form-control" type="text" id="lastName"
                                                        placeholder="First name" />
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label for="email" class="form-label">E-mail</label>
                                                    <input class="form-control" type="text" id="email" name="email"
                                                        value="${accountEntity.email}" readonly
                                                        placeholder="john.doe@example.com" />
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label for="organization" class="form-label">Username</label>
                                                    <input type="text" class="form-control" id="username"
                                                        name="username" value="${accountEntity.username}" />
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label class="form-label" for="phoneNumber">Phone Number</label>
                                                    <div class="input-group input-group-merge">
                                                        <span class="input-group-text">VN (+84)</span>
                                                        <input type="text" id="phoneNumber" name="phone_number"
                                                            value="${accountEntity.phone_number}" class="form-control"
                                                            placeholder="384 203 345" />
                                                    </div>
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label for="address" class="form-label">Address</label>
                                                    <input type="text" class="form-control" id="address" name="address"
                                                        value="${accountEntity.address}"
                                                        placeholder="Lien Chieu, Da Nang" />
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label for="state" class="form-label">Gender</label>
                                                    <form:select path="gender" class="form-control" id="gender">
                                                        <form:option value="${accountEntity.gender}"
                                                            label="${accountEntity.gender}" />
                                                        <c:forEach items="${genderList}" var="gender">
                                                            <form:option value="${gender}" label="${gender}" />
                                                        </c:forEach>
                                                    </form:select>
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label for="zipCode" class="form-label">Birth Date</label>
                                                    <form:input type="Date" class="form-control" path="birth_date" />
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-primary me-2">Save</button>
                                    </form:form>
                                </div>
                                <!-- /Account -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- / Content -->

                <!-- Footer -->
                <footer class="content-footer footer bg-footer-theme">
                    <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                        <div class="mb-2 mb-md-0">
                            This website was developed by <b>Thanh Tam</b> and <b>Ngan Pham</b>
                        </div>
                    </div>
                </footer>
                <!-- / Footer -->

                <div class="content-backdrop fade"></div>
            </div>
            <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
    </div>

    <!-- Overlay -->
    <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

    <!-- <div class="buy-now">
    <a href="https://themeselection.com/products/sneat-bootstrap-html-admin-template/" target="_blank"
      class="btn btn-danger btn-buy-now">Upgrade to Pro</a>
  </div> -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src='<c:url value="/resources/static/assets/vendor/libs/jquery/jquery.js" />'></script>
    <script src='<c:url value="/resources/static/assets/vendor/libs/popper/popper.js" />'></script>
    <script src='<c:url value="/resources/static/assets/vendor/js/bootstrap.js" />'></script>
    <script
        src='<c:url value="/resources/static/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js" />'></script>
    <script src='<c:url value="/resources/static/assets/vendor/js/menu.js" />'></script>
    <!-- endbuild -->
    <!-- Vendors JS -->
    <!-- Main JS -->
    <script src='<c:url value="/resources/static/assets/js/main.js" />'></script>
    <!-- Page JS -->
    <script src='<c:url value="/resources/static/assets/js/pages-account-settings-account.js" />'></script>
    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src='<c:url value="https://buttons.github.io/buttons.js" />'></script>

    <script>
        // hide success message after 5 seconds
        setTimeout(function () {
            var successMsg = document.getElementById("notification-container");
            if (successMsg) {
                successMsg.parentNode.removeChild(successMsg);
            }
        }, 3000);
    </script>
</body>

</html>