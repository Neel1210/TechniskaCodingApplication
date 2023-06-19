let userid, password;

function connectUser() {


    userid = $("#email").val();
    password = $(":password").val();

    if (validate() === false) {
        Swal.fire(
            'Try Again !',
            'All fields are mandatory',
            'error'
        )
    } else {
        let data = { userid: userid, password: password };
        let xhr = $.post("LoginControllerServlet", data, (responseText) => {
            if (responseText.trim() === 'error') {
                Swal.fire(
                    'Access Denied !',
                    'Try Again !!!',
                    'error'
                );
                setTimeout(()=>{
                    window.location = "accessdenied1.jsp"; 
                },1500);
                return;
            } else if (responseText.trim().indexOf("jsessionid") !== -1) {
                Swal.fire(
                    'Success !!',
                    'Login Successful !!!',
                    'success'
                );
                setTimeout(redirectUser(responseText), 2500);
                return;
            } else {
                Swal.fire(
                    'Access Denied !!!',
                    'Some problem occurred:' + responseText,
                    'error'
                )
                return;
            }
        }).always(() => swal.close());
        xhr.fail(handleError);
    }


}

function processResponse(responseText) {
    if (responseText.trim() === 'error') {
        Swal.fire(
            'Access Denied !',
            'Try Again !!!',
            'error'
        );
        setTimeout(()=>{
            window.location = "accessdenied1.jsp"; 
        },1500);
        return;
    } else if (responseText.trim().indexOf("jsessionid") !== -1) {
        Swal.fire(
            'Success !!',
            'Login Successful !!!',
            'success'
        );
        setTimeout(redirectUser(responseText), 2000);
        return;
    } else {
        Swal.fire(
            'Access Denied !!!',
            'Some problem occurred:' + responseText,
            'error'
        )
        return;
    }
}

function handleError(xhr) {
    Swal.fire(
        'Try Again !',
        'Problem in server communication: ' + xhr.statusText,
        'error'
    )
    return;
}

function validate() {
    if (userid === "" || password === "") {
        return false;
    }
    return true;
}

function redirectUser(responseText) {
    window.location = responseText.trim();
    return;
    //setTimeout((responseText)=>{ window.location = responseText.trim(); },4000);
}

function accessDenied() {
    window.location = "accessdenied1.jsp";
    return;
}