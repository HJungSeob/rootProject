$(function () {
    $('#profileInput').change(setThumbnail);
    $('#Regionprofile').click(function(){
        $('#backBlur').fadeIn(400)
        $('#profileUpRegion').fadeIn(400)
    })

    $('#cancelBtn').click(function(){
        $('#backBlur').fadeOut(150)
        $('#profileUpRegion').fadeOut(150)
    })

    $('#nickNamebox').click(function(){
        $('#backBlur').fadeIn(150)
        $('#nickNameRegion').fadeIn(150)
    })

    $('#nickNamecancelBtn').click(function(){
        $('#backBlur').fadeOut(150)
        $('#nickNameRegion').fadeOut(150)
    })

    $('#nickNameInput').blur(function(){
        nickNamevalue()
    })
});

function nickNamevalue(){
    if($('#nickNameInput').val() !== ''){
        $('#nickNameInput').css("border", "1px solid #848484")
        $('#nickNameMsg').text("")
        $('#nickNamesubmitBtn').prop('disabled', false);
    }else{
        $('#nickNameMsg').text("입력 되어 있지 않습니다.")
        $('#nickNameInput').css("border", "1px solid #F74848")
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