const login    = document.getElementById('login');
const response = document.getElementById('response');

login.addEventListener('submit', e => {

	e.preventDefault();

	fetch('/api/login', {
		method: 'POST',
		body: new URLSearchParams(new FormData(e.target))
	})
        .then(resp => resp.json())
        .then(data => {
            if (data.logged) {
                login.remove();
                response.innerHTML = data.message;
            } else {
                response.innerHTML = data.message;
            }
	});
});