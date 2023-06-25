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
<form class="form-horizontal" action="newImage" method="POST" modelAttribute="product" enctype="multipart/form-data">
<div class="button-wrapper">
    <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
        <span class="d-none d-sm-block">Upload new photo</span>
        <i class="bx bx-upload d-block d-sm-none"></i>
        <input name="photo" type="file" id="upload"
            class="account-file-input" hidden
            accept="image/png, image/jpeg" />
    </label>
    <button type="submit"
        class="btn btn-outline-secondary account-image-reset mb-4">
        <i class="bx bx-reset d-block d-sm-none"></i>
        <span class="d-none d-sm-block">submit</span>
    </button>

    <p class="text-muted mb-0">Allowed JPG, GIF or PNG. Max size of 800K
    </p>
</div>
</form>
</main>
</body>
</html>