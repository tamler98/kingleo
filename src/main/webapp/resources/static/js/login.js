// Lấy phần tử thông báo theo id
var msgElement = document.getElementById("msg");

// Xóa lớp "hide" sau 5 giây để hiển thị thông báo
setTimeout(function() {
    msgElement.classList.add("hide");
}, 5000);