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
        $('#firstNameInput').css("border", "1px solid #858585")
        $('#firstNameInput').css("boxShadow", "none")
    });

    $('#firstNameInput').focus(function () {
        $('#firstNameInput').css("border", "1px solid #0071E3'")
        $('#firstNameInput').css("boxShadow", "0px 0px 4px 0px #0071e3")
    });

    $('#lastNameInput').blur(function () {
        $('#lastNameInput').css("border", "1px solid #858585")
        $('#lastNameInput').css("boxShadow", "none")
    });

    $('#lastNameInput').focus(function () {
        $('#lastNameInput').css("border", "1px solid #0071E3'")
        $('#lastNameInput').css("boxShadow", "0px 0px 4px 0px #0071e3")
    });

    $('#yyyyinput').blur(function(){
        $('#yyyyinput').css("border", "1px solid #858585")
        $('#yyyyinput').css("boxShadow", "none")
        $('#result').css("opacity", "0")
        updateBirthdayStyle()
    });

    let result = document.getElementById('result')

    function updateBirthdayStyle() {
        if (yyyyinput.value.trim() !== '') {
            result.style.opacity = '1'
        }
    }
    $('#yyyyinput').focus(function(){
        $('#yyyyinput').css("border", "1px solid #0071E3")
        $('#yyyyinput').css("boxShadow", "0px 0px 4px 0px #0071e3")
        $('#result').css("opacity", "1")
    });
    
    $('#genderBox').click(function(){
            $('#main_region_buer').fadeIn(400)
            $('#genderRegion').fadeIn(400)
        })
        $('#main_region_buer').click(function(){
            $('#main_region_buer').fadeOut(400)
            $('#genderRegion').fadeOut(400)
        })
})