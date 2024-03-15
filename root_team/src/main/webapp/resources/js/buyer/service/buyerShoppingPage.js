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
        $('#firstNameInput').css("border", "1px solid #0e7ff0")
    })

    $('#lastNameInput').focus(function () {
        $('#lastNameInput').css("border", "1px solid #0e7ff0")
    })

    $('#zonecodeInput').click(function(){
        execDaumPostcode()
    })
    $('#addressInput').click(function(){
        execDaumPostcode()
    })
    $('#zonecodeInput').focus(function () {
        $('#zonecodeInput').css("border", "1px solid #0e7ff0")
    })
    $('#addressInput').focus(function () {
        $('#addressInput').css("border", "1px solid #0e7ff0")
    })

    $('#plusAddressInput').focus(function () {
        $('#plusAddressInput').css("border", "1px solid #0e7ff0")
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
        $('#telInput').css("border", "1px solid #0e7ff0")
        })
    $('#telInput').blur(function () {
            $('#telInput').css("border", "")
        
    })
})