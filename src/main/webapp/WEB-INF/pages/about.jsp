<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
  <head>
    <title>About us | Azure Da Nang</title>
    <jsp:include page="head.jsp" />
    <link
      href='<c:url value="/resources/static/css/aboutpage/css/style.css" />'
      rel="stylesheet"
    />
  </head>

  <body>
    <jsp:include page="navbar.jsp" />

    <div
      class="hero-wrap"
      style="
        background-image: url('https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80');
      "
    >
      <div class="overlay"></div>
      <div class="container">
        <div
          class="row no-gutters slider-text d-flex align-itemd-end justify-content-center"
        >
          <div
            class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center"
          >
            <div class="text">
              <p class="breadcrumbs mb-2">
                <span class="mr-2"><a href="./">Home</a></span>
                <span>About Azure</span>
              </p>
              <h1 class="mb-4 bread">About Azure</h1>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="section">
      <div class="container">
        <div class="row text-left mb-5">
          <div class="col-12">
            <h2 class="font-weight-bold heading text-primary mb-4">About Us</h2>
          </div>
          <div class="col-lg-6">
            <p class="text-black-50">
              Azure is a 4-star luxury hotel that offers guests an exceptional
              experience from the moment they step inside. With its elegant
              design, luxurious amenities, and top-notch service, Azure is the
              perfect choice for discerning travelers looking for a first-class
              experience.
            </p>
            <p class="text-black-50">
              Azure offers a variety of room options to cater to the needs of
              both families and individuals. For families, the hotel has
              spacious family rooms and suites that are designed to accommodate
              up to four guests comfortably. These rooms feature extra bedding
              options, such as sofa beds or rollaway beds, as well as amenities
              like mini-fridges and microwaves to make your family's stay more
              convenient.
            </p>
            <p class="text-black-50">
              For individual travelers, Azure has a range of deluxe rooms and
              suites that offer comfort and style. These rooms are equipped with
              modern amenities like flat-screen TVs, high-speed internet access,
              and luxurious bedding to ensure a comfortable and restful stay.
            </p>
          </div>
          <div class="col-lg-6">
            <p class="text-black-50">
              Located in the heart of Da Nang, Azure is close to many popular
              attractions, including the My Khe Beach, Han River Bridge, and
              Dragon Bridge. The hotel's central location makes it easy for
              guests to explore the city and experience all that Da Nang has to
              offer.
            </p>
            <p class="text-black-50">
              Overall, if you're planning a trip to Da Nang, Azure is an
              excellent choice for your accommodations. With its luxurious
              amenities, convenient location, and exceptional service, it's sure
              to provide an unforgettable experience for your travels.
            </p>
          </div>
        </div>
      </div>
    </div>

    <div class="section pt-0">
      <div class="container">
        <div class="row justify-content-between mb-5">
          <div class="col-lg-7 mb-5 mb-lg-0 order-lg-2">
            <div class="img-about dots">
              <img src="https://images.unsplash.com/photo-1587822363676-b27f3fa721a0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1229&q=80" class="img-fluid">
            </div>
          </div>
          <div class="col-lg-4">
            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-home2"></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">Wonderful Location</h3>
                <p class="text-black-50">
                  Just door steps to dip your feet on the white sand and feel
                  the glistening water. This beach front hotel enables panoramic
                  view to My Khe Beach and Son Tra peninsula...
                </p>
              </div>
            </div>

            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-person"></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">A good night sleep</h3>
                <p class="text-black-50">
                  All of our spacious suites and apartments are designed with
                  the latest modern conveniences and number of intelligent
                  configurations to suit your needs.
                </p>
              </div>
            </div>

            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-security"></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">Secret of Relaxations</h3>
                <p class="text-black-50">
                  Spice up your life at Spice Spa. We offer you several
                  exceptional treatments to refresh your body, mind and soul and
                  many packages to shine your beauty.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="section pt-0">
      <div class="container">
        <div class="row justify-content-between mb-5">
          <div class="col-lg-7 mb-5 mb-lg-0">
            <div class="img-about dots">
              <img src="https://images.unsplash.com/photo-1584132967334-10e028bd69f7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" alt="Image" class="img-fluid">
            </div>
          </div>
          <div class="col-lg-4">
            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-home2"></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">Events</h3>
                <p class="text-black-50">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit.
                  Nostrum iste.
                </p>
              </div>
            </div>

            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-person"></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">Our Foodies</h3>
                <p class="text-black-50">
                  Our culinary team offer variety of delicious food to everyone.
                  From nutritious breakfast, contemporary dining at FishCá, to
                  casual meal in DELIcious or The Top, we cater to all tastes.
                </p>
              </div>
            </div>

            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-security"></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">For your Kids</h3>
                <p class="text-black-50">
                  Travel with your kids? Just give them a break! We have Kids
                  Club with a variety of fun activities for different ages.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <jsp:include page="footer.jsp" />

    <!-- Preloader -->
    <div id="overlayer"></div>
    <div class="loader">
      <div class="spinner-border" role="status">
        <span class="visually-hidden">Loading...</span>
      </div>
    </div>
    <script src='<c:url value="/resources/static/css/aboutpage/js/bootstrap.bundle.min.js" />'></script>
    <script src='<c:url value="/resources/static/css/aboutpage/js/aos.js" />'></script>
    <script src='<c:url value="/resources/static/css/aboutpage/js/custom.js" />'></script>
    <jsp:include page="scripts.jsp" />
  </body>
</html>

