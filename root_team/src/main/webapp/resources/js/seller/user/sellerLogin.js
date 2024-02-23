$(function () {
    $('#emailInput').blur(function () {
        $('#emailRegion').css("border", "1px solid #858585")
        $('#emailRegion').css("boxShadow", "none")
        $('#emailTitle').css("bottom", "20px")
        $('#emailTitle').css("fontSize", "16px")
        $('#emailArrowSmall').css("margin-top", "18px")
        $('#emailArrowSmall').css("filter",
            "invert(61%) sepia(0%) saturate(1%) hue-rotate(158deg) brightness(85%) contrast(87%)"
            )
        updateIdStyle()
    });
    let emailInput = document.getElementById('emailInput')
    let emailTitle = document.getElementById('emailTitle')
    let emailArrowSmall = document.getElementById('emailArrowSmall')

    function updateIdStyle() {
        if (emailInput.value.trim() !== '') {
            emailTitle.style.bottom = '34px';
            emailTitle.style.fontSize = '10px';
            emailArrowSmall.style.marginTop = '28px';
            emailArrowSmall.style.filter =
                'invert(28%) sepia(98%) saturate(1518%) hue-rotate(194deg) brightness(94%) contrast(106%)';
        }
    }

    $('#emailInput').focus(function () {
        $('#emailRegion').css("border", "1px solid #0071E3'")
        $('#emailRegion').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#emailTitle').css("bottom", "34px")
        $('#emailTitle').css("fontSize", "10px")
        $('#emailArrowSmall').css("margin-top", "28px")
    });

    $('#emailInput').on('input', function () {
        if ($(this).val().trim() !== '') {
            $('#emailArrowSmall').css("filter",
                "invert(28%) sepia(98%) saturate(1518%) hue-rotate(194deg) brightness(94%) contrast(106%)"
                );
        } else {
            $('#emailArrowSmall').css("filter", "invert(28%) sepia(98%) saturate(1518%) hue-rotate(194deg) brightness(94%) contrast(106%)");
        }
    });

    $('#pwInput').blur(function () {
        $('#pwRegion').css("border", "1px solid #858585")
        $('#pwRegion').css("boxShadow", "none")
        $('#pwTitle').css("bottom", "20px")
        $('#pwTitle').css("fontSize", "16px")
        $('#pwArrowSmall').css("margin-top", "18px")
        $('#pwArrowSmall').css("filter",
            "invert(61%) sepia(0%) saturate(1%) hue-rotate(158deg) brightness(85%) contrast(87%)"
            )
        updateCodeStyle()
    });
    let pwInput = document.getElementById('pwInput')
    let pwTitle = document.getElementById('pwTitle')
    let pwArrowSmall = document.getElementById('pwArrowSmall')

    function updateCodeStyle() {
        if (pwInput.value.trim() !== '') {
            pwTitle.style.bottom = '34px';
            pwTitle.style.fontSize = '10px';
            pwArrowSmall.style.marginTop = '28px';
            pwArrowSmall.style.filter =
                'invert(28%) sepia(98%) saturate(1518%) hue-rotate(194deg) brightness(94%) contrast(106%)';
        }
    }

    $('#pwInput').focus(function () {
        $('#pwRegion').css("border", "1px solid #0071E3'")
        $('#pwRegion').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#pwTitle').css("bottom", "34px")
        $('#pwTitle').css("fontSize", "10px")
        $('#pwArrowSmall').css("margin-top", "28px")
    });

    $('#pwInput').on('input', function () {
        if ($(this).val().trim() !== '') {
            $('#pwArrowSmall').css("filter",
                "invert(28%) sepia(98%) saturate(1518%) hue-rotate(194deg) brightness(94%) contrast(106%)"
                );
        } else {
            $('#pwArrowSmall').css("filter", "invert(28%) sepia(98%) saturate(1518%) hue-rotate(194deg) brightness(94%) contrast(106%)");
        }
    });
});