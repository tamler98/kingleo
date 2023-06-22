<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<head>
	<title>About us | Azure Da Nang</title>
        <jsp:include page="head.jsp" />
        <link
          href='<c:url value="/resources/static/css/aboutpage/css/style.css" />'
          rel="stylesheet"
        />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-q0pKjHT6U8W6Uoabv0oA6ddQzKgL8W1/CIT0vVYKj+dRKnTbLrP2O79MVhmKq3gIaP49umytzayorHvVf3iLEw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

	<link rel="preconnect" href="https://fonts.googleapis.com"/>
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
	<link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap" rel="stylesheet"/>
	<link href='<c:url value="/resources/static/css/aboutpage/fonts/flaticon/font/flaticon.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/static/css/aboutpage/fonts/icomoon/style.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/static/css/aboutpage/css/tiny-slider.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/static/css/aboutpage/css/aos.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/static/css/aboutpage/css/style.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/static/css/aboutpage/css/star.css" />' rel="stylesheet" />
	<title>Azure Hotel | Rating</title>
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
			<div class="row">
				<div class="col-lg-4 mb-5 mb-lg-0" data-aos="fade-up" data-aos-delay="100">
					<div class="contact-info">

						<div class="address mt-2">
							<i class="icon-room"></i>
							<h4 class="mb-2">Location:</h4>
							<p>92 Quang Trung, Hai Chau, <br> Da Nang</p>
						</div>

						<div class="open-hours mt-4">
							<i class="icon-clock-o"></i>
							<h4 class="mb-2">Open Hours:</h4>
							<p> Sunday-Friday:<br> 11:00 AM - 2300 PM </p>
						</div>

						<div class="email mt-4">
							<i class="icon-envelope"></i>
							<h4 class="mb-2">Email:</h4>
							<p>Azurehotel@azure.com</p>
						</div>

						<div class="phone mt-4">
							<i class="icon-phone"></i>
							<h4 class="mb-2">Call:</h4>
							<p>+84 384 203 345</p>
						</div>

					</div>
				</div>
				<div class="col-lg-8" data-aos="fade-up" data-aos-delay="200">
					<form:form action="createrating" method="POST" modelAttribute="rating">
						<div class="row">
							<div class="col-6 mb-3">
								<form:input class="form-control" type="text" path="user_name" placeholder="Your Name" id="user_name" />
							</div>
							<div class="col-6 mb-3">
								<input value="${accountEntity.email}" class="form-control" placeholder="Your Email" readonly>
							</div>
							<div class="col-12 mb-3">
								<form:input type="text" class="form-control" placeholder="Subject" path="tittle" />
							</div>
							<div class="col-12 mb-3">
                                <select  name="category_name" class="form-control">
                                    <option value="">Choose Type Room</option>
                                    <c:forEach items="${categoryList}" var="category">
                                        <option value="${category.key}">${category.value}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-12 mb-3">
                                <select name="room_name" class="form-control">
                                    <option value="">Choose Room</option>
                                    <c:forEach items="${roomList}" var="room">
                                        <option value="${room.key}">${room.value}</option>
                                    </c:forEach>
                                </select>
                            </div>

							<div class="col-12 mb-3">
							<label >Service Quality:</lable>
                                <div class="star-rating" style="margin-left: 1em;">
                                    <input type="radio" id="rating1" name="hdrating" value="1" /><label for="rating1">Very bad</label>
                                    <input type="radio" id="rating2" name="hdrating" value="2" /><label for="rating2">Bad</label>
                                  <input type="radio" id="rating3" name="hdrating" value="3" /><label for="rating3">Normal</label>
                                  <input type="radio" id="rating4" name="hdrating" value="4" /><label for="rating4">Good</label>
                                  <input type="radio" id="rating5" name="hdrating" value="5" /><label for="rating5">Very good</label>


                                  </div>
                            </div>
                            <div class="col-12 mb-3">
                                <textarea name="content" name="" id="" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
                            </div>

							<div class="col-12">
								<input type="submit" value="Send Message" class="btn btn-primary">
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div> <!-- /.untree_co-section -->

	<script src='<c:url value="/resources/static/css/aboutpage/js/bootstrap.bundle.min.js" />'></script>
	<script src='<c:url value="/resources/static/css/aboutpage/js/aos.js" />'></script>
	<script src='<c:url value="/resources/static/css/aboutpage/js/custom.js" />'></script>
<script>
$(document).ready(function() {
    // Update the hidden rating field with the selected value
    $('input[type="radio"][name="hdrating"]').change(function() {
        $('#hdrating').val($(this).val());
    });
});
</script>
  </body>
  </html>
