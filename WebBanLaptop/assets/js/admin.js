const iconOpen = document.querySelector(".iconOpen")

function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    iconOpen.style.display = "none"

}
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    iconOpen.style.display = "block"

}