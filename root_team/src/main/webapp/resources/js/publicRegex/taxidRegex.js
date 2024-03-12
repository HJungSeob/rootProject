let taxidValid = false;

function taxidLength(value) {
    return value.length >= 12 && value.length <= 12;
}

$(function () {

$('#taxidInput').blur(function () {
	if (this.value.length === 0) {
		$('#taxidInput').css("border", "1px solid #F74848")
        $('#taxidMsg').text("입력 되어 있지 않습니다.")
        taxidValid = false
        try {
		taxidCheckValid = false
        } catch (Exception) {}
	}
	});

    $('#taxidInput').keyup(function () {
        if (this.value.length !== 0) {
            if (taxidLength(this.value) === false) {
                $(function () {
                    $('#taxidInput').css("border", "1px solid #F74848")
                    $('#taxidMsg').text("번호가 유효하지 않습니다..")
                });
                taxidValid = false
            } else if(taxidCheckValid) {
                $(function () {
                    $('#taxidInput').css("border", "1px solid #858585")
                    $('#taxidMsg').text("")
                });
                taxidValid = true
            }
        } else {
            $(function () {
                $('#taxidInput').css("border", "1px solid #F74848")
                $('#taxidMsg').text("입력 되어 있지 않습니다.")
            });
            taxidValid = false
        }
        try {
            taxiddisable()
        } catch (Exception) {}
        try {
            globaldisable();
        } catch (Exception) {}
    });
});