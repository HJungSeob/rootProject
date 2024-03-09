$(function () {
            var status = $('#status').text();
            if (status === "배송완료") {
                $('#statusBar').css("width", "100%");
                $('#statusle1').css("color", "")
                $('#statusle2').css("color", "")
                $('#statusle3').css("color", "")
                $('#statusle4').css("color", "#111111")
                $('#review').fadeIn(400)
                $('#review').css("opacity", "1")
            } else if (status === "배송중") {
                $('#statusBar').css("width", "65%");
                $('#statusle1').css("color", "")
                $('#statusle2').css("color", "")
                $('#statusle3').css("color", "#111111")
                $('#statusle4').css("color", "")
                $('#review').fadeOut(400)
                $('#review').css("opacity", "")
            } else if (status === "배송준비") {
                $('#statusBar').css("width", "35%");
                $('#statusle1').css("color", "")
                $('#statusle2').css("color", "#111111")
                $('#statusle3').css("color", "")
                $('#statusle4').css("color", "")
                $('#review').fadeOut(400)
                $('#review').css("opacity", "")
            } else {
                $('#statusBar').css("width", "0%");
                $('#statusle1').css("color", "#111111")
                $('#statusle2').css("color", "")
                $('#statusle3').css("color", "")
                $('#statusle4').css("color", "")
                $('#review').fadeOut(400)
                $('#review').css("opacity", "")
            }
        })