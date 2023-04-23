const filtersMap = {}

// { orderBy, sortBy, limit = 20, brandName, priceRange } : options
function requestFilterProduct(options) {
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
        doc.addEventListener('change', () => {
            const checkedList = []
            brands.forEach(brand => brand.checked && checkedList.push(brand.value))
            filtersMap["brands"] = checkedList;
            requestFilterProduct(filtersMap)
        })
    })


    document.querySelectorAll('input[name="sortBy"]').forEach(doc => {
        doc.addEventListener('change', (e) => {
            filtersMap["sortBy"] = e.target.value
            requestFilterProduct(filtersMap)
        })
    })

    const priceRanges = document.querySelectorAll('input[name="priceRange"]');
    priceRanges.forEach(doc => {
        doc.addEventListener('change', (e) => {
            const checkedList = []
            priceRanges.forEach(item => item.checked && checkedList.push(item.value))
            filtersMap["priceRange"] = checkedList
            requestFilterProduct(filtersMap)
        })
    })


    requestFilterProduct(filtersMap);
})


function gotoPage(page) {
    filtersMap["pageNum"] = page;
    requestFilterProduct(filtersMap);
}