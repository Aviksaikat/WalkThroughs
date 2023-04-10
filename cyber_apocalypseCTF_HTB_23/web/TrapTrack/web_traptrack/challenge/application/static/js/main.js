$(document).ready(() => {
    $("#addRecordBtn").on('click', addRecord);
    $('#showFormBtn').on('click', () => {
        $('#addForm').slideDown();
        $('#trapList').slideUp();
    });
	$("#cancelBtn").on('click', function() {
        $('#addForm').slideUp();
        $('#trapList').slideDown();
	});
    loadTrackStatus();
});

const loadTrackStatus = async () => {

    $('tr').each(async (i, el) => {
        let track_id = $(el).find('td:eq(3)').text();

        if(!track_id) return;

        await fetch(`/api/tracks/${track_id}/status`, {
            method: 'GET',
            credentials: 'include'
        })
        .then((response) => response.json()
            .then((job_data) => {
                if (job_data.hasOwnProperty('job_id')) {
                    if (job_data['health'] == 1) {
                        $(el).find('td:eq(4)').html('<span class="health hgreen"></span>');
                    }
                    if (job_data['inprogress']) {
                        $(el).find('td:eq(2)').text('In Progress');
                    }
                    else {
                        $(el).find('td:eq(2)').text('Waiting');
                    }
                    if (job_data['completed']) {
                        $(el).find('td:eq(2)').text('Completed');
                    }
                }
                else {
                    $(el).find('td:eq(4)').html('<span class="health hgreen"></span>');
                    $(el).find('td:eq(2)').text('Completed');
                }
            }))
        .catch((error) => {
            console.log(error);
        });
    })

}

const toggleInputs = (state) => {
	$("#cancelBtn").prop("disabled", state);
	$("#addRecordBtn").prop("disabled", state);
}

const clearInputs = () => {
	$("#trapName").val("");
	$("#trapURL").val("");
}

const addRecord = async () => {

	toggleInputs(true);

	let card = $("#resp-msg");
	card.hide();


	let trapName = $("#trapName").val();
	let trapURL = $("#trapURL").val();

	if ($.trim(trapName) === '' || $.trim(trapURL) === '') {
		toggleInputs(false);
		card.text("Please fill out all the required fields!");
		card.attr("class", "alert alert-danger");
		card.show();
		return;
	}

	const data = {
		trapName,
		trapURL,
	};

	await fetch("/api/tracks/add", {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify(data),
		})
		.then((response) => response.json()
			.then((resp) => {
				if (response.status == 200) {
					card.text(resp.message);
					card.attr("class", "alert alert-success");
					card.show();
					window.setTimeout(function() {
						location.reload();
					}, 1000);
					return;
				}
				card.text(resp.message);
				card.attr("class", "alert alert-danger");
				card.show();
			}))
		.catch((error) => {
			card.text(error);
			card.attr("class", "alert alert-danger");
			card.show();
		});

	toggleInputs(false);
}

const delRecord = async (id) => {

	await fetch("/api/tracks/delete", {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({id}),
		})
		.then((response) => {
            location.reload();
        })
		.catch((error) => {
			console.log(error);
		});

}
