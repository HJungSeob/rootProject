$(function () {
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
});