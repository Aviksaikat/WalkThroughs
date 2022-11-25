tries = 8

$(document).on('click', '.card', function () {
    var attr = $(this).attr('turned');
    if (tries > 0 && typeof attr === 'undefined' || attr === false) {
        angle = Number($(this).attr("angle")) + 180;
        $(this).attr('turned', 'once');
        if ($.browser.webkit) {
            $(this).attr("angle", angle);
            $(this).css({ 'webkitTransition': '-webkit-transform 1.0s cubic-bezier(0,.75,.25,1)' });
            $(this).css({ 'webkitTransform': 'rotateY(' + angle + 'deg)' });
        } else if ($.browser.mozilla) {
            $(this).attr("angle", angle);
            $(this).css({ 'MozTransform': '-moz-transform 1.0s cubic-bezier(0,.75,.25,1)' });
            $(this).css({ 'MozTransform': 'rotateY(' + angle + 'deg)' });
        } else if ($.browser.msie) {
            $(this).attr("angle", angle);
            $(this).css({ 'msTransform': '-ms-transform 1.0s cubic-bezier(0,.75,.25,1)' });
            $(this).css({ 'msTransform': 'rotateY(' + angle + 'deg)' });
        } else if ($.browser.opera) {
            $(this).attr("angle", angle);
            $(this).css({ 'oTransform': '-o-transform 1.0s cubic-bezier(0,.75,.25,1)' });
            $(this).css({ 'oTransform': 'rotateY(' + angle + 'deg)' });
        }

        tries -= 1;
    }

});