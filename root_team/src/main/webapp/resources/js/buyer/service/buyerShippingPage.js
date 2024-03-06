$(function () {
    $('#defaultAddress').click(function () {
        $('#defaultAddress').css("border", "1px solid #0e7ff0")
        $('#newAddress').css("border", "1px solid #848484")
        $('#InputNewAddress').slideUp(400)
        $('.AInput').attr("disabled", false);
        $('.nAInput').attr("disabled", true);
    })
    $('#newAddress').click(function () {
        $('#newAddress').css("border", "1px solid #0e7ff0")
        $('#defaultAddress').css("border", "1px solid #848484")
        $('#InputNewAddress').slideDown(400)
        $('.nAInput').attr("disabled", false);
        $('.AInput').attr("disabled", true);
    })

    $('#cardRegion').click(function(){
        $('#cardRegion').css("border", "1px solid #0e7ff0")
    })

    $('#firstNameInput').focus(function () {
        $('#firstNameTitle').css({
            "margin-bottom": "30px",
            "font-size": "12px"
        })
        $('#firstNameRegion').css("border", "1px solid #0e7ff0")
    })
    $('#firstNameInput').blur(function () {
        if ($(this).val() !== '') {
            $('#firstNameTitle').css({
                "margin-bottom": "30px",
                "font-size": "12px"
            })
            $('#firstNameRegion').css("border", "1px solid #0e7ff0")
        } else {
            $('#firstNameTitle').css({
                "margin-bottom": "",
                "font-size": ""
            })
            $('#firstNameRegion').css("border", "")
        }
    })

    $('#lastNameInput').focus(function () {
        $('#lastNameTitle').css({
            "margin-bottom": "30px",
            "font-size": "12px"
        })
        $('#lastNameRegion').css("border", "1px solid #0e7ff0")
    })
    $('#lastNameInput').blur(function () {
        if ($(this).val() !== '') {
            $('#lastNameTitle').css({
                "margin-bottom": "30px",
                "font-size": "12px"
            })
            $('#lastNameRegion').css("border", "1px solid #0e7ff0")
        } else {
            $('#lastNameTitle').css({
                "margin-bottom": "",
                "font-size": ""
            })
            $('#lastNameRegion').css("border", "")
        }
    })

    $('#zonecodeInput').click(function(){
        execDaumPostcode()
    })
    $('#addressInput').click(function(){
        execDaumPostcode()
    })
    $('#zonecodeInput').focus(function () {
        $('#zonecodeTitle').css({
            "margin-bottom": "30px",
            "font-size": "12px"
        })
        $('#zonecodeRegion').css("border", "1px solid #0e7ff0")
        $('#addressTitle').css({
            "margin-bottom": "30px",
            "font-size": "12px"
        })
        $('#addressRegion').css("border", "1px solid #0e7ff0")
    })
    $('#zonecodeInput').blur(function () {
        if ($(this).val() !== '') {
            $('#zonecodeTitle').css({
                "margin-bottom": "30px",
                "font-size": "12px"
            })
            $('#zonecodeRegion').css("border", "1px solid #0e7ff0")
            $('#addressTitle').css({
                "margin-bottom": "30px",
                "font-size": "12px"
            })
            $('#addressRegion').css("border", "1px solid #0e7ff0")
        } else {
            $('#zonecodeTitle').css({
                "margin-bottom": "",
                "font-size": ""
            })
            $('#zonecodeRegion').css("border", "")
            $('#addressTitle').css({
                "margin-bottom": "",
                "font-size": ""
            })
            $('#addressRegion').css("border", "")
        }
    })

    $('#addressInput').focus(function () {
        $('#addressTitle').css({
            "margin-bottom": "30px",
            "font-size": "12px"
        })
        $('#addressRegion').css("border", "1px solid #0e7ff0")
    })
    $('#addressInput').blur(function () {
        if ($(this).val() !== '') {
            $('#addressTitle').css({
                "margin-bottom": "30px",
                "font-size": "12px"
            })
            $('#addressRegion').css("border", "1px solid #0e7ff0")
        } else {
            $('#addressTitle').css({
                "margin-bottom": "",
                "font-size": ""
            })
            $('#addressRegion').css("border", "")
        }
    })

    $('#plusAddressInput').focus(function () {
        $('#plusAddressTitle').css({
            "margin-bottom": "30px",
            "font-size": "12px"
        })
        $('#plusAddressRegion').css("border", "1px solid #0e7ff0")
    })
    $('#plusAddressInput').blur(function () {
        if ($(this).val() !== '') {
            $('#plusAddressTitle').css({
                "margin-bottom": "30px",
                "font-size": "12px"
            })
            $('#plusAddressRegion').css("border", "1px solid #0e7ff0")
        } else {
            $('#plusAddressTitle').css({
                "margin-bottom": "",
                "font-size": ""
            })
            $('#plusAddressRegion').css("border", "")
        }
    })

    $('#emailInput').focus(function () {
        $('#emailTitle').css({
            "margin-bottom": "30px",
            "font-size": "12px"
        })
        $('#emailRegion').css("border", "1px solid #0e7ff0")
    })
    $('#emailInput').blur(function () {
        if ($(this).val() !== '') {
            $('#emailTitle').css({
                "margin-bottom": "30px",
                "font-size": "12px"
            })
            $('#emailRegion').css("border", "1px solid #0e7ff0")
        } else {
            $('#emailTitle').css({
                "margin-bottom": "",
                "font-size": ""
            })
            $('#emailRegion').css("border", "")
        }
    })

    $('#telInput').focus(function () {
        $('#telTitle').css({
            "margin-bottom": "30px",
            "font-size": "12px"
        })
        $('#telRegion').css("border", "1px solid #0e7ff0")
    })
    $('#telInput').blur(function () {
        if ($(this).val() !== '') {
            $('#telTitle').css({
                "margin-bottom": "30px",
                "font-size": "12px"
            })
            $('#telRegion').css("border", "1px solid #0e7ff0")
        } else {
            $('#telTitle').css({
                "margin-bottom": "",
                "font-size": ""
            })
            $('#telRegion').css("border", "")
        }
    })
})