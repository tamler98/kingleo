<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Checkout Success</title>
</head>
<body>
    <h1>Checkout Success</h1>

    <h2>Order Details</h2>
    <p>Total Price: <span th:text="${totalPrice}"></span></p>
    <p>Price of All Products: <span th:text="${priceOfAllProduct}"></span></p>

    <h2>User Information</h2>
    <p>Name: <span th:text="${accountEntity.first_name}"></span> <span th:text="${accountEntity.last_name}"></span></p>
    <p>Email: <span th:text="${accountEntity.email}"></span></p>
    <p>Phone: <span th:text="${accountEntity.phone}"></span></p>
    <p>Address: <span th:text="${accountEntity.address}"></span></p>

    <h2>Order Summary</h2>
    <!-- Display additional order summary details if needed -->

    <!-- Add any other relevant content for the checkout success page -->
</body>
</html>
