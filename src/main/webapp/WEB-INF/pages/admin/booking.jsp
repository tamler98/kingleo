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
    <link href='<c:url value="/resources/static/css/delete.css" />' rel='stylesheet'>

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
            <li class="menu-item ">
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
                  <form action="/Azure-Hotel/admin/search" method="GET">
                      <div class="navbar-nav align-items-center">
                          <div class="nav-item d-flex align-items-center">
                              <i class="bx bx-search fs-4 lh-0"></i>
                              <input type="text"  id="query" name="query" placeholder="Search by email or date" value="${param.query}" class="form-control border-0 shadow-none"
                                  aria-label="Search..." />
                          </div>
                      </div>
                  <form>
                  <!-- /Search -->


              </div>
          </nav>

          <!-- / Navbar -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4">Azure's Booking</h4>

                <c:if test="${not empty sessionScope.findFail}">
                        <div class="alert alert-fail">${sessionScope.findFail}</div>
                        <% session.removeAttribute("findFail"); %>
                    </c:if>
                  <c:if test="${not empty sessionScope.nullBookingFound}">
                     <div class="alert alert-fail">${sessionScope.nullBookingFound}</div>
                     <% session.removeAttribute("nullBookingFound"); %>
                 </c:if>
                 <c:if test="${not empty sessionScope.findSuccess}">
                      <div class="alert alert-success">${sessionScope.findSuccess}</div>
                      <% session.removeAttribute("findSuccess"); %>
                  </c:if>

              <hr class="my-5" />

              <!-- Hoverable Table rows -->
              <c:if test="${not empty resultList}">
                <div class="card">
                <h5 class="card-header">Booking</h5>

                <c:if test="${not empty sessionScope.msg}">
                    <div class="alert alert-success">${sessionScope.msg}</div>
                    <% session.removeAttribute("msg"); %>
                </c:if>
                <div class="table-responsive text-nowrap">
                  <table class="table table-hover">
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>Account Name</th>
                        <th>Booking Date</th>
                        <th>Booking Status</th>
                        <th>Total Price</th>

                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                    <small style="color: red">
                      <c:out value="${message}" />
                    </small>
                      <c:forEach
                        var="result"
                        items="${resultList}"
                        varStatus="index"
                      >
                        <tr>
                          <td>
                            <i
                              class="fab fa-angular fa-lg text-danger me-3"
                            ></i>
                            <strong>${result.id}</strong>
                          </td>
                          <td>${result.accountEntity.email}</td>
                          <td><fmt:formatDate value="${result.booking_date}" pattern="dd-MM-yyyy" /></td>
                          <td>${result.booking_status}</td>
                          <td><fmt:formatNumber value="${result.total_price}" pattern="#,###.##" /> VND</td>

                          <td>
                            <button
                              onclick="location.href='viewBookingDetail/${result.id}'"
                              type="button"
                              class="btn btn-sm btn-outline-primary"
                            >
                              <i class="bx bx-edit-alt me-1"></i> View Detail
                            </button>
                            <c:if test="${booking.booking_status == 'COMPLETED'}">
                                <button
                                   data-toggle="modal" data-target="#confirm-delete"
                                    type="button"
                                    class="btn btn-sm btn-outline-secondary"
                                  >
                                    <i class="bx bx-trash me-1"></i> Cancel
                                  </button>
                                  <!-- Modal -->
                                <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                  <div class="modal-dialog">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h4 class="modal-title" id="myModalLabel">Confirm Cancel</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                      </div>
                                      <div class="modal-body">
                                        <p>Are you sure you want to cancel this booking?</p>
                                      </div>
                                      <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                                        <button onclick="location.href='cancelBooking/${result.id}'" class="btn btn-danger">Yes</button>
                                      </div>
                                    </div><!-- /.modal-content -->
                                  </div><!-- /.modal-dialog -->
                                </div><!-- /.modal -->
                            </c:if>


                          </td>
                        </tr>
                      </c:forEach>

                    </tbody>
                  </table>
                </div>
              </div>
               </c:if>
              <c:if test="${not empty bookingList}">
                  <div class="card">
                    <h5 class="card-header">Booking</h5>

                    <c:if test="${not empty sessionScope.msg}">
                        <div class="alert alert-success">${sessionScope.msg}</div>
                        <% session.removeAttribute("msg"); %>
                    </c:if>
                    <div class="table-responsive text-nowrap">
                      <table class="table table-hover">
                        <thead>
                          <tr>
                            <th>ID</th>
                            <th>Account Name</th>
                            <th>Booking Date</th>
                            <th>Booking Status</th>
                            <th>Total Price</th>

                            <th>Action</th>
                          </tr>
                        </thead>
                        <tbody class="table-border-bottom-0">
                        <small style="color: red">
                          <c:out value="${message}" />
                        </small>
                          <c:forEach
                            var="booking"
                            items="${bookingList}"
                            varStatus="index"
                          >
                            <tr>
                              <td>
                                <i
                                  class="fab fa-angular fa-lg text-danger me-3"
                                ></i>
                                <strong>${booking.id}</strong>
                              </td>
                              <td>${booking.accountEntity.email}</td>
                              <td><fmt:formatDate value="${booking.booking_date}" pattern="dd-MM-yyyy" /></td>
                              <td>${booking.booking_status}</td>
                              <td><fmt:formatNumber value="${booking.total_price}" pattern="#,###.##" /> VND</td>

                              <td>
                                <button
                                  onclick="location.href='viewBookingDetail/${booking.id}'"
                                  type="button"
                                  class="btn btn-sm btn-outline-primary"
                                >
                                  <i class="bx bx-edit-alt me-1"></i> View Detail
                                </button>
                                <c:if test="${booking.booking_status == 'COMPLETED'}">
                                    <button
                                       data-toggle="modal" data-target="#confirm-delete"
                                        type="button"
                                        class="btn btn-sm btn-outline-secondary"
                                      >
                                        <i class="bx bx-trash me-1"></i> Cancel
                                      </button>
                                      <!-- Modal -->
                                    <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                      <div class="modal-dialog">
                                        <div class="modal-content">
                                          <div class="modal-header">
                                            <h4 class="modal-title" id="myModalLabel">Confirm Cancel</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                          </div>
                                          <div class="modal-body">
                                            <p>Are you sure you want to cancel this booking?</p>
                                          </div>
                                          <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                                            <button onclick="location.href='cancelBooking/${booking.id}'" class="btn btn-danger">Yes</button>
                                          </div>
                                        </div><!-- /.modal-content -->
                                      </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
                                </c:if>


                              </td>
                            </tr>
                          </c:forEach>

                        </tbody>
                      </table>
                    </div>
                  </div>
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
    <script src='<c:url value="/resources/static/assets/vendor/js/helpers.js" />'></script>
    <script src='<c:url value="/resources/static/assets/js/config.js" />'></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
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
    <script src="<c:url value='/resources/js/jquery.min.js' />"></script>
    	<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
  </body>
</html>
