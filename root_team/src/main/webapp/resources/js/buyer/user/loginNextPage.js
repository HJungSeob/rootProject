$(function () {
    $('#nextPage').click(function () {
        $('#joinPage1').fadeOut(100, function () {
            $('#mainLog').css({
                "transition": "width 0.4s, height 0.4s",
                "width": "140px",
                "height": "140px",
                "margin-bottom": "600px"
            });
            setTimeout(function () {
            	$('#mainLog').css("margin-bottom", "600px")
            }, 400);
            
            setTimeout(function () {
                $('#joinPage2').fadeIn(400);
                $('#mainLog').css("margin-bottom", "0px")
            }, 400);
        });
    });
});