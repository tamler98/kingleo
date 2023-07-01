<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
	xmlns:sec="https://www.thymeleaf.org/thymeleaf-extras-springsecurity5">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Booking Cart</title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Racing+Sans+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <!-- CSS -->
    <link href='/resources/static/css/product.css' rel='stylesheet'>
    <link rel="icon" type="image/svg" href="resources/static/image/favicon_KL.svg">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href='../resources/static/css/bookingcart.css' rel='stylesheet'>
    <link href='../resources/static/css/style.css' rel='stylesheet'>
    <!--FAVICON -->
    <link href='../resources/static/images/favicon_KL.svg' rel='shortcut icon'>
    <meta name="robots" content="noindex,follow" />
</head>

<body>
    <header th:include="header :: header"></header>
    <main>
        <section class="h-100 h-custom" style="background-color: #eee;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col">
                        <div class="card">
                            <div class="card-body p-4">
                                <div class="row">
                                    <div class="col-lg-7">
                                        <h5 class="mb-3"><a href="#!" class="text-body"><i
                                                    class="fas fa-long-arrow-alt-left me-2"></i>Tiếp tục mua hàng</a>
                                        </h5>
                                        <hr>
                                        <div class="d-flex justify-content-between align-items-center mb-4">
                                            <div style="text-align: left;">
                                                <p class="mb-1">Giỏ hàng của bạn</p>
                                                <p class="mb-0">Bạn có 4 sản phẩm trong giỏ hàng</p>
                                            </div>
                                            <div>
                                                <p class="mb-0"><span class="text-muted">Sắp xếp theo:</span> <a
                                                        href="#!" class="text-body">giá <i
                                                            class="fas fa-angle-down mt-1"></i></a></p>
                                            </div>
                                        </div>

                                        <div class="card mb-3" th:each="item, itemIndex : ${bookingCartItemList}">
                                            <div class="card-body" style="border-bottom: 1px solid #f3f3f3;">
                                                <div class="d-flex justify-content-between">
                                                    <div class="d-flex flex-row align-items-center">
                                                        <div>
                                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img1.webp"
                                                                class="img-fluid rounded-3" alt="Shopping item"
                                                                style="width: 65px; margin-right: 1em;">
                                                        </div>
                                                        <div class="ms-3">
                                                            <h5
                                                                th:text="${item.productDetailEntity.productEntity.product_name}">
                                                            </h5>
                                                            <p class="small mb-0" style="text-align: left;"> <span
                                                                    th:text="'Màu: '+${item.color}+', '+'Size: '+${item.size}">
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex flex-row align-items-center">
                                                        <form th:action="@{/cart/decrease}" method="post">
                                                             <input type="hidden" name="index" th:value="${itemIndex.index}">
                                                             <input type="hidden" name="quantity" th:value="${item.quantity - 1}">
                                                            <button type="submit">-</button>
                                                        </form>
                                                        <div style="width: 50px;">
                                                            <h5 class="fw-normal mb-0" th:text="${item.quantity}"></h5>
                                                        </div>
                                                         <form th:action="@{/cart/increase}" method="post">
                                                             <input type="hidden" name="index" th:value="${itemIndex.index}">
                                                             <input type="hidden" name="quantity" th:value="${item.quantity + 1}">
                                                            <button type="submit">+</button>
                                                        </form>
                                                        <div style="width: 80px;">
                                                            <h5 class="mb-0"
                                                                th:text="${item.productDetailEntity.productEntity.price}">
                                                            </h5>
                                                        </div>
                                                        <a th:href="@{|cart/deleteItem=${item.id}|}" style="color: #cecece;"><i
                                                                class="fas fa-trash-alt"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-lg-5">

                                        <div class="card bg-primary text-white rounded-3">
                                            <div class="card-body">
                                                <div class="d-flex justify-content-between align-items-center mb-4">
                                                    <h5 class="mb-0">Thông tin khách hàng</h5>
                                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-6.webp"
                                                        class="img-fluid rounded-3" style="width: 45px;" alt="Avatar">
                                                </div>



                                                <form action="cart/checkout" method="post">
                                                    <div class="form-group">
                                                        <label for="firstName">First Name:</label>
                                                        <input th:value="${accountEntity.first_name}" type="text" id="firstName" name="first_name" class="form-control" required />
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="lastName">Last Name:</label>
                                                        <input th:value="${accountEntity.last_name}" type="text" id="lastName" name="last_name" class="form-control" required />
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="email">Email:</label>
                                                        <input th:value="${accountEntity.email}" type="email" id="email" name="email" class="form-control" required />
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="phone">Phone:</label>
                                                        <input th:value="${accountEntity.phone}" type="text" id="phone" name="phone" class="form-control"  required />
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="address">Address:</label>
                                                        <input th:value="${accountEntity.address}" type="text" id="address" name="address" class="form-control" required />
                                                    </div>

                                                    <hr class="my-4">

                                                    <div class="d-flex justify-content-between">
                                                        <p class="mb-2">Giá trị đơn hàng</p>
                                                        <p class="mb-2"<span th:text="${priceOfAllProduct}"></span></p>
                                                    </div>

                                                    <div class="d-flex justify-content-between">
                                                        <p class="mb-2">Phí ship COD</p>
                                                        <p class="mb-2">$20.00</p>
                                                    </div>

                                                    <div class="d-flex justify-content-between mb-4">
                                                        <p class="mb-2">Tổng cộng</p>
                                                        <p class="mb-2"><span th:text="${totalPrice}"></p>
                                                    </div>

                                                     <button type="submit" class="btn btn-info btn-block btn-lg">
                                                        <div class="d-flex justify-content-between">
                                                            <span>Đặt hàng <i class="fas fa-long-arrow-alt-right ms-2"></i></span>
                                                        </div>
                                                    </button>
                                                </form>






                                            </div>
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</body>
</html>
