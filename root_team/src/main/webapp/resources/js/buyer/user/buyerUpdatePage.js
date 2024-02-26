$(function () {
    $('#profileInput').change(setThumbnail);
    $('#Regionprofile').click(function(){
        $('#backBlur').fadeIn(400)
        $('#profileUpRegion').fadeIn(400)
    })

    $('#cancelBtn').click(function(){
        $('#backBlur').fadeOut(400)
        $('#profileUpRegion').fadeOut(400)
    })

    $('#nickNamebox').click(function(){
        $('#backBlur').fadeIn(400)
        $('#nickNameRegion').fadeIn(400)
    })

    $('#nickNamecancelBtn').click(function(){
        $('#backBlur').fadeOut(400)
        $('#nickNameRegion').fadeOut(400)
    })

    $('#nickNameInput').focus(function(){
        $('#nickNameTitle').css({"font-size":"12px", "margin-top": "-46px"})
    })

    $('#nickNameInput').blur(function(){
        $('#nickNameTitle').css({"font-size":"18px", "margin-top": "-36px"})
        nickNamevalue()
    })
});

function nickNamevalue(){
    if($('#nickNameInput').val() !== ''){
        $('#nickNameTitle').css({"font-size":"12px", "margin-top": "-46px"})
        $('#nickNameInputRegion').css("border", "1px solid #848484")
        $('#nickNameMsg').text("")
        $('#nickNamesubmitBtn').prop('disabled', false);
    }else{
        $('#nickNameMsg').text("입력 되어 있지 않습니다.")
        $('#nickNameInputRegion').css("border", "1px solid #F74848")
        $('#nickNamesubmitBtn').prop('disabled', true);
    }
}

function setThumbnail(event) {
    var reader = new FileReader();

    reader.onload = function (event) {
        var img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        $('#image_container').css('background-image', "url('" + event.target.result + "')");
        $('#profile1').hide();
    };

    reader.readAsDataURL(event.target.files[0]);
}