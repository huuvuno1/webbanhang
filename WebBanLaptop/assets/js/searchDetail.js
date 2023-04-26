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
