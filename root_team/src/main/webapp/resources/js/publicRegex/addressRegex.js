let sidoValid = false;
let sigunguValid = false;
let zonecodeValid = false;
let addressValid = false;

$(function () {
    $('#sidoInput').blur(function () {
        if (this.value.length !== 0) {
            $(function () {
                $('#sidoRegion').css("border", "1px solid #858585")
                $('#sigunguRegion').css("border", "1px solid #858585")
                $('#zonecodeRegion').css("border", "1px solid #858585")
                $('#addressRegion').css("border", "1px solid #858585")
                $('#sidoMsg').text("")
            });
            sidoValid = true
        } else {
            $(function () {
                $('#sidoRegion').css("border", "1px solid #F74848")
                $('#sidoMsg').text("입력 되어 있지 않습니다.")
            });
            sidoValid = false
        }
        try {
            addressdisable()
        } catch (Exception) {}
        try {
            globaldisable();
        } catch (Exception) {}
    });
    $('#sigunguInput').blur(function () {
        if (this.value.length !== 0) {
            $(function () {
                $('#sidoRegion').css("border", "1px solid #858585")
                $('#sigunguRegion').css("border", "1px solid #858585")
                $('#zonecodeRegion').css("border", "1px solid #858585")
                $('#addressRegion').css("border", "1px solid #858585")
                $('#sigunguMsg').text("")
            });
            sigunguValid = true
        } else {
            $(function () {
                $('#sigunguRegion').css("border", "1px solid #F74848")
                $('#sigunguMsg').text("입력 되어 있지 않습니다.")
            });
            sigunguValid = false
        }
        try {
            addressdisable()
        } catch (Exception) {}
        try {
            globaldisable();
        } catch (Exception) {}
    });
    $('#zonecodeInput').blur(function () {
        if (this.value.length !== 0) {
            $(function () {
                $('#sidoRegion').css("border", "1px solid #858585")
                $('#sigunguRegion').css("border", "1px solid #858585")
                $('#zonecodeRegion').css("border", "1px solid #858585")
                $('#addressRegion').css("border", "1px solid #858585")
                $('#zonecodeMsg').text("")
            });
            zonecodeValid = true
        } else {
            $(function () {
                $('#zonecodeRegion').css("border", "1px solid #F74848")
                $('#zonecodeMsg').text("입력 되어 있지 않습니다.")
            });
            zonecodeValid = false
        }
        try {
            addressdisable()
        } catch (Exception) {}
        try {
            globaldisable();
        } catch (Exception) {}
    });
    $('#addressInput').blur(function () {
        if (this.value.length !== 0) {
            $(function () {
                $('#sidoRegion').css("border", "1px solid #858585")
                $('#sigunguRegion').css("border", "1px solid #858585")
                $('#zonecodeRegion').css("border", "1px solid #858585")
                $('#addressRegion').css("border", "1px solid #858585")
                $('#addressMsg').text("")
            });
            addressValid = true
        } else {
            $(function () {
                $('#addressRegion').css("border", "1px solid #F74848")
                $('#addressMsg').text("입력 되어 있지 않습니다.")
            });
            addressValid = false
        }
        try {
            addressdisable()
        } catch (Exception) {}
        try {
            globaldisable();
        } catch (Exception) {}
    });
});