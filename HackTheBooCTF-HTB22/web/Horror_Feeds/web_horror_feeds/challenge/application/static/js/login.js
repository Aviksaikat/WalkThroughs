function toggleInputs(state) {
	$("#username").prop("disabled", state);
	$("#password").prop("disabled", state);
	$("#login-btn").prop("disabled", state);
}


async function auth(intent) {

	toggleInputs(true);

	let card = $("#resp-msg");
	card.attr("class", "alert alert-info");
	card.hide();

	let user = $("#username").val();
	let pass = $("#password").val();
	if ($.trim(user) === '' || $.trim(pass) === '') {
		toggleInputs(false);
		card.text("Please input email and password first!");
		card.attr("class", "alert alert-danger");
		card.show();
		return;
	}

	const data = {
		username: user,
		password: pass
	};

	await fetch(`/api/${intent}`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify(data),
		})
		.then((response) => response.json()
			.then((resp) => {
				card.attr("class", "alert alert-danger");
				if (response.status == 200 && intent == "login") {
					card.attr("class", "alert alert-success");
					window.location.href = '/dashboard';
                    return;
				}
				else if(response.status == 200){
					card.text(resp.message);
					card.attr("class", "alert alert-success");
					card.show();
					return;
				}
				card.text(resp.message);
				card.show();
			}))
		.catch((error) => {
			card.text(error);
			card.attr("class", "alert alert-danger");
			card.show();
		});

	toggleInputs(false);
}