<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
	xmlns:sec="https://www.thymeleaf.org/thymeleaf-extras-springsecurity5">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Racing+Sans+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Open+Sans">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" type="image/svg" href="resources/static/images/favicon_KL.svg">
    <link href='../resources/static/css/newProduct.css' rel='stylesheet'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>KingLeo Football</title>
</head>
<body>
<main>
<form class="form-horizontal" action="newProduct" method="POST" modelAttribute="product" enctype="multipart/form-data">
<fieldset>

<!-- Form Name -->
<legend>PRODUCTS</legend>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_name">PRODUCT NAME</label>
  <div class="col-md-4">
  <input id="product_name" th:value="${product.product_name}" name="product_name" placeholder="PRODUCT NAME" class="form-control input-md" required="" type="text">
  </div>
</div>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_name_fr">PRODUCT PRICE</label>
  <div class="col-md-4">
  <input id="product_name_fr" th:value="${product.price}" name="price" placeholder="PRODUCT PRICE" class="form-control input-md" required="" type="text">
  </div>
</div>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_category">PRODUCT CATEGORY</label>
  <div class="col-md-4">
    <select id="product_category" name="product_category" class="form-control">
      <option th:each="item : ${categoryList}" th:value="${item.key}" th:text="${item.value}"></option>
    </select>
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="product_colors">Màu giày</label>
  <div class="col-md-4">
    <input id="product_colors" name="product_colors" type="text" />
    <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
      <span class="d-none d-sm-block">Ảnh</span>
      <i class="bx bx-upload d-block d-sm-none"></i>
      <input name="photos" type="file" class="account-file-input upload" multiple accept="image/png, image/jpeg" />
    </label>
    <button type="button" onclick="addInput()">Add</button>
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <div class="col-md-4">
    <button type="submit" id="singlebutton" name="singlebutton" class="btn btn-primary">Button</button>
  </div>
  </div>

</fieldset>
</form>
</main>
</body>
<script>
var counter = 1;

function addInput() {
  var inputContainer = document.createElement('div');
  inputContainer.classList.add('col-md-4');

  var newInput = document.createElement('input');
  newInput.name = 'product_colors';
  newInput.type = 'text';

  var newFileInput = document.createElement('input');
  newFileInput.name = 'photos';
  newFileInput.type = 'file';
  newFileInput.classList.add('account-file-input');
  newFileInput.classList.add('upload');
  newFileInput.multiple = true;
  newFileInput.accept = 'image/png, image/jpeg';

  inputContainer.appendChild(newInput);
  inputContainer.appendChild(newFileInput);

  var addButton = document.querySelector('button');
  addButton.parentNode.insertBefore(inputContainer, addButton);

  counter++;
}
</script>


</html>