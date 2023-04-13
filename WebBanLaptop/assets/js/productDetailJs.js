const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

// chose warrant

const warrantList = $$(".warrant-item");

const handleWarrant = (e) => {
  warrantList.forEach((item) => {
    item.classList.remove("active");
  });
  e.target.classList.add("active");
};
//  handle sub

const valueQuan = $(".quan__select-value");

const handleSub = () => {
  var sum = valueQuan.value;

  if (valueQuan.value > 1) {
    sum--;
    valueQuan.value = sum;
  } else {
    valueQuan.value = 1;
  }
};

const handleAdd = () => {
  var sum = valueQuan.value;

  sum++;
  valueQuan.value = sum;
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
