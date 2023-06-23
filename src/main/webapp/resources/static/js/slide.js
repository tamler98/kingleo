let slides = document.getElementsByClassName("slide");
let currentSlide = 0;

function showSlide(n) {
  for (let i = 0; i < slides.length; i++) {
    slides[i].classList.remove("active");
  }
  slides[n].classList.add("active");
}

function nextSlide() {
  if (currentSlide === slides.length - 1) {
    currentSlide = 0;
  } else {
    currentSlide++;
  }
  showSlide(currentSlide);
}

function prevSlide() {
  if (currentSlide === 0) {
    currentSlide = slides.length - 1;
  } else {
    currentSlide--;
  }
  showSlide(currentSlide);
}

function startSlider() {
  setInterval(nextSlide, 5000); // Thay đổi 3000 để điều chỉnh thời gian chuyển ảnh
}

startSlider();
