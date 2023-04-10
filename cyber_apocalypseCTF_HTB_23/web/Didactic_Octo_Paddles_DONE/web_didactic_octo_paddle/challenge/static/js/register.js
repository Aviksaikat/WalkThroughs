const form = document.getElementById("form");
form.addEventListener("submit", (event) => {
    event.preventDefault();

    const data = {
        username: form.username.value,
        password: form.password.value,
    };

    fetch("/register", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify(data),
    })
        .then((response) => {
            if (response.ok) {
                return response.json();
            } else {
                return response.json().then((error) => {
                    throw new Error(error.message);
                });
            }
        })
        .then((data) => {
            const message = document.createElement("div");
            message.style.color = "#4BF38A";
            message.innerHTML = data.message;
            form.appendChild(message);
            setTimeout(() => {
                window.location.href = "/login";
            }, 1000);
        })
        .catch((error) => {
            const errorMessage = document.querySelector(".error-message");
            errorMessage.innerText = error.message;
            errorMessage.style.color = "red";
            setTimeout(() => {
                errorMessage.innerHTML = "";
                form.username.value = "";
                form.password.value = "";
            }, 1500);
        });
});
