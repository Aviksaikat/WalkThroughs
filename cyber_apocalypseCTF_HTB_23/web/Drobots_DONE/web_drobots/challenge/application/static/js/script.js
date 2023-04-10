const show_message = () => {
    $('.message').css('display', 'block')

    setTimeout(() => {
        $('.message').css('display', 'none')
    }, 10000)
}

const login = () => {
    let username = $('#username').val();
    let password = $('#password').val();

    if ($.trim(username) === '' || $.trim(password) === '') {
        show_message();
        return;
    }

    fetch('/api/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            'username': username,
            'password': password
        })
    })
    .then((res) => {
        if (res.status === 200) window.location.replace('/home');
        else show_message();
    });
}