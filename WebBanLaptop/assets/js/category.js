const filtersMap = {};
const categoryMap = {
    "laptop-moi": "LAPTOP MỚI",
    "laptop-gaming": "LAPTOP GAMING",
    "laptop-do-hoa": "LAPTOP ĐỒ HỌA",
    "laptop-mong-nhe": "LAPTOP MỎNG NHẸ",
    "laptop-van-phong": "LAPTOP VĂN PHÒNG",
    "laptop-surface": "LAPTOP SURFACE"
};

(function () {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    for (const key of urlParams.keys()) {
        filtersMap[key] = urlParams.get(key);
    }

    if (filtersMap["type"]) {
        document.getElementById("breadcrumb").innerText = categoryMap[filtersMap["type"]]
    }
    else if (filtersMap["brands"]) {
        document.getElementById("breadcrumb").innerText = `LAPTOP ${filtersMap["brands"].toUpperCase()}`
    }
})();

// { orderBy, sortBy, limit = 20, brandName, priceRange } : options
function requestFilterProduct(options) {
    // change url
    const url = new URL(location);
    Object.keys(filtersMap).forEach(key => {
        url.searchParams.set(key, filtersMap[key]);
    })
    history.pushState({}, "", url);

    // call api
    const xhr = new XMLHttpRequest()
    xhr.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            const listProductsHtml = xhr.responseText.split('|')[0];
            const listPagingHtml = xhr.responseText.split('|')[1];
            document.getElementById('list__products').innerHTML = listProductsHtml;
            document.getElementById('paging').innerHTML = listPagingHtml;
        }
    }
    const uri = new URLSearchParams(options).toString()
    xhr.open('get', '/Api/FilterProduct.aspx?' + uri)
    xhr.send()
}

document.addEventListener('DOMContentLoaded', function () {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const categoryType = urlParams.get("type");
    if (categoryType)
        filtersMap["type"] = categoryType;


    const brands = document.querySelectorAll('input[name="brand"]');
    brands.forEach(doc => {
        // add event
        doc.addEventListener('change', () => {
            const checkedList = []
            brands.forEach(brand => brand.checked && checkedList.push(brand.value))
            filtersMap["brands"] = checkedList;
            requestFilterProduct(filtersMap)
        })

        // set value
        if (filtersMap["brands"]?.includes(doc.value)) {
            doc.checked = true;
        }
    })


    document.querySelectorAll('input[name="sortBy"]').forEach(doc => {
        // add event
        doc.addEventListener('change', (e) => {
            filtersMap["sortBy"] = e.target.value
            requestFilterProduct(filtersMap)
        })

        // set value
        if (filtersMap["sortBy"] === doc.value) {
            doc.checked = true;
        }
    })

    const priceRanges = document.querySelectorAll('input[name="priceRange"]');
    priceRanges.forEach(doc => {
        // add event
        doc.addEventListener('change', (e) => {
            const checkedList = []
            priceRanges.forEach(item => item.checked && checkedList.push(item.value))
            filtersMap["priceRange"] = checkedList
            requestFilterProduct(filtersMap)
        })

        // set value
        if (filtersMap["priceRange"]?.includes(doc.value)) {
            doc.checked = true;
        }
    })


    requestFilterProduct(filtersMap);
})


function gotoPage(page) {
    filtersMap["pageNum"] = page;
    requestFilterProduct(filtersMap);
}