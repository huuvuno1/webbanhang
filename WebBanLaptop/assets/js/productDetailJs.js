function requestUpdateCart(id, quantity, type) {
    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById('cart_rows').innerHTML = xhr.responseText.split('|')[0];
            document.getElementById('sumMoney').innerHTML = xhr.responseText.split('|')[1];
            document.getElementById('countCart').innerHTML = xhr.responseText.split('|')[2];
        }
    }

    xhr.open(type ? 'GET' : 'POST', '/Api/UpdateCart.aspx');
    const form = new FormData();
    form.append("product_id", id);
    form.append("quantity", quantity);
    xhr.send(form);
}

// display num of quantity cart
requestUpdateCart(null, null, 'GET')

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);
const totalPrice1 = $(".modal-totalPrice1");
const wapperModal = $(".js-close");
const modal = $(".modal-cart");
const warrantList = $$(".warrant-item");

const handleWarrant = (e) => {
  warrantList.forEach((item) => {
    item.classList.remove("active");
  });
  e.target.classList.add("active");
};
//  handle sub
const valueQuan = $(".quan__select-value");
const valueQuanModal = $(".modal_quan__select-value");

const handleSub = (_this) => {
    const id = _this.parentNode.querySelector('.quan__row_modal').value;
    const quantity = +_this.parentNode.querySelector('.modal_quan__select-value').value;
    requestUpdateCart(id, quantity - 1);
};

const handleAdd = (_this) => {
    const id = _this.parentNode.querySelector('.quan__row_modal').value;
    const quantity = +_this.parentNode.querySelector('.modal_quan__select-value').value;
    requestUpdateCart(id, quantity + 1);
};

// choose media

const media = $$(".detail-img");
const mediaSelect = $$(".select-item");

const handleChangeImg = (e) => {
  mediaSelect.forEach((item) => {
    item.classList.remove("active");
  });

  e.classList.add("active");

  media.forEach((item2) => {
    item2.classList.remove("active");
    media.forEach((item3) => {
      if (item3.classList.contains(e.dataset.index)) {
        item3.classList.add("active");
      }
    });
  });
};

////////modal js///////////
const showModal = () => {
    modal.classList.add("active");
    const value = document.getElementById('quantity').value;
    const id = document.querySelector('.ContentPlaceHolder1_product_id').value;
    requestUpdateCart(id, value);

    document.getElementById('nameProductAddToCart').innerText = document.getElementById('ContentPlaceHolder1_productName').innerText;
};
const closeModal = () => {
    modal.classList.remove("active");
};

modal.addEventListener("click", () => {
  closeModal();
});
wapperModal.addEventListener("click", (event) => {
  event.stopPropagation();
});


document.querySelector('.quan__select-value').addEventListener('keydown', (e) => {
    const isNumber = /^[0-9]$/i.test(event.key)
    if (!isNumber && e.key !== 'Backspace') {
        e.preventDefault();
    }
})

document.querySelector('.quan__select-value').addEventListener('change', e => {
    if (e.target.value.length === 0) {
        e.target.value = '1'
    }
})

function handleChangeQuantity(num) {
    const inp = document.querySelector('.quan__select-value');
    if (+inp.value + num <= 0) {
        inp.value = 1;
        return;
    }
    inp.value = +inp.value + num;
}

function handleValidateInput(e) {
    const event = window.event;
    const isNumber = /^[0-9]$/i.test(event.key)
    if (!isNumber && event.key !== 'Backspace') {
        event.preventDefault();
    }
}

function handleModalQuantityChange(_this) {
    if (_this.value.length === 0) {
        _this.value = 1;
    }
    const id = _this.parentNode.querySelector('.quan__row_modal').value;
    requestUpdateCart(id, _this.value)
}

document.getElementById('cartBtn').addEventListener('click', () => {
    modal.classList.add("active");
    requestUpdateCart(null, null, 'GET')
})