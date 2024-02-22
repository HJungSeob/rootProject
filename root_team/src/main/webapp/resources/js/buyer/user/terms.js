$(function(){
    termsValid = false
    $('#terms').click(function(){
        if($(this).prop('checked')){
            termsValid = true;
        } else {
            termsValid = false;
        }
        try {
            globaldisable();
        } catch (Exception) {}
    });
})