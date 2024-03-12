let telValid = false;

function telLength(value) {
    return value.length >= 11 && value.length <= 13;
}

$(function () {
$('#telInput').blur(function () {
	if (this.value.length === 0) {
		$('#telInput').css("border", "1px solid #F74848")
        $('#telSmg').text("입력 되어 있지 않습니다.")
        telValid = false
        try {
		telCheckValid = false
        } catch (Exception) {}
	}
	});
    $('#telInput').keyup(function () {
        if (this.value.length !== 0) {
            if (telLength(this.value) === false) {
                    $('#telInput').css("border", "1px solid #F74848")
                    $('#telSmg').text("번호가 유효하지 않습니다.")
                    $('#active').css("height", "10px").delay(0.2)
                telValid = false
            } else if(telCheckValid){
                    $('#telInput').css("border", "1px solid #858585")
                    $('#telSmg').text("")
                    $('#active').css("height", "0px").delay(0.2)
                telValid = true
            }
        } else {
                $('#telInput').css("border", "1px solid #F74848")
                $('#telSmg').text("입력 되어 있지 않습니다.")
                $('#active').css("height", "10px").delay(0.2)
            telValid = false
        }
        try {
            teldisable()
        } catch (Exception) {}
        try {
            globaldisable();
        } catch (Exception) {}
    });
});