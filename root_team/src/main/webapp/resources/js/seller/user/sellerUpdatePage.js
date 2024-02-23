function globaldisable(){
    if(sellerTitleValid){
        upSellerSubmit.disabled = false
    }else{
        upSellerSubmit.disabled = true
    }
}

function globaldisable(){
    if(exPwValid && newPwValid && ckeckPwValid){
        upPwSubmit.disabled = false
    }else{
        upPwSubmit.disabled = true
    }
}

let sellerTitleValid = false

$(function(){
    $('#sellerTitleInput').blur(function(){
        if(this.value.length !== 0){
            sellerTitleValid = true
            $('#sellerTitleMsg').text("")
        }else{
            sellerTitleValid = false
            $('#sellerTitleMsg').text("이름이 있어야 합니다.")
        }
        try {
            globaldisable()
        } catch (error) {}
    });

    $('#updatePwBtn').click(function(){
        $('#updatePwPage').fadeIn(400);
        $('#cancelPwBtn').fadeIn(0);
        $('#updatePwBtn').fadeOut(0);
    });

    $('#cancelPwBtn').click(function(){
        $('#updatePwPage').fadeOut(400);
        $('#cancelPwBtn').fadeOut(0);
        $('#updatePwBtn').fadeIn(0);
    });

    $('#updateAddBtn').click(function(){
        $('#updateAddPage').fadeIn(400);
        $('#cancelAddBtn').fadeIn(0);
        $('#updateAddBtn').fadeOut(0);
        execDaumPostcode()
    });

    $('#cancelAddBtn').click(function(){
        $('#updateAddPage').fadeOut(400);
        $('#cancelAddBtn').fadeOut(0);
        $('#updateAddBtn').fadeIn(0);
        $('#addressInput').val('');
        $('#zonecodeInput').val('');
    });
});