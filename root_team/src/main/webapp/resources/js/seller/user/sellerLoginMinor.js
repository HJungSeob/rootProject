$(function () {
    $('#emailArrowSmall').click(function () {
        if ($('#taxidInput').val().trim() !== '') {
            $('#pwRegion').css("opacity", "1");
            $('#emailRegion').css("borderRadius", "10px 10px 0px 0px");
        }
    });

    $('#taxidInput').on('input', function () {
        if ($(this).val().trim() === '') {
            $('#pwRegion').css("opacity", "0");
            $('#emailRegion').css("borderRadius", "10px");
            $('#pwInput').val(null);
        }
    });

    $(document).ready(function () {
        $('#taxidInput, #pwInput').on('input', function () {
            var emailInputValue = $('#taxidInput').val().trim();
            var pwInputValue = $('#pwInput').val().trim();

            if (emailInputValue !== '' && pwInputValue !== '') {
                $('#loginSubmit').prop('disabled', false);
            } else {
                $('#loginSubmit').prop('disabled', true);
            }
        });
    });
});