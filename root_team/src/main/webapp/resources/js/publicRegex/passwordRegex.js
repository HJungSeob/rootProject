let exPwValid = true; //에이작스 중복검사 만들고 false 만들기
let newPwValid = false;
let ckeckPwValid = false;

function checkPwLength(value) {
    return value.length >= 8
}

function checkpwva(str) {
    return /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,}$/.test(str)
}
$(function () {
try {
$('#existingPwInput').blur(function () {
	if (this.value.length === 0) {
		$('#existingPwInput').css("border", "1px solid #F74848")
        $('#existingPwMsg').text("입력 되어 있지 않습니다.")
        duplicatePw = false
	}
	});
} catch (Exception) {}

$('#newPwInput').blur(function () {
	if (this.value.length === 0) {
		$('#newPwInput').css("border", "1px solid #F74848")
        $('#newPwMsg').text("입력 되어 있지 않습니다.")
        newPwValid = false
	}
	 try {
            globaldisable();
        } catch (Exception) {}
});

    $('#newPwInput').keyup(function () {
        if (this.value.length !== 0) {
            if (checkPwLength(this.value) === false) {
                $(function () {
                    $('#newPwInput').css("border", "1px solid #F74848")
                    $('#newPwMsg').text("암호 길이는 최소 8자 이상입니다.")
                });
                newPwValid = false
            } else if (checkpwva(this.value) === false) {
                $(function () {
                    $('#newPwInput').css("border", "1px solid #F74848")
                    $('#newPwMsg').text("암호는 대소문자,숫자,특수문자 포함입니다.")
                });
                newPwValid = false
            } else if (checkPwLength(this.value) && checkpwva(this.value)) {
                newPwValid = true
                $('#newPwInput').css("border", "1px solid #848484")
                    $('#newPwMsg').text("")
            }
        } else {
            $(function () {
                $('#newPwInput').css("border", "1px solid #F74848")
                $('#newPwMsg').text("입력 되어 있지 않습니다.")
            });
            newPwValid = false
        }
        try {
            globaldisable();
        } catch (Exception) {}
        try {
            updatePwDisable()
        } catch (Exception) {}
    });

$('#ckeckPwInput').blur(function () {
	if (this.value.length === 0) {
		$('#ckeckPwInput').css("border", "1px solid #F74848")
        $('#ckeckPwMsg').text("입력 되어 있지 않습니다.")
        ckeckPwValid = false
	}
	 try {
            globaldisable();
        } catch (Exception) {}
});

    $('#ckeckPwInput').keyup(function () {
        if (this.value.length !== 0) {
            if ($('#newPwInput').val() !== $('#ckeckPwInput').val()) {
                $(function () {
                    $('#ckeckPwInput').css("border", "1px solid #F74848")
                    $('#ckeckPwMsg').text("암호가 일치하지 않습니다.")
                });
                ckeckPwValid = false
            } else {
                ckeckPwValid = true
                $('#ckeckPwInput').css("border", "1px solid #848484")
                    $('#ckeckPwMsg').text("")
            }
        } else {
            $(function () {
                $('#ckeckPwInput').css("border", "1px solid #F74848")
                $('#ckeckPwMsg').text("입력 되어 있지 않습니다.")
            });
            ckeckPwValid = false
        }
        try {
            globaldisable();
        } catch (Exception) {}
        try {
            updatePwDisable()
        } catch (Exception) {}
    });

    function updatePwDisable() {
        if (exPwValid && newPwValid && ckeckPwValid) {
            pwSubmit.disabled = false
            $('#ckeckSubmit').css("background-color", "#0071e3")
        } else {
            pwSubmit.disabled = true
            $('#ckeckSubmit').css("background-color", "#80befb")
        }
    }
})