const $ = document.querySelector.bind(document);

const submit_request = () => {
    halloween_name = $('#halloween_name').value;
    email = $('#email').value;
    costume_type = $('#costume_type').value;
    trick_or_treat = $('#tricks').checked ? 'tricks' : 'treats';

    fetch('/api/submit', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            halloween_name,
            email,
            costume_type,
            trick_or_treat
        })
    })
    .then((res) => res.json())
    .then((data) => {
        $('#message').innerText = data.message;

        setTimeout(()=>{
            $('#message').innerText = '';    
        },3000)
    })

}

$('#form').addEventListener('submit', (event) => {
    event.preventDefault();

    submit_request();
})