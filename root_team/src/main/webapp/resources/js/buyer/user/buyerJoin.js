$(function(){
    $('#telInput').blur(function(){
        $('#telRegion').css("border", "1px solid #858585")
        $('#telRegion').css("boxShadow", "none")
        $('#telTitle').css("bottom", "28px")
        $('#telTitle').css("fontSize", "20px")
        updateTelStyle()
    });

    let telTitle = document.getElementById('telTitle')
    let telInput = document.getElementById('telInput')

    function updateTelStyle() {
        if (telInput.value.trim() !== '') {
            telTitle.style.bottom = '50px';
            telTitle.style.fontSize = '16px';
        }
    }
    $('#telInput').focus(function(){
        $('#telRegion').css("border", "1px solid #0071E3")
        $('#telRegion').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#telTitle').css("bottom", "50px")
        $('#telTitle').css("fontSize", "16px")
    });

    $('#firstNameInput').blur(function(){
        $('#firstNameRegion').css("border", "1px solid #858585")
        $('#firstNameRegion').css("boxShadow", "none")
        $('#firstNametitle').css("bottom", "28px")
        $('#firstNametitle').css("fontSize", "20px")
        updateFirstNameStyle()
    });

    let firstNameInput = document.getElementById('firstNameInput')
    let firstNametitle = document.getElementById('firstNametitle')

    function updateFirstNameStyle() {
        if (firstNameInput.value.trim() !== '') {
            firstNametitle.style.bottom = '50px';
            firstNametitle.style.fontSize = '16px';
        }
    }
    $('#firstNameInput').focus(function(){
        $('#firstNameRegion').css("border", "1px solid #0071E3")
        $('#firstNameRegion').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#firstNametitle').css("bottom", "50px")
        $('#firstNametitle').css("fontSize", "16px")
    });

    $('#lastNameInput').blur(function(){
        $('#lastNameRegion').css("border", "1px solid #858585")
        $('#lastNameRegion').css("boxShadow", "none")
        $('#lastNametitle').css("bottom", "28px")
        $('#lastNametitle').css("fontSize", "20px")
        updateLastNameStyle()
    });

    let lastNameInput = document.getElementById('lastNameInput')
    let lastNametitle = document.getElementById('lastNametitle')

    function updateLastNameStyle() {
        if (lastNameInput.value.trim() !== '') {
            lastNametitle.style.bottom = '50px';
            lastNametitle.style.fontSize = '16px';
        }
    }
    $('#lastNameInput').focus(function(){
        $('#lastNameRegion').css("border", "1px solid #0071E3")
        $('#lastNameRegion').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#lastNametitle').css("bottom", "50px")
        $('#lastNametitle').css("fontSize", "16px")
    });

    $('#yyyyinput').blur(function(){
        $('#yyyyregion').css("border", "1px solid #858585")
        $('#yyyyregion').css("boxShadow", "none")
        $('#yyyytext').css("bottom", "28px")
        $('#yyyytext').css("fontSize", "20px")
        $('#result').css("opacity", "0")
        updateBirthdayStyle()
    });

    let yyyyinput = document.getElementById('yyyyinput');
    let yyyytext = document.getElementById('yyyytext');
    let result = document.getElementById('result')

    function updateBirthdayStyle() {
        if (yyyyinput.value.trim() !== '') {
            yyyytext.style.bottom = '50px';
            yyyytext.style.fontSize = '16px';
            result.style.opacity = '1'
        }
    }
    $('#yyyyinput').focus(function(){
        $('#yyyyregion').css("border", "1px solid #0071E3")
        $('#yyyyregion').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#yyyytext').css("bottom", "50px")
        $('#yyyytext').css("fontSize", "16px")
        $('#result').css("opacity", "1")
    });

    $('#emailInput').blur(function(){
        $('#emailRegion').css("border","1px solid #858585")
        $('#emailRegion').css("boxShadow","none")
        $('#emailTitle').css("bottom", "28px")
        $('#emailTitle').css("fontSize", "20px")
        updateEmailStyle()
    });

    let emailTitle = document.getElementById('emailTitle')
    let emailInput = document.getElementById('emailInput')

    function updateEmailStyle() {
        if (emailInput.value.trim() !== '') {
            emailTitle.style.bottom = '50px';
            emailTitle.style.fontSize = '16px';
        }
    }
    $('#emailInput').focus(function(){
        $('#emailTitle').css("bottom", "50px")
        $('#emailTitle').css("fontSize", "16px")
        $('#emailRegion').css("border","1px solid #0071E3")
        $('#emailRegion').css("boxShadow","0px 0px 4px 0px #0071e3")
    });

    $('#newPwInput').blur(function(){
        $('#newPwRegion').css("border","1px solid #858585")
        $('#newPwRegion').css("boxShadow","none")
        $('#passwordTitle').css("bottom", "28px")
        $('#passwordTitle').css("fontSize", "20px")
        updatePasswordStyle()
    });

    let passwordTitle = document.getElementById('passwordTitle')
    let newPwInput = document.getElementById('newPwInput')

    function updatePasswordStyle() {
        if (newPwInput.value.trim() !== '') {
            passwordTitle.style.bottom = '50px';
            passwordTitle.style.fontSize = '16px';
        }
    }
    $('#newPwInput').focus(function(){
        $('#passwordTitle').css("bottom", "50px")
        $('#passwordTitle').css("fontSize", "16px")
        $('#newPwRegion').css("border","1px solid #0071E3")
        $('#newPwRegion').css("boxShadow","0px 0px 4px 0px #0071e3")
    });

    $('#ckeckPwInput').blur(function(){
        $('#ckeckPwRegion').css("border","1px solid #858585")
        $('#ckeckPwRegion').css("boxShadow","none")
        $('#checkPasswordTitle').css("bottom", "28px")
        $('#checkPasswordTitle').css("fontSize", "20px")
        updateCheckPasswordStyle()
    });

    let checkPasswordTitle = document.getElementById('checkPasswordTitle')
    let ckeckPwInput = document.getElementById('ckeckPwInput')

    function updateCheckPasswordStyle() {
        if (ckeckPwInput.value.trim() !== '') {
            checkPasswordTitle.style.bottom = '50px';
            checkPasswordTitle.style.fontSize = '16px';
        }
    }
    $('#ckeckPwInput').focus(function(){
        $('#checkPasswordTitle').css("bottom", "50px")
        $('#checkPasswordTitle').css("fontSize", "16px")
        $('#ckeckPwRegion').css("border","1px solid #0071E3")
        $('#ckeckPwRegion').css("boxShadow","0px 0px 4px 0px #0071e3")
    });
});