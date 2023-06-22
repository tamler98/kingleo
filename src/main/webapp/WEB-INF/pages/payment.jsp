<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.bootcss.com/font-awesome/5.11.2/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

  <link href='<c:url value="/resources/static/images/Logo_icon.svg" />' rel='shortcut icon'>
  <link href='<c:url value="/resources/static/css/bookingdetail.css" />' rel='stylesheet'>
  <title>Tanz Hotel</title>
</head>

<body>
  <div class="container">
    <form:form action="checkout" method="POST" modelAttribute="accountBanking">
      <div class="form-group">
        <label class="control-label">Card Number (*)</label>
        <form:input path="card_number" type="text" class="form-control" placeholder="Card Number" />
      </div>
      <div class="form-group">
        <label class="control-label">Full name (*)</label>
        <form:input path="full_name" type="text" class="form-control" placeholder="Full name" />
      </div>
      <div class="form-group">
        <label class="control-label">CVV (*)</label>
        <form:input path="cvv" type="text" class="form-control" placeholder="CVV" />
      </div>
      <div class="form-group">
        <label class="control-label">Expired date (*)</label>
        <form:input path="expired_date" type="date" class="form-control" />
      </div>
      <br>
      <input type="submit" class="btn btn-primary" name="submit" value="Submit"></input>
    </form:form>
  </div>

  <script>
    $(document).ready(function () {
      $("#customer-detail").click(function () {
        $("#customer-detail-content").slideToggle("slow");
      });
    });
  </script>
  <script>
    $(document).ready(function () {
      $("#customer-review").click(function () {
        $("#customer-review-content").slideToggle("slow");
      });
    });
  </script>
</body>
</html>
