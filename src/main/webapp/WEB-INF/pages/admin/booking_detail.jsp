<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Azure Hotel - Profile Management</title>
    <meta name="description" content="asdas" />

    <!-- Favicon -->
    <link
      rel="icon"
      type="image/x-icon"
      href='<c:url value="/resources/static/assets/img/favicon/favicon.ico" />'
    />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href='<c:url value="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" />'
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link
      href='<c:url value="/resources/static/assets/vendor/fonts/boxicons.css" />'
      rel="stylesheet"
    />

    <!-- Core CSS -->
    <link
      href='<c:url value="/resources/static/assets/vendor/css/core.css" />'
      class="template-customizer-core-css"
      rel="stylesheet"
    />
    <link
      href='<c:url value="/resources/static/assets/vendor/css/theme-default.css" />'
      class="template-customizer-theme-css"
      rel="stylesheet"
    />
    <link
      href='<c:url value="/resources/static/assets/assets/css/demo.css" />'
      rel="stylesheet"
    />

    <!-- Vendors CSS -->
    <link
      href='<c:url value="/resources/static/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />'
      rel="stylesheet"
    />

    <script src='<c:url value="/resources/static/assets/vendor/js/helpers.js" />'></script>
    <script src='<c:url value="/resources/static/assets/js/config.js" />'></script>
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

        <aside
          id="layout-menu"
          class="layout-menu menu-vertical menu bg-menu-theme"
        >
          <div class="app-brand demo">
            <a href="../" class="app-brand-link">
              <span class="app-brand-text demo menu-text fw-bolder ms-2"
                ><img
                  src='<c:url value="/resources/static/assets/img/Logo_logo.png" />'
                  alt=""
                  width="190px"
              /></span>
            </a>

            <a
              href="javascript:void(0);"
              class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none"
            >
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1">
            <li class="menu-item ">
              <a href="chart" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">Dashboard</div>
              </a>
            </li>
            <!-- Cards -->
            <li class="menu-item">
              <a href="room" class="menu-link">
                <i class="menu-icon tf-icons bx bx-collection"></i>
                <div data-i18n="Basic">Manage room</div>
              </a>
            </li>

            <!-- Cards -->
            <li class="menu-item">
              <a href="category" class="menu-link">
                <i class="menu-icon tf-icons bx bx-collection"></i>
                <div data-i18n="Basic">Manage category</div>
              </a>
            </li>

            <!-- Cards -->
            <li class="menu-item active">
              <a href="booking" class="menu-link">
                <i class="menu-icon tf-icons bx bx-collection"></i>
                <div data-i18n="Basic">Manage booking</div>
              </a>
            </li>

            <!-- Cards -->
            <li class="menu-item">
              <a href="image" class="menu-link">
                <i class="menu-icon tf-icons bx bx-collection"></i>
                <div data-i18n="Basic">Manage image</div>
              </a>
            </li>

            <!-- Cards -->
            <li class="menu-item ">
              <a href="account" class="menu-link">
                <i class="menu-icon tf-icons bx bx-collection"></i>
                <div data-i18n="Basic">Manage account</div>
              </a>
            </li>
          </ul>
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4">Azure's Booking Detail</h4>
              <a href="<c:url value="/admin/booking" />">
                <button type="button" class="btn btn-sm btn-outline-primary">
                   Back to booking
                </button>
              </a>

              <hr class="my-5" />

              <!-- Hoverable Table rows -->
              <c:if test="${not empty bookingDetailList}">
              <div class="card">
                <h5 class="card-header">Booking Detail</h5>
                <div class="table-responsive text-nowrap">

                  <table class="table table-hover">
                    <thead>
                      <tr>
                        <th>Room</th>
                        <th>Check In</th>
                        <th>Check Out</th>
                        <th>Adult</th>
                        <th>Children</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">

                        <c:forEach
                            var="bookingDetail"
                            items="${bookingDetailList}"
                            varStatus="index"
                          >
                            <tr>
                              <td>${bookingDetail.roomEntity.room_name}</td>
                              <td>
                                <fmt:formatDate
                                  value="${bookingDetail.booking_check_in}"
                                  pattern="dd-MM-yyyy"
                                />
                              </td>
                              <td>
                                <fmt:formatDate
                                  value="${bookingDetail.booking_check_out}"
                                  pattern="dd-MM-yyyy"
                                />
                              </td>

                              <td>${bookingDetail.number_of_adult}</td>
                              <td>${bookingDetail.number_of_children}</td>
                            </tr>
                          </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
              </c:if>
              <c:if test="${empty bookingDetailList}">
                  <h3>No booking detail </h3>
                </c:if>
              <!--/ Hoverable Table rows -->
            </div>

            <!-- Footer -->
            <footer class="content-footer footer bg-footer-theme">
              <div
                class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column"
              >
                <div class="mb-2 mb-md-0">
                  ©
                  <script>
                    document.write(new Date().getFullYear());
                  </script>
                  , made with ❤️ by <b>Thanh Tam</b> and <b>Ngan Pham</b>
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

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src='<c:url value="/resources/static/assets/vendor/libs/jquery/jquery.js" />'></script>
    <script src='<c:url value="/resources/static/assets/vendor/libs/popper/popper.js" />'></script>
    <script src='<c:url value="/resources/static/assets/vendor/js/bootstrap.js" />'></script>

    <script src='<c:url value="/resources/static/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js" />'></script>

    <script src='<c:url value="/resources/static/assets/vendor/js/menu.js" />'></script>

    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src='<c:url value="/resources/static/assets/js/main.js" />'></script>

    <!-- Page JS -->
    <script src='<c:url value="/resources/static/assets/js/pages-account-settings-account.js" />'></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script
      async
      defer
      src='<c:url value="https://buttons.github.io/buttons.js" />'
    ></script>
  </body>
</html>
