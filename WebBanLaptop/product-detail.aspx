<%@ Page Language="C#" MasterPageFile="~/Common.Master" AutoEventWireup="true" CodeBehind="product-detail.aspx.cs" Inherits="WebBanLaptop.product_detail"
  %>
<asp:Content ID="Header1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    <link rel="stylesheet" href="/assets/css/productDetailCss.css" />
    <link rel="stylesheet" href="/assets/css/modalCart.css" />

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product__detail">
      <div class="detail__container">
        <div class="detail__media">
          <div class="detail__media--src">
            <iframe class="detail-img 1" width='100%' height='100%'
              src='https://www.youtube.com/embed/kT3j7VjHgqw' frameborder='0' allowfullscreen></iframe>
            
              <asp:Image ID="ImageDetail" CssClass="detail-img 2 active" runat="server" />
            <img src="/assets/images/2463-laptopaz-hp-victus-15-3.webp" alt="img" class="detail-img 3">
            <img src="/assets/images/2463-laptopaz-hp-victus-15-1s-1.webp" alt="img" class="detail-img 4">
            <img src="/assets/images/2463-laptopaz-hp-victus-15-3.webp" alt="img" class="detail-img 5">
          </div>
          <div class="detail__select">
            <div class="select__wrapper">
              <div onclick="handleChangeImg(this)" data-index="1" class="select-item">
                <img src="/assets/images/iconVideo.png" alt="videoimg" class="select-item--img" />
              </div>
              <div onclick="handleChangeImg(this)" data-index="2" class="select-item  active">
              <asp:Image ID="ImageDetail2" CssClass="select-item--img" runat="server" />

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
          <div class="detail-price--box">
            <div class="detail-price--top"><span class="special-price" id="price" runat="server"/></div>
            <div class="detail-price--bottom"><span class="old-price">Giá thị trường <del
                  class="old-price--value" id="oldPrice" runat="server"/>
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
              <input type="text" class="quan__select-value" value="1" name="txtQuantity"/>
              <span onclick="handleAdd()" class="quan__select-add">+</span>
            </div>
            <div class="addToCart">
              <button class="btnAddToCart" onclick="showModal()">Mua Ngay</button>
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
              <p class="des-item--title">Đánh giá chi tiết <span class="des-item--title" id="name" runat="server"/>.</p>
              <p class="des-item--text"><%# Eval("Des") %> </p>
            </div>
            <div class="des-item">
              <p class="des-item--title">Thiết kế đơn giản, mang âm hưởng từ dòng Omen cao cấp </p>
              <p class="des-item--text">Với vẻ ngoài vuông vắn cùng lớp sơn nhám Đen quen thuộc; HP Victus 15 dễ khiến
                người ta liên tưởng tới các sản phẩm Omen ở phân khúc cao cấp. Nhưng nếu nhìn kỹ, không khó để thấy rằng
                sản phẩm của chúng ta còn thú vị hơn vậy nhiều. Chẳng hạn như ở nắp máy, HP đã có một logo chữ V bóng
                bẩy, tinh tế dành riêng cho dòng Victus. Hay phần khe thoát gió phía sau cũng được thiết kế lại, tràn
                hẳn ra hai bên để tăng cường lưu thông khí.</p>
            </div>
            <div class="des-item">
              <p class="des-item--title">Thiết kế đơn giản, mang âm hưởng từ dòng Omen cao cấp </p>
              <p class="des-item--text">Với vẻ ngoài vuông vắn cùng lớp sơn nhám Đen quen thuộc; HP Victus 15 dễ khiến
                người ta liên tưởng tới các sản phẩm Omen ở phân khúc cao cấp. Nhưng nếu nhìn kỹ, không khó để thấy rằng
                sản phẩm của chúng ta còn thú vị hơn vậy nhiều. Chẳng hạn như ở nắp máy, HP đã có một logo chữ V bóng
                bẩy, tinh tế dành riêng cho dòng Victus. Hay phần khe thoát gió phía sau cũng được thiết kế lại, tràn
                hẳn ra hai bên để tăng cường lưu thông khí.</p>
            </div>
            <div class="des-item">
              <p class="des-item--title">Thiết kế đơn giản, mang âm hưởng từ dòng Omen cao cấp </p>
              <p class="des-item--text">Với vẻ ngoài vuông vắn cùng lớp sơn nhám Đen quen thuộc; HP Victus 15 dễ khiến
                người ta liên tưởng tới các sản phẩm Omen ở phân khúc cao cấp. Nhưng nếu nhìn kỹ, không khó để thấy rằng
                sản phẩm của chúng ta còn thú vị hơn vậy nhiều. Chẳng hạn như ở nắp máy, HP đã có một logo chữ V bóng
                bẩy, tinh tế dành riêng cho dòng Victus. Hay phần khe thoát gió phía sau cũng được thiết kế lại, tràn
                hẳn ra hai bên để tăng cường lưu thông khí.</p>
            </div>

            <div class="des-conclude">
              <span class="des-conclude--title">Kết luận: </span>
              <span class="des-conclude--text">HP Victus 15 là một trong những sự lựa chọn hàng đầu của dòng máy Gaming.
                Sở hữu thiết kế mạnh mẽ nhưng cũng không kém phần tinh tế, kết hợp cùng cấu hình mạnh mẽ và tản nhiệt
                mát mẻ, HP Victus 15 tự tin có thể chinh phục được đa số các Game Online, Offline thời thượng hiện nay.
                Hơn thế nữa HP Victus 15 cũng đủ sức đáp ứng các tác vụ thiết kế đồ họa, công việc, giải trí một cách
                mượt mà nhất. Hiện tại Game đang có những chương trình ưu đãi vô cùng tuyệt vời khi khách hàng đặt mua
                HP Victus 15 ngay từ ngày hôm nay!</span>
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
                <td class="td-value" id="cpu" runat="server"></td>
              </tr>
              <tr>
                <td class="td-title">RAM</td>
                <td class="td-value" id="ram" runat="server"></td>
              </tr>
              <tr>
                <td class="td-title">Ổ cứng</td>
                <td class="td-value" id="gpu" runat="server"></td>
              </tr>
              <tr>
                <td class="td-title">Màn hình</td>
                <td class="td-value" id="screen" runat="server"></td>
              </tr>
              

            </table>
          </div>
        </div>
      </div>
    </div>
  
  <div class="modal-cart">
    <div class="wrapper-modal js-close">
      <div class="modal-header">Bạn đã thêm <span class="nameProd" id="nameHeaderModal" runat="server"/> vào giỏ hàng</div>
      <p class="modal-cart--total">Giỏ hàng của bạn có 1 sản phẩm</p>
      <table class="modal-cart--table">
        <tr class="table-header">
          <td class="tdFirst">Sản phẩm</td>
          <td>Đơn giá</td>
          <td>Số lượng</td>
          <td>Thành tiền</td>
        </tr>
        <tr>
          <td class="modal-prod--des">
              <asp:Image ID="Image" CssClass="img" runat="server" />
            <p id="nameModal" runat="server"></p>
          </td>
          <td><span class="modal-price" id="priceModal" runat="server"></span>Đ</td>
          <td>
            <div class="modal_quan__select">
              <span onclick="handleSub()" class="modal_quan__select-sub">-</span>
              <input type="text" class="modal_quan__select-value" value="1" />
              <span onclick="handleAdd()" class="modal_quan__select-add">+</span>
            </div>
          </td>
          <td><span class="modal-totalPrice1"></span>Đ</td>
        </tr>
      </table>
      <div class="totalPrice">
        <p class="price">Thành tiền: <span class="modal-totalPrice2"></span>Đ</p>
      </div>
      <div class="modal-btnAdd">
        <button class="btn-handle">Thanh toán đơn hàng</button>
      </div>
      <span class="close-modal" onclick="closeModal()">X</span>
    </div>
      </div>
</asp:Content>

<asp:Content ID="Script1" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
    <script src="/assets/js/productDetailJs.js" defer></script>
</asp:Content>