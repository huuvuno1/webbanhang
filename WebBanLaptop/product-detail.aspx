<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product-detail.aspx.cs" Inherits="WebBanLaptop.product_detail"
  %>

  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="/assets/css/style.css" />
    <link rel="stylesheet" href="/assets/css/productDetailCss.css" />
  </head>

  <body>
    <header class="bg-white">
      <div class="header__wrapper w-1200 flex justify-between flex justify-between mx-auto">
        <div class="header__logo">logo</div>
        <div class="header__search flex item-center relative">
          <input />
          <img class="header__search--icon absolute cursor-pointer" src="/assets/images/search.svg" />
        </div>
        <div class="header__contact flex justify-center flex-col">
          <div class="bold text-red">HOTLINE: 0945.364.296 - 0910.101.101</div>
          <div class="mt-5 text-red">Số 96 Định Công, Hoàng Mai, TP Hà Nội</div>
        </div>
        <div class="header__cart flex item-center">
          <div class="header__cart--wraper round-full relative">
            <div class="header__cart--quantity absolute round-full bold">
              10
            </div>
          </div>
        </div>
      </div>
    </header>

    <div class="container w-1200 mx-auto">
      <nav class="flex justify-between bg-red">
        <div class="nav__item flex flex-col">
          <img src="/assets/images/laptop_white_new.webp" alt="" class="nav__item--image mx-auto" />
          <a href="#" class="nav__item--link">LAPTOP MỚI</a>
        </div>
        <div class="nav__item flex flex-col">
          <img src="/assets/images/laptop_white_new.webp" alt="" class="nav__item--image mx-auto" />
          <a href="#" class="nav__item--link">LAPTOP GAMING</a>
        </div>
        <div class="nav__item flex flex-col">
          <img src="/assets/images/laptop_white_new.webp" alt="" class="nav__item--image mx-auto" />
          <a href="#" class="nav__item--link">LAPTOP ĐỒ HỌA</a>
        </div>
        <div class="nav__item flex flex-col">
          <img src="/assets/images/laptop_white_new.webp" alt="" class="nav__item--image mx-auto" />
          <a href="#" class="nav__item--link">LAPTOP MỎNG NHẸ</a>
        </div>
        <div class="nav__item flex flex-col">
          <img src="/assets/images/laptop_white_new.webp" alt="" class="nav__item--image mx-auto" />
          <a href="#" class="nav__item--link">LAPTOP VĂN PHÒNG </a>
        </div>
        <div class="nav__item flex flex-col">
          <img src="/assets/images/laptop_white_new.webp" alt="" class="nav__item--image mx-auto" />
          <a href="#" class="nav__item--link">LAPTOP SURFACE </a>
        </div>
      </nav>

      <div class="product__detail">
        <div class="detail__container">
          <div class="detail__media">
            <div class="detail__media--src">
              <iframe class="detail-img 1 active" width='100%' height='100%'
                src='https://www.youtube.com/embed/kT3j7VjHgqw' frameborder='0' allowfullscreen></iframe>
              <img src="/assets/images/2463-laptopaz-hp-victus-15-1s-1.webp" alt="img" class="detail-img 2 active">
              <img src="/assets/images/2463-laptopaz-hp-victus-15-3.webp" alt="img" class="detail-img 3">
              <img src="/assets/images/2463-laptopaz-hp-victus-15-1s-1.webp" alt="img" class="detail-img 4">
              <img src="/assets/images/2463-laptopaz-hp-victus-15-3.webp" alt="img" class="detail-img 5">
            </div>
            <div class="detail__select">
              <div class="select__wrapper">
                <div onclick="handleChangeImg(this)" data-index="1" class="select-item">
                  <img src="/assets/images/iconVideo.png" alt="videoimg" class="select-item--img" />
                </div>
                <div onclick="handleChangeImg(this)" data-index="2" class="select-item active">

                  <img src="/assets/images/2463-laptopaz-hp-victus-15-1s-1.webp" alt="laptopimg"
                    class="select-item--img" />
                </div>
                <div onclick="handleChangeImg(this)" data-index="3" class="select-item">
                  <img src="/assets/images/2463-laptopaz-hp-victus-15-3.webp" alt="" class="select-item--img" />
                </div>

                <div onclick="handleChangeImg(this)" data-index="4" class="select-item">
                  <img src="/assets/images/2463-laptopaz-hp-victus-15-1s-1.webp" alt="" class="select-item--img" />
                </div>
                <div onclick="handleChangeImg(this)" data-index="5" class="select-item">
                  <img src="/assets/images/2463-laptopaz-hp-victus-15-3.webp" alt="" class="select-item--img" />
                </div>
              </div>
            </div>
          </div>
          <div class="detail__action">
            <div class="price-box">
              <div class="price-top"><span class="special-price">16.900.000Đ</span></div>
              <div class="price-bottom"><span class="old-price">Giá thị trường <del
                    class="old-price--value">21.000.000Đ</del>
                </span>
                <span class="save-price">Tiết kiệm <del class="save-prive--value">
                    4.900.000Đ
                  </del></span>
              </div>
            </div>
            <div class="status">
              <span class="status-title">Tình trạng: <del class="status-value">Còn hàng</del> </span>
            </div>
            <div class="warrant">
              <span class="warrant-title">CHỌN BẢO HÀNH:</span>
              <div class="warrant-list">
                <span onclick="handleWarrant(event)" class="warrant-item active">BH 12 THÁNG</span>
                <span onclick="handleWarrant(event)" class="warrant-item">BH 24 THÁNG</span>
              </div>
            </div>
            <div class="quan">
              <div class="quan__select">
                <span onclick="handleSub()" class="quan__select-sub">-</span>
                <input type="text" class="quan__select-value" value="1" />
                <span onclick="handleAdd()" class="quan__select-add">+</span>
              </div>
              <div class="addToCart">
                <button class="btnAddToCart">Mua Ngay</button>
              </div>
            </div>
            <div class="pay">
              <div class="pay-flash">
                <button class="btnPayFlash"><span class="pay-title-top">TRẢ GÓP 0%</span>
                  <span class="pay-title-bottom">Xét duyệt nhanh</span></button>
              </div>
              <div class="pay-online">
                <button class="btnPayOnline"><span class="pay-title-top">TRẢ GÓP ONLINE</span>
                  <span class="pay-title-bottom">Qua thẻ VISA, MASTER</span></button>
              </div>
            </div>
          </div>
          <div class="detail__contact">
            <div class="detail__contact-text">
              <p class="contact-header">GỌI NGAY ĐỂ CÓ GIÁ TỐT NHẤT</p>
              <p class="contact-content">- Laptopgame bao giá toàn thị trường</p>
              <p class="contact-header">QUÀ TẶNG VÀ KHUYẾN MẠI</p>
              <p class="contact-content">- Tặng balo,chuột,bàn di, trị giá 650k</p>
              <p class="contact-content">- Tặng win bản quyền theo máy</p>
              <p class="contact-content">- Tặng gói cài đặt và vệ sinh trọn đời</p>
              <p class="contact-content">- Tặng Voucher giảm giá 200k cho lần mua tiếp theo</p>
              <p class="contact-header">YÊN TÂM MUA HÀNG</p>
              <p class="contact-content">- Hệ thống mua bán laptop uy tín</p>
              <p class="contact-content">- Hàng chính hãng nguyên bản 100%</p>
              <p class="contact-content">- Lỗi đổi mới trong 15 ngày đầu</p>
              <p class="contact-content">- Trả góp lãi suất 0% qua thẻ visa</p>
              <p class="contact-content">- Free Ship Nội thành Hà Nội</p>
              <p class="contact-content">- Ship cod toàn quốc nhận hàng kiểm tra mới thanh toán</p>
            </div>
            <div class="detail__contact-hotline">
              <p class="contact-hotline--title">Gọi điện để được tư vấn:</p>
              <a class="contact-hotline--tel" href="tel:+8439929922">0963.446.199</a>
              <span>-</span>
              <a class="contact-hotline--tel" href="tel:+8439929922">0963.446.199</a>
            </div>
          </div>

        </div>
        <div class="detail__des">
          <div class="detail__des-content">
            <div class="tab-title">
              <span class="tab-title--text">MÔ TẢ</span>
            </div>
            <div class="des-contents">
              <div class="des-item">
                <p class="des-item--title">Đánh giá chi tiết Laptop Gaming HP Victus 15</p>
                <p class="des-item--text">Với thiết kế tinh tế, phần cứng hoàn thiện tuyệt vời, cấu hình hấp dẫn cùng
                  mức giá chỉ ở ngưỡng tầm trung; HP Victus 15 sẽ phù hợp với game thủ, người làm multimedia,… với hầu
                  bao vừa phải nhưng vẫn muốn có được trải nghiệm sát nhất có thể so với các sản phẩm cao cấp. </p>
              </div>
              <div class="des-item">
                <p class="des-item--title">Thiết kế đơn giản, mang âm hưởng từ dòng Omen cao cấp </p>
                <p class="des-item--text">Với vẻ ngoài vuông vắn cùng lớp sơn nhám Đen quen thuộc; HP Victus 15 dễ khiến
                  người ta liên tưởng tới các sản phẩm Omen ở phân khúc cao cấp. Nhưng nếu nhìn kỹ, không khó để thấy
                  rằng sản phẩm của chúng ta còn thú vị hơn vậy nhiều. Chẳng hạn như ở nắp máy, HP đã có một logo chữ V
                  bóng bẩy, tinh tế dành riêng cho dòng Victus. Hay phần khe thoát gió phía sau cũng được thiết kế lại,
                  tràn hẳn ra hai bên để tăng cường lưu thông khí.</p>
              </div>
              <div class="des-item">
                <p class="des-item--title">Thiết kế đơn giản, mang âm hưởng từ dòng Omen cao cấp </p>
                <p class="des-item--text">Với vẻ ngoài vuông vắn cùng lớp sơn nhám Đen quen thuộc; HP Victus 15 dễ khiến
                  người ta liên tưởng tới các sản phẩm Omen ở phân khúc cao cấp. Nhưng nếu nhìn kỹ, không khó để thấy
                  rằng sản phẩm của chúng ta còn thú vị hơn vậy nhiều. Chẳng hạn như ở nắp máy, HP đã có một logo chữ V
                  bóng bẩy, tinh tế dành riêng cho dòng Victus. Hay phần khe thoát gió phía sau cũng được thiết kế lại,
                  tràn hẳn ra hai bên để tăng cường lưu thông khí.</p>
              </div>
              <div class="des-item">
                <p class="des-item--title">Thiết kế đơn giản, mang âm hưởng từ dòng Omen cao cấp </p>
                <p class="des-item--text">Với vẻ ngoài vuông vắn cùng lớp sơn nhám Đen quen thuộc; HP Victus 15 dễ khiến
                  người ta liên tưởng tới các sản phẩm Omen ở phân khúc cao cấp. Nhưng nếu nhìn kỹ, không khó để thấy
                  rằng sản phẩm của chúng ta còn thú vị hơn vậy nhiều. Chẳng hạn như ở nắp máy, HP đã có một logo chữ V
                  bóng bẩy, tinh tế dành riêng cho dòng Victus. Hay phần khe thoát gió phía sau cũng được thiết kế lại,
                  tràn hẳn ra hai bên để tăng cường lưu thông khí.</p>
              </div>

              <div class="des-conclude">
                <span class="des-conclude--title">Kết luận: </span>
                <span class="des-conclude--text">HP Victus 15 là một trong những sự lựa chọn hàng đầu của dòng máy
                  Gaming. Sở hữu thiết kế mạnh mẽ nhưng cũng không kém phần tinh tế, kết hợp cùng cấu hình mạnh mẽ và
                  tản nhiệt mát mẻ, HP Victus 15 tự tin có thể chinh phục được đa số các Game Online, Offline thời
                  thượng hiện nay. Hơn thế nữa HP Victus 15 cũng đủ sức đáp ứng các tác vụ thiết kế đồ họa, công việc,
                  giải trí một cách mượt mà nhất. Hiện tại Game đang có những chương trình ưu đãi vô cùng tuyệt vời khi
                  khách hàng đặt mua HP Victus 15 ngay từ ngày hôm nay!</span>
              </div>

            </div>
          </div>
          <div class="detail__des-parameter">
            <div class="parameter-title">
              <span class="parameter-title--text">THÔNG SỐ KỸ THUẬT</span>
            </div>
            <div class="parameter-content">
              <table class="parameter-table" border="1px">
                <tr>
                  <td class="td-title">CPU</td>
                  <td class="td-value">Core i5 12450H (8 Core, 12 Threards, 12MB Cache, 3.30 GHz up to 4.40 GHz)</td>
                </tr>
                <tr>
                  <td class="td-title">CPU</td>
                  <td class="td-value">Core i5 12450H (8 Core, 12 Threards, 12MB Cache, 3.30 GHz up to 4.40 GHz)</td>
                </tr>
                <tr>
                  <td class="td-title">CPU</td>
                  <td class="td-value">Core i5 12450H (8 Core, 12 Threards, 12MB Cache, 3.30 GHz up to 4.40 GHz)</td>
                </tr>
                <tr>
                  <td class="td-title">CPU</td>
                  <td class="td-value">Core i5 12450H (8 Core, 12 Threards, 12MB Cache, 3.30 GHz up to 4.40 GHz)</td>
                </tr>
                <tr>
                  <td class="td-title">CPU</td>
                  <td class="td-value">Core i5 12450H (8 Core, 12 Threards, 12MB Cache, 3.30 GHz up to 4.40 GHz)</td>
                </tr>
                <tr>
                  <td class="td-title">CPU</td>
                  <td class="td-value">Core i5 12450H (8 Core, 12 Threards, 12MB Cache, 3.30 GHz up to 4.40 GHz)</td>
                </tr>
                <tr>
                  <td class="td-title">CPU</td>
                  <td class="td-value">Core i5 12450H (8 Core, 12 Threards, 12MB Cache, 3.30 GHz up to 4.40 GHz)</td>
                </tr>

              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
    <footer class="bg-white">
      <div class="footer__top w-1200 mx-auto flex justify-between">
        <div class="footer__info">
          <h1 class="footer__info--name mb-10">CÔNG TY TNHH BAI TAP LON</h1>
          <div class="mb-10">
            <h2 class="footer__info--title">Địa chỉ</h2>
            <span class="ml-5"> Số 96 Định Công, Q. Hoàng Mai, TP. Hà Nội</span>
          </div>
          <div class="mb-10">
            <h2 class="footer__info--title">Địa chỉ</h2>
            <span class="ml-5"> Số 96 Định Công, Q. Hoàng Mai, TP. Hà Nội</span>
          </div>
          <div class="mb-10">
            <h2 class="footer__info--title">Địa chỉ</h2>
            <span class="ml-5"> Số 96 Định Công, Q. Hoàng Mai, TP. Hà Nội</span>
          </div>
          <div class="mb-10">
            <h2 class="footer__info--title">Địa chỉ</h2>
            <span class="ml-5"> Số 96 Định Công, Q. Hoàng Mai, TP. Hà Nội</span>
          </div>
        </div>
        <div class="footer__info">
          <h1 class="footer__info--name mb-10">CÔNG TY TNHH BAI TAP LON</h1>
          <div class="mb-10">
            <h2 class="footer__info--title">Địa chỉ</h2>
            <span class="ml-5"> Số 96 Định Công, Q. Hoàng Mai, TP. Hà Nội</span>
          </div>
          <div class="mb-10">
            <h2 class="footer__info--title">Địa chỉ</h2>
            <span class="ml-5"> Số 96 Định Công, Q. Hoàng Mai, TP. Hà Nội</span>
          </div>
          <div class="mb-10">
            <h2 class="footer__info--title">Địa chỉ</h2>
            <span class="ml-5"> Số 96 Định Công, Q. Hoàng Mai, TP. Hà Nội</span>
          </div>
          <div class="mb-10">
            <h2 class="footer__info--title">Địa chỉ</h2>
            <span class="ml-5"> Số 96 Định Công, Q. Hoàng Mai, TP. Hà Nội</span>
          </div>
        </div>
        <div class="footer__info">
          <h1 class="footer__info--name mb-10">CÔNG TY TNHH BAI TAP LON</h1>
          <div class="mb-10">
            <h2 class="footer__info--title">Địa chỉ</h2>
            <span class="ml-5"> Số 96 Định Công, Q. Hoàng Mai, TP. Hà Nội</span>
          </div>
          <div class="mb-10">
            <h2 class="footer__info--title">Địa chỉ</h2>
            <span class="ml-5"> Số 96 Định Công, Q. Hoàng Mai, TP. Hà Nội</span>
          </div>
          <div class="mb-10">
            <h2 class="footer__info--title">Địa chỉ</h2>
            <span class="ml-5"> Số 96 Định Công, Q. Hoàng Mai, TP. Hà Nội</span>
          </div>
          <div class="mb-10">
            <h2 class="footer__info--title">Địa chỉ</h2>
            <span class="ml-5"> Số 96 Định Công, Q. Hoàng Mai, TP. Hà Nội</span>
          </div>
        </div>
      </div>

      <div class="footer__bottom">
        <div class="footer__copyright w-1200 mx-auto text-center">
          Đơn vị sở hữu: CÔNG TY TNHH BAI TAP LON, Trụ sở: Số 96 Định Công, Q.
          Hoàng Mai, TP. Hà Nội, SĐT: 0866.74.9999, Email:
          nguyenhuuvuno1@gmail.com, Giấy phép số: 0109771096,Ngày cấp:
          11/10/2021, Nơi cấp: Sở kế hoạch đầu tư TP Hà Nội | Cung cấp bởi Sapo
        </div>
      </div>
    </footer>
    <script src="/assets/ij/productDetailJs.js"></script>
  </body>

  </html>