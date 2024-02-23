$(function () {
    $('#firstNameInput').blur(function () {
        $('#firstNameRegion').css("border", "1px solid #858585")
        $('#firstNameRegion').css("boxShadow", "none")
        $('#firstNametitle').css("margin-top", "-42px")
        $('#firstNametitle').css("fontSize", "20px")
        updatefirstNameStyle()
    });

    let firstNametitle = document.getElementById('firstNametitle')
    let firstNameInput = document.getElementById('firstNameInput')
    $('#firstNameInput').on('propertychange change keyup paste input', updatefirstNameStyle);

    function updatefirstNameStyle() {
        if (firstNameInput.value.trim() !== '') {
            firstNametitle.style.marginTop = '-52px';
            firstNametitle.style.fontSize = '14px';
        } else {
            firstNametitle.style.marginTop = '-42px';
            firstNametitle.style.fontSize = '20px';
        }
    };

    $('#firstNameInput').focus(function () {
        $('#firstNameRegion').css("border", "1px solid #0071E3")
        $('#firstNameRegion').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#firstNametitle').css("margin-top", "-52px")
        $('#firstNametitle').css("fontSize", "14px")
    });

    $('#lastNameInput').blur(function () {
        $('#LastNameRegion').css("border", "1px solid #858585")
        $('#LastNameRegion').css("boxShadow", "none")
        $('#lastNametitle').css("margin-top", "-42px")
        $('#lastNametitle').css("fontSize", "20px")
        updatelastNameStyle()
    });

    let lastNametitle = document.getElementById('lastNametitle')
    let lastNameInput = document.getElementById('lastNameInput')
    $('#lastNameInput').on('propertychange change keyup paste input', updatelastNameStyle);

    function updatelastNameStyle() {
        if (lastNameInput.value.trim() !== '') {
            lastNametitle.style.marginTop = '-52px';
            lastNametitle.style.fontSize = '14px';
        } else {
            lastNametitle.style.marginTop = '-42px';
            lastNametitle.style.fontSize = '20px';
        }
    }
    $('#lastNameInput').focus(function () {
        $('#LastNameRegion').css("border", "1px solid #0071E3")
        $('#LastNameRegion').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#lastNametitle').css("margin-top", "-52px")
        $('#lastNametitle').css("fontSize", "14px")
    });

    $('#sidoInput').blur(function () {
        $('#sidoRegion').css("border", "1px solid #858585")
        $('#sidoRegion').css("boxShadow", "none")
        $('#sidoTitle').css("margin-top", "-42px")
        $('#sidoTitle').css("fontSize", "20px")
        $('#sigunguRegion').css("border", "1px solid #858585")
        $('#sigunguRegion').css("boxShadow", "none")
        $('#sigungutitle').css("margin-top", "-42px")
        $('#sigungutitle').css("fontSize", "20px")
        $('#zonecodeRegion').css("border", "1px solid #858585")
        $('#zonecodeRegion').css("boxShadow", "none")
        $('#zonecodetitle').css("margin-top", "-42px")
        $('#zonecodetitle').css("fontSize", "20px")
        $('#addressRegion').css("border", "1px solid #858585")
        $('#addressRegion').css("boxShadow", "none")
        $('#addresstitle').css("margin-top", "-42px")
        $('#addresstitle').css("fontSize", "20px")
        updatesidoStyle()
        updatesigunStyle()
        updatezonecodeStyle()
        updateaddressStyle()
    });

    let sidoTitle = document.getElementById('sidoTitle')
    let sidoInput = document.getElementById('sidoInput')
    $('#sidoInput').on('propertychange change keyup paste input', updatesidoStyle);

    function updatesidoStyle() {
        if (sidoInput.value.trim() !== '') {
            sidoTitle.style.marginTop = '-52px';
            sidoTitle.style.fontSize = '14px';
        } else {
            sidoTitle.style.marginTop = '-42px';
            sidoTitle.style.fontSize = '20px';
        }
    }
    $('#sidoInput').focus(function () {
        $('#sidoRegion').css("border", "1px solid #0071E3")
        $('#sidoRegion').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#sidoTitle').css("margin-top", "-52px")
        $('#sidoTitle').css("fontSize", "14px")
        $('#sigungutitle').css("margin-top", "-52px")
        $('#sigungutitle').css("fontSize", "14px")
        $('#zonecodetitle').css("margin-top", "-52px")
        $('#zonecodetitle').css("fontSize", "14px")
        $('#addresstitle').css("margin-top", "-52px")
        $('#addresstitle').css("fontSize", "14px")
    });

    $('#sigunguInput').blur(function () {
        $('#sidoRegion').css("border", "1px solid #858585")
        $('#sidoRegion').css("boxShadow", "none")
        $('#sidoTitle').css("margin-top", "-42px")
        $('#sidoTitle').css("fontSize", "20px")
        $('#sigunguRegion').css("border", "1px solid #858585")
        $('#sigunguRegion').css("boxShadow", "none")
        $('#sigungutitle').css("margin-top", "-42px")
        $('#sigungutitle').css("fontSize", "20px")
        $('#zonecodeRegion').css("border", "1px solid #858585")
        $('#zonecodeRegion').css("boxShadow", "none")
        $('#zonecodetitle').css("margin-top", "-42px")
        $('#zonecodetitle').css("fontSize", "20px")
        $('#addressRegion').css("border", "1px solid #858585")
        $('#addressRegion').css("boxShadow", "none")
        $('#addresstitle').css("margin-top", "-42px")
        $('#addresstitle').css("fontSize", "20px")
        updatesidoStyle()
        updatesigunStyle()
        updatezonecodeStyle()
        updateaddressStyle()
    });

    let sigungutitle = document.getElementById('sigungutitle')
    let sigunguInput = document.getElementById('sigunguInput')
    $('#sigunguInput').on('propertychange change keyup paste input', updatesigunStyle);

    function updatesigunStyle() {
        if (sigunguInput.value.trim() !== '') {
            sigungutitle.style.marginTop = '-52px';
            sigungutitle.style.fontSize = '14px';
        } else {
            sigungutitle.style.marginTop = '-42px';
            sigungutitle.style.fontSize = '20px';
        }
    }
    $('#sigunguInput').focus(function () {
        $('#sigunguRegion').css("border", "1px solid #0071E3")
        $('#sigunguRegion').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#sidoTitle').css("margin-top", "-52px")
        $('#sidoTitle').css("fontSize", "14px")
        $('#sigungutitle').css("margin-top", "-52px")
        $('#sigungutitle').css("fontSize", "14px")
        $('#zonecodetitle').css("margin-top", "-52px")
        $('#zonecodetitle').css("fontSize", "14px")
        $('#addresstitle').css("margin-top", "-52px")
        $('#addresstitle').css("fontSize", "14px")
    });

    $('#zonecodeInput').blur(function () {
        $('#sidoRegion').css("border", "1px solid #858585")
        $('#sidoRegion').css("boxShadow", "none")
        $('#sidoTitle').css("margin-top", "-42px")
        $('#sidoTitle').css("fontSize", "20px")
        $('#sigunguRegion').css("border", "1px solid #858585")
        $('#sigunguRegion').css("boxShadow", "none")
        $('#sigungutitle').css("margin-top", "-42px")
        $('#sigungutitle').css("fontSize", "20px")
        $('#zonecodeRegion').css("border", "1px solid #858585")
        $('#zonecodeRegion').css("boxShadow", "none")
        $('#zonecodetitle').css("margin-top", "-42px")
        $('#zonecodetitle').css("fontSize", "20px")
        $('#addressRegion').css("border", "1px solid #858585")
        $('#addressRegion').css("boxShadow", "none")
        $('#addresstitle').css("margin-top", "-42px")
        $('#addresstitle').css("fontSize", "20px")
        updatesidoStyle()
        updatesigunStyle()
        updatezonecodeStyle()
        updateaddressStyle()
    });

    let zonecodetitle = document.getElementById('zonecodetitle')
    let zonecodeInput = document.getElementById('zonecodeInput')
    $('#zonecodeInput').on('propertychange change keyup paste input', updatezonecodeStyle);

    function updatezonecodeStyle() {
        if (zonecodeInput.value.trim() !== '') {
            zonecodetitle.style.marginTop = '-52px';
            zonecodetitle.style.fontSize = '14px';
        } else {
            zonecodetitle.style.marginTop = '-42px';
            zonecodetitle.style.fontSize = '20px';
        }
    }
    $('#zonecodeInput').focus(function () {
        $('#zonecodeRegion').css("border", "1px solid #0071E3")
        $('#zonecodeRegion').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#sidoTitle').css("margin-top", "-52px")
        $('#sidoTitle').css("fontSize", "14px")
        $('#sigungutitle').css("margin-top", "-52px")
        $('#sigungutitle').css("fontSize", "14px")
        $('#zonecodetitle').css("margin-top", "-52px")
        $('#zonecodetitle').css("fontSize", "14px")
        $('#addresstitle').css("margin-top", "-52px")
        $('#addresstitle').css("fontSize", "14px")
    });

    $('#addressInput').blur(function () {
        $('#sidoRegion').css("border", "1px solid #858585")
        $('#sidoRegion').css("boxShadow", "none")
        $('#sidoTitle').css("margin-top", "-42px")
        $('#sidoTitle').css("fontSize", "20px")
        $('#sigunguRegion').css("border", "1px solid #858585")
        $('#sigunguRegion').css("boxShadow", "none")
        $('#sigungutitle').css("margin-top", "-42px")
        $('#sigungutitle').css("fontSize", "20px")
        $('#zonecodeRegion').css("border", "1px solid #858585")
        $('#zonecodeRegion').css("boxShadow", "none")
        $('#zonecodetitle').css("margin-top", "-42px")
        $('#zonecodetitle').css("fontSize", "20px")
        $('#addressRegion').css("border", "1px solid #858585")
        $('#addressRegion').css("boxShadow", "none")
        $('#addresstitle').css("margin-top", "-42px")
        $('#addresstitle').css("fontSize", "20px")
        updatesidoStyle()
        updatesigunStyle()
        updatezonecodeStyle()
        updateaddressStyle()
    });

    let addresstitle = document.getElementById('addresstitle')
    let addressInput = document.getElementById('addressInput')
    $('#addressInput').on('propertychange change keyup paste input', updateaddressStyle);

    function updateaddressStyle() {
        if (addressInput.value.trim() !== '') {
            addresstitle.style.marginTop = '-52px';
            addresstitle.style.fontSize = '14px';
        } else {
            addresstitle.style.marginTop = '-42px';
            addresstitle.style.fontSize = '20px';
        }
    }
    $('#addressInput').focus(function () {
        $('#addressRegion').css("border", "1px solid #0071E3")
        $('#addressRegion').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#sidoTitle').css("margin-top", "-52px")
        $('#sidoTitle').css("fontSize", "14px")
        $('#sigungutitle').css("margin-top", "-52px")
        $('#sigungutitle').css("fontSize", "14px")
        $('#zonecodetitle').css("margin-top", "-52px")
        $('#zonecodetitle').css("fontSize", "14px")
        $('#addresstitle').css("margin-top", "-52px")
        $('#addresstitle').css("fontSize", "14px")
    });

    $('#viewAddressInput').blur(function () {
        $('#viewAddressRegion').css("border", "1px solid #858585")
        $('#viewAddressRegion').css("boxShadow", "none")
        $('#viewAddresstitle').css("margin-top", "-42px")
        $('#viewAddresstitle').css("fontSize", "20px")
        updateaviewddressStyle()
    });

    let viewAddresstitle = document.getElementById('viewAddresstitle')
    let viewAddressInput = document.getElementById('viewAddressInput')

    function updateaviewddressStyle() {
        if (viewAddressInput.value.trim() !== '') {
            viewAddresstitle.style.marginTop = '-52px';
            viewAddresstitle.style.fontSize = '14px';
        }
    }
    $('#viewAddressInput').focus(function () {
        $('#viewAddressRegion').css("border", "1px solid #0071E3")
        $('#viewAddressRegion').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#viewAddresstitle').css("margin-top", "-52px")
        $('#viewAddresstitle').css("fontSize", "14px")
    });

    $('#deledit').click(function () {
        $('#mainRegion').fadeIn(200)
        $('#delRegion').fadeIn(600)
    });

    $('#mainRegion').click(function () {
        $('#mainRegion').fadeOut(600)
        $('#delRegion').fadeOut(200)
    });

    $('#teledit').click(function () {
        $('#mainRegion').fadeIn(200)
        $('#telMainRegion').fadeIn(600)
        $('#telMainRegion').css("display", "block")
    });

    $('#mainRegion').click(function () {
        $('#mainRegion').fadeOut(600)
        $('#telMainRegion').fadeOut(200)
    });

    $('#telInput').blur(function () {
        $('#telRegion').css("border", "1px solid #858585")
        $('#telRegion').css("boxShadow", "none")
        $('#telTitle').css("margin-top", "-42px")
        $('#telTitle').css("fontSize", "20px")
        updateatelStyle()
    });

    let telTitle = document.getElementById('telTitle')
    let telInput = document.getElementById('telInput')

    function updateatelStyle() {
        if (telInput.value.trim() !== '') {
            telTitle.style.marginTop = '-52px';
            telTitle.style.fontSize = '14px';
        } else {
            telTitle.style.marginTop = '-42px';
            telTitle.style.fontSize = '20px';
        }
    }
    $('#telInput').focus(function () {
        $('#telRegion').css("border", "1px solid #0071E3")
        $('#telRegion').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#telTitle').css("margin-top", "-52px")
        $('#telTitle').css("fontSize", "14px")
    });
})