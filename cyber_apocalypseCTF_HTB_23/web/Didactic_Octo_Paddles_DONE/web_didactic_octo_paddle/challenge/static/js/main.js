const buttons = document.querySelectorAll(".add-to-cart-btn");
buttons.forEach((button) => {
    button.addEventListener("click", () => {
        const itemId = button.dataset.item;

        let url = `/add-to-cart/${itemId}`;
        let method = "POST";
        let buttonText = "Remove from Cart";
        let removeClass = "btn-primary";
        let addClass = "btn-danger";

        if (button.textContent === "Remove from Cart") {
            url = `/remove-from-cart/${itemId}`;
            method = "POST";
            buttonText = "Add to Cart";
            removeClass = "btn-danger";
            addClass = "btn-primary";
        }

        fetch(url, {
            method: method,
            headers: {
                "Content-Type": "application/json",
            },
            credentials: "same-origin",
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
                button.textContent = buttonText;
                button.classList.remove(removeClass);
                button.classList.add(addClass);

                const message = document.createElement("div");
                message.style.color = "green";
                message.innerHTML = data.message;
                button.parentNode.appendChild(message);
                setTimeout(() => {
                    message.remove();
                }, 1500);
            })
            .catch((error) => {
                console.error(error);
                const message = document.createElement("div");
                message.style.color = "red";
                message.innerHTML = error.message;
                button.parentNode.appendChild(message);
                setTimeout(() => {
                    message.remove();
                }, 1500);
            });
    });
});
