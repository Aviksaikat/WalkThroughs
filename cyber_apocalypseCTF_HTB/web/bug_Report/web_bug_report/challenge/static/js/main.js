const form = document.getElementById("form");
const search = document.getElementById("search");
const alerts = document.getElementById('alerts');

const flash = (message, level) => {
    alerts.innerHTML += `
        <div class="alert alert-${level}" role="alert">
            <p id="closeAlert" class="close" data-dismiss="alert" aria-label="Close"></p>
            <strong>${message}</strong>
        </div>
    `;
};

if (form) {
    form.addEventListener("submit", e => {
        e.preventDefault();

        fetch("/api/submit", {
            method: "POST",
            body: JSON.stringify({
                url: url.value
            }),
            headers: {
                "Content-Type": "application/json"
            }
        })
        .then(resp => resp.json())
        .then(data => {
            if (data.success) {
                flash(data.message, "success");
                
                setTimeout(() => {
                    document.getElementById("closeAlert").click();
                }, 2800);
                
            } else {

                flash(data.message, "danger");
                    
                setTimeout(() => {
                    document.getElementById("closeAlert").click();
                }, 2800);
            }
        })
    })
}