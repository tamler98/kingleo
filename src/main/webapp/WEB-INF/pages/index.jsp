<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>Azure Hotel | Hotel in Da Nang</title>
    <jsp:include page="head.jsp" />
  </head>

  <body>
    <jsp:include page="navbar.jsp" />

   <section class="home-slider owl-carousel">
   	<div class="slider-item" style="background-image: url(resources/static/images/hero_1.jpg)">
   		<div class="overlay"></div>
   		<div class="container">
   			<div class="row no-gutters slider-text align-items-center justify-content-center">
   				<div class="col-md-12 ftco-animate text-center">
   					<div class="text mb-5 pb-3">
   						<h1 class="mb-3">Welcome To Azure</h1>
   						<h2>Hotels &amp; Resorts</h2>
   					</div>
   				</div>
   			</div>
   		</div>
   	</div>

   	<div class="slider-item" style="background-image: url(resources/static/images/hero_2.jpg)">
   		<div class="overlay"></div>
   		<div class="container">
   			<div class="row no-gutters slider-text align-items-center justify-content-center">
   				<div class="col-md-12 ftco-animate text-center">
   					<div class="text mb-5 pb-3">
   						<h1 class="mb-3">Enjoy A Luxury Experience</h1>
   						<h2>Join With Us</h2>
   					</div>
   				</div>
   			</div>
   		</div>
   	</div>
   </section>

    <section class="ftco-booking">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <form:form action="availableRoom" method="get" class="booking-form">
              <div class="row">
                <div class="col-md-3 d-flex">
                  <div
                    class="form-group p-4 align-self-stretch d-flex align-items-end"
                  >
                    <div class="wrap">
                      <label for="#">Check-in Date</label>
                      <input
                        name="checkin"
                        type="date"
                        class="form-control"
                        placeholder="Check-in date"
                        id="date-input-checkin"
                        required
                      />
                    </div>
                  </div>
                </div>
                <div class="col-md-3 d-flex">
                  <div
                    class="form-group p-4 align-self-stretch d-flex align-items-end"
                  >
                    <div class="wrap">
                      <label for="#">Check-out Date</label>
                      <input
                        name="checkout"
                        type="date"
                        class="form-control"
                        placeholder="Check-out date"
                        id="date-input-checkout"
                        required
                      />
                    </div>
                  </div>
                </div>
                <div class="col-md d-flex">
                  <div
                    class="form-group p-4 align-self-stretch d-flex align-items-end"
                  >
                    <div class="wrap">
                      <label for="#">Room</label>
                      <div class="form-field">
                        <div class="select-wrap">
                          <div class="icon">
                            <span class="ion-ios-arrow-down"></span>
                          </div>
                          <select
                            name="roomType"
                            id=""
                            class="form-control"
                            required
                          >
                            <option value="Standard">Standard</option>
                            <option value="Family">Family</option>
                            <option value="Business">Business</option>
                            <option value="Studio">Studio</option>
                            <option value="Cozy">Cozy</option>
                            <option value="Luxury">Luxury</option>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md d-flex">
                  <div
                    class="form-group p-4 align-self-stretch d-flex align-items-end"
                  >
                    <div class="wrap">
                      <label for="#">Customer</label>
                      <div class="form-field">
                        <div class="select-wrap">
                          <div class="icon">
                            <span class="ion-ios-arrow-down"></span>
                          </div>
                          <select
                            name="guests"
                            id=""
                            class="form-control"
                            required
                          >
                            <option value="1">1 Adult</option>
                            <option value="2">2 Adult</option>
                            <option value="3">3 Adult</option>
                            <option value="4">4 Adult</option>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md d-flex">
                  <div class="form-group d-flex align-self-stretch">
                    <input
                      type="submit"
                      value="Check Availability"
                      class="btn btn-primary py-3 px-4 align-self-stretch"
                    />
                  </div>
                </div>
              </div>
            </form:form>
          </div>
        </div>
      </div>
    </section>
    <section class="ftco-section ftc-no-pt">
      <div class="container">
        <div class="row no-gutters">
          <div class="col-md-3">
            <a
              href="#"
              class="services-wrap img align-items-end d-flex"
              style="background-image: url(resources/static/images/room-3.jpg)"
            >
              <div class="text text-center pb-2">
                <h3>Special Rooms</h3>
              </div>
            </a>
          </div>
          <div class="col-md-3">
            <a
              href="#"
              class="services-wrap img align-items-end d-flex"
              style="
                background-image: url(resources/static/images/swimming-pool.jpg);
              "
            >
              <div class="text text-center pb-2">
                <h3>Swimming Pool</h3>
              </div>
            </a>
          </div>
          <div class="col-md-3">
            <a
              href="#"
              class="services-wrap img align-items-end d-flex"
              style="background-image: url(resources/static/images/resto.jpg)"
            >
              <div class="text text-center pb-2">
                <h3>Restaurant</h3>
              </div>
            </a>
          </div>
          <div class="col-md-3">
            <div
              class="services-wrap services-overlay img align-items-center d-flex"
              style="background-image: url(resources/static/images/sleep.jpg)"
            >
              <div class="text text-center pb-2">
                <h3 class="mb-0">Suites &amp; Rooms</h3>
                <span>Special Rooms</span>
                <div class="d-flex mt-2 justify-content-center">
                  <div class="icon">
                    <a href="#"><span class="ion-ios-arrow-forward"></span></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <div class="container">
      <div class="row justify-content-center mb-5 pb-3">
        <div class="col-md-7 heading-section text-center ftco-animate">
          <span class="subheading">Welcome to Azure Hotel</span>
          <h2 class="mb-4">A New Vision of Luxury Hotel</h2>
        </div>
      </div>
      <div class="row d-flex">
        <div class="col-md pr-md-1 d-flex align-self-stretch ftco-animate">
          <div class="media block-6 services py-4 d-block text-center">
            <div class="d-flex justify-content-center">
              <div
                class="icon d-flex align-items-center justify-content-center"
              >
                <span class="flaticon-reception-bell"></span>
              </div>
            </div>
            <div class="media-body">
              <h3 class="heading mb-3">Friendly Service</h3>
            </div>
          </div>
        </div>
        <div class="col-md px-md-1 d-flex align-self-stretch ftco-animate">
          <div class="media block-6 services active py-4 d-block text-center">
            <div class="d-flex justify-content-center">
              <div
                class="icon d-flex align-items-center justify-content-center"
              >
                <span class="flaticon-serving-dish"></span>
              </div>
            </div>
            <div class="media-body">
              <h3 class="heading mb-3">Get Breakfast</h3>
            </div>
          </div>
        </div>
        <div
          class="col-md px-md-1 d-flex align-sel Searchf-stretch ftco-animate"
        >
          <div class="media block-6 services py-4 d-block text-center">
            <div class="d-flex justify-content-center">
              <div
                class="icon d-flex align-items-center justify-content-center"
              >
                <span class="flaticon-car"></span>
              </div>
            </div>
            <div class="media-body">
              <h3 class="heading mb-3">Transfer Services</h3>
            </div>
          </div>
        </div>
        <div class="col-md px-md-1 d-flex align-self-stretch ftco-animate">
          <div class="media block-6 services py-4 d-block text-center">
            <div class="d-flex justify-content-center">
              <div
                class="icon d-flex align-items-center justify-content-center"
              >
                <span class="flaticon-spa"></span>
              </div>
            </div>
            <div class="media-body">
              <h3 class="heading mb-3">Suits &amp; SPA</h3>
            </div>
          </div>
        </div>
        <div class="col-md pl-md-1 d-flex align-self-stretch ftco-animate">
          <div class="media block-6 services py-4 d-block text-center">
            <div class="d-flex justify-content-center">
              <div
                class="icon d-flex align-items-center justify-content-center"
              >
                <span class="ion-ios-bed"></span>
              </div>
            </div>
            <div class="media-body">
              <h3 class="heading mb-3">Cozy Rooms</h3>
            </div>
          </div>
        </div>
      </div>
    </div>
    <section class="ftco-section ftc-no-pb">
      <div class="container">
        <div class="col special-img pl-0">
          <img
            style="height: 500px; width: 100%"
            class="img-fluid"
            src="resources/static/images/bg_3.jpg"
            alt=""
          />
        </div>
        <div class="col py-5 wrap-about pb-md-5 ftco-animate">
          <div class="heading-section heading-section-wo-line mb-5">
            <div class="ml-md-0">
              <span class="subheading">The first resort hotel in Vietnam</span>
              <h2 class="mb-4">AZURE HOTEL - MADE BY ORIGINALS</h2>
            </div>
          </div>
          <div class="pb-md-5">
            <p>
              On her way she met a copy. The copy warned the Little Blind Text,
              that where it came from it would have been rewritten a thousand
              times and everything that was left from its origin would be the
              word "and" and the Little Blind Text should turn around and return
              to its own, safe country. But nothing the copy said could convince
              her and so it didn’t take long until a few insidious Copy Writers
              ambushed her, made her drunk with Longe and Parole and dragged her
              into their agency, where they abused her for their.
            </p>
            <p>
              When she reached the first hills of the Italic Mountains, she had
              a last view back on the skyline of her hometown Bookmarksgrove,
              the headline of Alphabet Village and the subline of her own road,
              the Line Lane. Pityful a rethoric question ran over her cheek,
              then she continued her way.
            </p>
            <ul class="ftco-social d-flex">
              <li class="ftco-animate">
                <a href="#"><span class="icon-twitter"></span></a>
              </li>
              <li class="ftco-animate">
                <a href="#"><span class="icon-facebook"></span></a>
              </li>
              <li class="ftco-animate">
                <a href="#"><span class="icon-google-plus"></span></a>
              </li>
              <li class="ftco-animate">
                <a href="#"><span class="icon-instagram"></span></a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </section>

    <section class="section-margin">
      <div class="row justify-content-center mb-5 pb-3 px-0 mx-0">
        <div
          class="col-md-7 heading-section text-center ftco-animate justify-item-center"
        >
          <span class="subheading">Azure Rooms</span>
          <h2 class="mb-4">Hotel Master's Rooms</h2>
        </div>
      </div>

      <div class="container">
        <div class="row">
          <c:forEach items="${categoryList}" var="category" varStatus="index">
            <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
              <div class="card card-explore">
                <div class="card-explore__img">
                  <img
                    style="height: 250px"
                    class="card-img"
                    src="getImagePhotoByCategory/${category.id}"
                    alt=""
                  />
                </div>
                <div class="card-body">
                  <h3 class="card-explore__price font-weight-bold">
                    $
                    <fmt:formatNumber
                      value="${category.price}"
                      pattern="#,###.##"
                    /><sub>/ Per Night</sub>
                  </h3>

                  <h4 class="card-explore__title font-weight-bold">
                    <a href="#">${category.category_name}</a>
                  </h4>
                  <p>${category.description}</p>

                </div>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
    </section>

    <section class="section-padding bg-porcelain">
      <div class="row justify-content-center mb-5 pb-3 px-0 mx-0">
        <div
          class="col-md-7 heading-section text-center ftco-animate justify-item-center"
        >
          <h2 class="mb-4">Special Facilities</h2>
        </div>
      </div>
      <div class="container">
        <div class="special-img mb-30px">
          <img
            class="img-fluid"
            src="https://images.unsplash.com/photo-1533377437229-5ca96ecbcd78?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"
            alt=""
          />
        </div>

        <div class="row" style="margin-top: 30px; margin-bottom: 30px">
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
            <div class="card card-special">
              <div class="media align-items-center mb-1">
                <span class="card-special__icon"><i class="ti-home"></i></span>
                <div class="media-body">
                  <h4 class="card-special__title">Conference Room</h4>
                </div>
              </div>
              <div class="card-body">
                <p>
                  Built purse maids cease her ham new seven among and. Pulled
                  coming wooded tended it answer remain
                </p>
              </div>
            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
            <div class="card card-special">
              <div class="media align-items-center mb-1">
                <span class="card-special__icon"><i class="ti-bell"></i></span>
                <div class="media-body">
                  <h4 class="card-special__title">Swimming Pool</h4>
                </div>
              </div>
              <div class="card-body">
                <p>
                  Built purse maids cease her ham new seven among and. Pulled
                  coming wooded tended it answer remain
                </p>
              </div>
            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
            <div class="card card-special">
              <div class="media align-items-center mb-1">
                <span class="card-special__icon"><i class="ti-car"></i></span>
                <div class="media-body">
                  <h4 class="card-special__title">Sports Culb</h4>
                </div>
              </div>
              <div class="card-body">
                <p>
                  Built purse maids cease her ham new seven among and. Pulled
                  coming wooded tended it answer remain
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="why-choose-us">
      <div class="row justify-content-center mb-5 pb-3 mx-0 px-0">
        <div
          class="col-md-7 heading-section text-center ftco-animate justify-item-center"
        >
          <h2 class="mb-4">Why Choose Us?</h2>
        </div>
      </div>
      <div class="container">
        <div class="container" style="margin-bottom: 50px">
          With a fresh modern design and a surprising concept, À La Carte Da
          Nang Beach is comprised of vibrant and spacious sea-view suites at
          amazing prices with a creative à la carte add-on concept, and fun
          casual service. Stay at À La Carte Da Nang Beach and choose from
          several suite styles that feature studios, one or two bedroom options
          and balconies with mountain and sea views... view more
        </div>
        <div class="row">
          <div class="col-md-4">
            <div class="card">
              <img
                src="https://images.unsplash.com/photo-1584132915807-fd1f5fbc078f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
                alt="Image 1"
              />
              <h3>Comfortable Rooms</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card">
              <img
                src="https://images.unsplash.com/photo-1445019980597-93fa8acb246c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80"
                alt="Image 2"
              />
              <h3>Excellent Service</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card">
              <img
                src="https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
                alt="Image 3"
              />
              <h3>Convenient Location</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section
      class="ftco-section ftco-counter img"
      id="section-counter"
      style="background-image: url(resources/static/images/hero_1.jpg)"
    >
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-10">
            <div class="row">
              <div
                class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate"
              >
                <div class="block-18 text-center">
                  <div class="text">
                    <strong class="number" data-number="50000">0</strong>
                    <span>Happy Guests</span>
                  </div>
                </div>
              </div>
              <div
                class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate"
              >
                <div class="block-18 text-center">
                  <div class="text">
                    <strong class="number" data-number="3000">0</strong>
                    <span>Rooms</span>
                  </div>
                </div>
              </div>
              <div
                class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate"
              >
                <div class="block-18 text-center">
                  <div class="text">
                    <strong class="number" data-number="1000">0</strong>
                    <span>Staffs</span>
                  </div>
                </div>
              </div>
              <div
                class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate"
              >
                <div class="block-18 text-center">
                  <div class="text">
                    <strong class="number" data-number="100">0</strong>
                    <span>Destination</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section testimony-section bg-light">
    	<div class="container">
    		<div class="row justify-content-center">
    			<div class="col-md-8 ftco-animate">
    				<div class="row ftco-animate">
    					<div class="col-md-12">
    						<div class="carousel-testimony owl-carousel ftco-owl">
    							<c:forEach items="${ratingList}" var="rating">
    								<div class="item">
    									<div class="testimony-wrap py-4 pb-5">
    										<div class="user-img mb-4">
    											<img style="width:105px; height:105px;border-radius:50%;" src="getuseravatar/${rating.accountEntity.id}" />
    											<span class="quote d-flex align-items-center justify-content-center">
    												<i class="icon-quote-left"></i>
    											</span>
    										</div>
    										<div class="text text-center">
    										<p class="name" style="font-weight:bold;">${rating.user_name}</p>
    										<span class="position>
                                                <c:forEach begin="1" end="${rating.rating_point+1}">
                                                  <span class="icon-star text-warning"></span>
                                                </c:forEach>
                                            </span>
                                            <p class="name" style="font-style: italic; margin-top:.5em; margin-bottom:0px;">"${rating.tittle}"</p>
    										<p class="mb-4" style="line-height: 1.5em; padding: 0px 20em; font-style: italic;margin-top: 0.5em;">“${rating.content}“</p>

    										</div>
    									</div>
    								</div>
    								</c:forEach>
    						</div>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>

    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2>Recent Blog</h2>
          </div>
        </div>
        <div class="row d-flex">
          <div class="col-md-3 d-flex ftco-animate">
            <div class="blog-entry align-self-stretch">
              <a
                href="blog-single.html"
                class="block-20"
                style="
                  background-image: url('https://images.unsplash.com/photo-1560624052-449f5ddf0c31?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80');
                "
              >
              </a>
              <div class="text mt-3 d-block">
                <h3 class="heading mt-3">
                  <a href="#"
                    >Even the all-powerful Pointing has no control about the
                    blind texts</a
                  >
                </h3>
                <div class="meta mb-3">
                  <div><a href="#">Dec 6, 2018</a></div>
                  <div><a href="#">Admin</a></div>
                  <div>
                    <a href="#" class="meta-chat"
                      ><span class="icon-chat"></span> 3</a
                    >
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-3 d-flex ftco-animate">
            <div class="blog-entry align-self-stretch">
              <a
                href="blog-single.html"
                class="block-20"
                style="
                  background-image: url('https://images.unsplash.com/photo-1514933651103-005eec06c04b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80');
                "
              >
              </a>
              <div class="text mt-3">
                <h3 class="heading mt-3">
                  <a href="#"
                    >Even the all-powerful Pointing has no control about the
                    blind texts</a
                  >
                </h3>
                <div class="meta mb-3">
                  <div><a href="#">Dec 6, 2018</a></div>
                  <div><a href="#">Admin</a></div>
                  <div>
                    <a href="#" class="meta-chat"
                      ><span class="icon-chat"></span> 3</a
                    >
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-3 d-flex ftco-animate">
            <div class="blog-entry align-self-stretch">
              <a
                href="blog-single.html"
                class="block-20"
                style="
                  background-image: url('https://images.unsplash.com/photo-1531088009183-5ff5b7c95f91?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80');
                "
              >
              </a>
              <div class="text mt-3">
                <h3 class="heading mt-3">
                  <a href="#"
                    >Even the all-powerful Pointing has no control about the
                    blind texts</a
                  >
                </h3>
                <div class="meta mb-3">
                  <div><a href="#">Dec 6, 2018</a></div>
                  <div><a href="#">Admin</a></div>
                  <div>
                    <a href="#" class="meta-chat"
                      ><span class="icon-chat"></span> 3</a
                    >
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-3 d-flex ftco-animate">
            <div class="blog-entry align-self-stretch">
              <a
                href="blog-single.html"
                class="block-20"
                style="
                  background-image: url('https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80');
                "
              >
              </a>
              <div class="text mt-3">
                <h3 class="heading mt-3">
                  <a href="#"
                    >Even the all-powerful Pointing has no control about the
                    blind texts</a
                  >
                </h3>
                <div class="meta mb-3">
                  <div><a href="#">Dec 6, 2018</a></div>
                  <div><a href="#">Admin</a></div>
                  <div>
                    <a href="#" class="meta-chat"
                      ><span class="icon-chat"></span> 3</a
                    >
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <jsp:include page="footer.jsp" />

    <!-- loader -->
    <div id="ftco-loader" class="show fullscreen">
      <svg class="circular" width="48px" height="48px">
        <circle
          class="path-bg"
          cx="24"
          cy="24"
          r="22"
          fill="none"
          stroke-width="4"
          stroke="#eeeeee"
        />
        <circle
          class="path"
          cx="24"
          cy="24"
          r="22"
          fill="none"
          stroke-width="4"
          stroke-miterlimit="10"
          stroke="#F96D00"
        />
      </svg>
    </div>
    <script>
      var today = new Date().toISOString().split("T")[0];
      document.getElementById("date-input-checkin").setAttribute("min", today);

      var checkInDateInput = document.getElementById("date-input-checkin");
      var checkInDate = checkInDateInput.value + today;
      document
        .getElementById("date-input-checkout")
        .setAttribute("min", checkInDate);
    </script>
    <jsp:include page="scripts.jsp" />

  </body>
</html>