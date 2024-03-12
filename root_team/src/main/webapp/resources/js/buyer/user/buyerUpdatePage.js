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

    $('#nickNameInput').keyup(function(){
        nickNamevalue()
    })
    $('#nickNameInput').focus(function(){
        $('#nickNameInput').css("border", "1px solid #0071E3'")
        $('#nickNameInput').css("boxShadow", "0px 0px 4px 0px #0071e3")
    })
    
    $('#nickNameInput').blur(function () {
	if (this.value.length === 0) {
		$('#nickNameInput').css("border", "1px solid #F74848")
        $('#nickNameMsg').text("입력 되어 있지 않습니다.")
		$('#nickNamesubmitBtn').prop('disabled', true);
	}
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