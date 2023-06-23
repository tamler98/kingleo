          // Lấy giá trị 'count' từ session và gán vào thẻ span
          var count = sessionStorage.getItem('count');
          document.getElementById('lblCartCount').innerText = count;

        // Lấy tham chiếu đến hình ảnh và danh sách không sắp xếp
        const profileImage = document.getElementById('profile-image');
        const subMenu = document.querySelector('li > ul');

        // Ẩn danh sách khi trang web được tải
        subMenu.style.display = 'none';

        // Xử lý sự kiện nhấp chuột vào hình ảnh
        profileImage.addEventListener('click', function() {
          // Kiểm tra trạng thái hiển thị của danh sách
          if (subMenu.style.display === 'none') {
            // Nếu danh sách đang ẩn, hiển thị nó
            subMenu.style.display = 'block';
          } else {
            // Nếu danh sách đang hiển thị, ẩn nó
            subMenu.style.display = 'none';
          }
        });