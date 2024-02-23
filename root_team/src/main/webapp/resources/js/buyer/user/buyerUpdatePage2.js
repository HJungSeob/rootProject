$(function () {
    $('#emailInput').blur(function () {
        $('#emailRegion').css("border", "1px solid #858585")
        $('#emailRegion').css("boxShadow", "none")
        $('#emailTitle').css("bottom", "20px")
        $('#emailTitle').css("fontSize", "16px")
        updateEmailStyle()
    });

    let emailTitle = document.getElementById('emailTitle')
    let emailInput = document.getElementById('emailInput')

    function updateEmailStyle() {
        if (emailInput.value.trim() !== '') {
            emailTitle.style.bottom = '30px';
            emailTitle.style.fontSize = '14px';
        }
    }

    $('#emailInput').focus(function () {
        $('#emailRegion').css("border", "1px solid #0071E3")
        $('#emailRegion').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#emailTitle').css("bottom", "30px")
        $('#emailTitle').css("fontSize", "14px")
        updateEmailStyle()
    });

    $('#m_userinfosclo_updatename_region_buer').click(function () {
        $('#m_userinfosclo_updatename_region_buer').fadeOut(400)
        $('#m_userinfosclo_updatename_region_name').fadeOut(400)
        $('#m_userinfosclo_updatename_region_bday').fadeOut(400)
    });

    $('#m_userinfosclo_contentday').click(function () {
        $('#m_userinfosclo_updatename_region_buer').fadeIn(400)
        $('#m_userinfosclo_updatename_region_bday').fadeIn(400)
    });

    $('#m_userinfosclo_contentname').click(function () {
        $('#m_userinfosclo_updatename_region_buer').fadeIn(400)
        $('#m_userinfosclo_updatename_region_name').fadeIn(400)
    });

    $('#telInput').blur(function () {
        $('#telRegion').css("border", "1px solid #858585")
        $('#telRegion').css("boxShadow", "none")
        $('#telTitle').css("bottom", "20px")
        $('#telTitle').css("fontSize", "16px")
        updateLnameStyle()
    });

    let name2 = document.getElementById('telTitle')
    let inname2 = document.getElementById('telInput')

    function updateLnameStyle() {
        if (inname2.value.trim() !== '') {
            name2.style.bottom = '30px';
            name2.style.fontSize = '14px';
        }
    }

    $('#telInput').focus(function () {
        $('#telRegion').css("border", "1px solid #0071E3")
        $('#telRegion').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#telTitle').css("bottom", "30px")
        $('#telTitle').css("fontSize", "14px")
    });

    $('#exPwInput').blur(function () {
        $('#exPwRegion').css("border", "1px solid #858585")
        $('#exPwRegion').css("boxShadow", "none")
        $('#exPwTitle').css("bottom", "20px")
        $('#exPwTitle').css("fontSize", "16px")
        PwStyle()
    });

    $('#exPwInput').focus(function () {
        $('#exPwRegion').css("border", "1px solid #0071e3")
        $('#exPwRegion').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#exPwTitle').css("bottom", "36px")
        $('#exPwTitle').css("fontSize", "14px")
    });

    $('#newPwInput').blur(function () {
        $('#newPwRegion').css("border", "1px solid #858585")
        $('#newPwRegion').css("boxShadow", "none")
        $('#newPwTitle').css("bottom", "20px")
        $('#newPwTitle').css("fontSize", "16px")
        PwStyle()
    });

    $('#newPwInput').focus(function () {
        $('#newPwRegion').css("border", "1px solid #0071e3")
        $('#newPwRegion').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#newPwTitle').css("bottom", "36px")
        $('#newPwTitle').css("fontSize", "14px")
    });

    $('#ckeckPwInput').blur(function () {
        $('#ckeckPwRegion').css("border", "1px solid #858585")
        $('#ckeckPwRegion').css("boxShadow", "none")
        $('#ckeckPwTitle').css("bottom", "20px")
        $('#ckeckPwTitle').css("fontSize", "16px")
        PwStyle()
    });

    $('#ckeckPwInput').focus(function () {
        $('#ckeckPwRegion').css("border", "1px solid #0071e3")
        $('#ckeckPwRegion').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#ckeckPwTitle').css("bottom", "36px")
        $('#ckeckPwTitle').css("fontSize", "14px")
    });

    let exPwInput = document.getElementById('exPwInput');
    let exPwTitle = document.getElementById('exPwTitle');
    let newPwInput = document.getElementById('newPwInput');
    let newPwTitle = document.getElementById('newPwTitle');
    let ckeckPwInput = document.getElementById('ckeckPwInput');
    let ckeckPwTitle = document.getElementById('ckeckPwTitle');

    function PwStyle() {
        if (ckeckPwInput.value.trim() !== '') {
            ckeckPwTitle.style.bottom = '36px';
            ckeckPwTitle.style.fontSize = '14px';
        }
        if (newPwInput.value.trim() !== '') {
            newPwTitle.style.bottom = '36px';
            newPwTitle.style.fontSize = '14px';
        }
        if (exPwInput.value.trim() !== '') {
            exPwTitle.style.bottom = '36px';
            exPwTitle.style.fontSize = '14px';
        }
    }
});