const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);
const totalPrice1 = $(".modal-totalPrice1");
const totalPrice2 = $(".modal-totalPrice2");
const wapperModal = $(".js-close");
const modal = $(".modal-cart");
const priceProd = +$(".modal-price").innerText;
// chose warrant
var totalPrice = priceProd;
totalPrice1.innerText = totalPrice;
totalPrice2.innerText = totalPrice;

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

const handleSub = () => {
  var sum = valueQuan.value;

  if (valueQuan.value > 1) {
    sum--;
    valueQuan.value = sum;
    valueQuanModal.value = sum;
    totalPrice = priceProd * sum;
    console.log(totalPrice);
    totalPrice1.innerText = totalPrice;
    totalPrice2.innerText = totalPrice;
  } else {
    valueQuan.value = 1;
  }
};

const handleAdd = () => {
  var sum = valueQuan.value;

  sum++;
  valueQuan.value = sum;
  valueQuanModal.value = sum;
  totalPrice = priceProd * sum;
  console.log(totalPrice);
  totalPrice1.innerText = totalPrice;
  totalPrice2.innerText = totalPrice;
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
