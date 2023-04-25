function validateForm() {
    const keys = ["fullname", "email", "phoneNumber", "address"]
    const formData = document.forms.form
    const form = new FormData(formData)
    let flag = true;
    //for (const key of form.keys()) {
    //    if (!form.get(key)) {
    //        (document.querySelector(`[data-msg="${key}"]`) || {}).innerHTML = "* Bạn phải nhập thông tin này";
    //        flag = false;
    //    }
    //    console.log(key, form.get(key))
    //}

    keys.forEach(key => {
        if (!form.get(key)) {
            (document.querySelector(`[data-msg="${key}"]`) || {}).innerHTML = "* Bạn phải nhập thông tin này";
            flag = false;
        }
    })
    return flag;
}