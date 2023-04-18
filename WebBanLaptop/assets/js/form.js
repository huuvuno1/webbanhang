function submitFormRegister() {
    let error = document.getElementById("Label1");
    let username = document.getElementById("username").value;
    let password = document.getElementById("password").value;
    let fullname = document.getElementById("fullname").value;
    let confirmpassword = document.getElementById("confirm").value;

    if (fullname == "") {
        error.innerText = "Họ tên không được để trống!"
        document.getElementById("fullname").focus();
        return false;
    }
    if (username == "") {
        error.innerText = "Tên đăng nhập không được để trống!"
        document.getElementById("username").focus();
        return false;
    }
    if (password == "") {
        error.innerText = "Mật khẩu không được để trống!"
        document.getElementById("password").focus();
        return false
    }
    if (password) {
        if (password.length < 8) {
            error.innerText = "Mật khẩu phải nhiều hơn 8 ký tự!"
            document.getElementById("password").focus();
            return false;
        }
        re = /[0-9]/;
        if (!re.test(password)) {
            error.innerText = "Mật khẩu chứa ít nhất một chữ số!"
            document.getElementById("password").focus();
            return false;
        }
        re = /[a-z]/;
        if (!re.test(password)) {
            error.innerText = "Mật khẩu chứa ít nhất một chữ cái thường!"
            document.getElementById("password").focus();
            return false;
        }
        re = /[A-Z]/;
        if (!re.test(password)) {
            error.innerText = "Mật khẩu chứa ít nhất một chữ cái hoa!"
            document.getElementById("password").focus();
            return false;
        }
    }
    if (confirmpassword == "") {
        error.innerText = "Yêu cầu nhập xác nhận mật khẩu!"
        document.getElementById("confirm").focus();
        return false;
    }
    
    if (password != confirmpassword) {
        error.innerText = "Nhập lại mật khẩu không trùng nhau!"
        document.getElementById("confirm").focus();
        return false;
    }
}

function submitFormLogin() {
    let error = document.getElementById("Label1");
    let username = document.getElementById("username").value;
    let password = document.getElementById("password").value;

    if (username == "") {
        error.innerText = "Tên đăng nhập không được để trống!"
        document.getElementById("username").focus();
        return false;
    }
    if (password == "") {
        error.innerText = "Mật khẩu không được để trống!"
        document.getElementById("password").focus();
        return false
    }
}