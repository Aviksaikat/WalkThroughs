window.onload = () => {
    $('.fw-cam-radio').prop('checked', true);
    $('#allSelectRadio').prop('checked', true);

    $('#allSelectRadio').on('click', () => {
        if ($('#allSelectRadio').is(':checked')) {
            $('.fw-cam-radio').prop('checked', true);
            $('.fw-update-btn').prop('disabled', false);
        }
        else {
            $('.fw-cam-radio').prop('checked', false);
            $('.fw-update-btn').prop('disabled', true);
        }
    })
    $('.fw-cam-radio').change(() => {
        console.log($('.fw-cam-radio').is(':checked'))
        if ($('.fw-cam-radio').is(':checked')) {
            $('.fw-update-btn').prop('disabled', false);
        }
        else {
            $('.fw-update-btn').prop('disabled', true);
        }
    })

    $('.fw-update-btn').on('click', () => {
        $('.progress').progressBarTimer({
            timeLimit: 2400,
            autoStart: false,
            smooth: true,
            label: {
                show: true,
                type: 'percent'
            }
        }).start()

        var timer2 = "40:00"

        setInterval(function() {
            var timer = timer2.split(':');
            var minutes = parseInt(timer[0], 10);
            var seconds = parseInt(timer[1], 10);
            --seconds;
            minutes = (seconds < 0) ? --minutes : minutes;
            if (minutes < 0) clearInterval(interval);
            seconds = (seconds < 0) ? 59 : seconds;
            seconds = (seconds < 10) ? '0' + seconds : seconds;
            $('#countdown').html(`${minutes}:${seconds} Remaining ...`);
            timer2 = minutes + ':' + seconds;
          }, 1000);

        $('.fw-update-btn').prop('disabled', true);
        $('.fw-progress').slideDown();

        $('video').each(function(){
            $(this).html('<source src="/static/videos/static-noise.webm" type="video/webm"></source>');
            $(this).get(0).load();
            $(this).get(0).play();
        });

        $('.flag').prop('style', '');
    })
}



