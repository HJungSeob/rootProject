$(function () {
    $('#main_region_buer').click(function () {
        $('#main_region_buer').fadeOut(400);
        $('#main_region_name').fadeOut(400);
        $('#m_userinfo_updatename_region_bday').fadeOut(400);
    });

    $('#m_userinfo_contentday').click(function () {
        $('#main_region_buer').fadeIn(400);
        $('#m_userinfo_updatename_region_bday').fadeIn(400);
    });

    $('#m_userinfo_contentname').click(function () {
        $('#main_region_buer').fadeIn(400);
        $('#main_region_name').fadeIn(400);
    });

    $('#firstNameInput').blur(function () {
        $('#firstNameRegion').css("border", "1px solid #858585")
        $('#firstNameRegion').css("boxShadow", "none")
        $('#firstNametitle').css("bottom", "20px")
        $('#firstNametitle').css("fontSize", "16px")
        updateNameStyle()
    });
    let firstNameInput = document.getElementById('firstNameInput')
    let firstNametitle = document.getElementById('firstNametitle')

    function updateNameStyle() {
        if (firstNameInput.value.trim() !== '') {
            firstNametitle.style.bottom = '30px';
            firstNametitle.style.fontSize = '14px';
        }
    }

    $('#firstNameInput').focus(function () {
        $('#firstNameRegion').css("border", "1px solid #0071E3'")
        $('#firstNameRegion').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#firstNametitle').css("bottom", "30px")
        $('#firstNametitle').css("fontSize", "14px")
    });

    $('#lastNameInput').blur(function () {
        $('#lastNameRegion').css("border", "1px solid #858585")
        $('#lastNameRegion').css("boxShadow", "none")
        $('#lastNametitle').css("bottom", "20px")
        $('#lastNametitle').css("fontSize", "16px")
        updateLnameStyle()
    });
    let lastNameInput = document.getElementById('lastNameInput')
    let lastNametitle = document.getElementById('lastNametitle')

    function updateLnameStyle() {
        if (lastNameInput.value.trim() !== '') {
            lastNametitle.style.bottom = '30px';
            lastNametitle.style.fontSize = '14px';
        }
    }

    $('#lastNameInput').focus(function () {
        $('#lastNameRegion').css("border", "1px solid #0071E3'")
        $('#lastNameRegion').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#lastNametitle').css("bottom", "30px")
        $('#lastNametitle').css("fontSize", "14px")
    });

    $('#yyyyinput').blur(function () {
        $('#yyyyregion').css("border", "1px solid #858585")
        $('#yyyyregion').css("boxShadow", "none")
        $('#yyyytext').css("bottom", "20px")
        $('#yyyytext').css("fontSize", "16px")
        $('#result').css("opacity", "0")
        updateYyyyStyle()
    });

    let yinput = document.getElementById('yyyyinput');
    let ytext = document.getElementById('yyyytext');

    function updateYyyyStyle() {
        if (yinput.value.trim() !== '') {
            ytext.style.bottom = '36px';
            ytext.style.fontSize = '14px';
            $('#result').css("opacity", "1")
        }
    }

    $('#yyyyinput').focus(function () {
        $('#yyyyregion').css("border", "1px solid #0071E3")
        $('#yyyyregion').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#yyyytext').css("bottom", "36px")
        $('#yyyytext').css("fontSize", "14px")
        $('#result').css("opacity", "1")
        updateYyyyStyle()
    });
})