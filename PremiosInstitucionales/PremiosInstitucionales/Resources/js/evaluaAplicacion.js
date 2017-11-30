$(document).ready(function () {
    var num = 10000;
    var total = 0;
    $(".addCalif").each(function (index) {
        var val = $(this).val();
        var por = $(this).data("porcentaje");
        por = por / 100;
        if (val != 0 && por != 0)
            total += val * por;
    });
    total = total * 10;
    $("#final").val(total);


    $(".addCalif").change(function (e) {
        e.preventDefault();
        var total = 0;
        $(".addCalif").each(function (index) {
            var val = $(this).val();
            var por = $(this).data("porcentaje");
            por = por / 100;
            if( val != 0 && por != 0)
                total += val * por;
        });
        total = total * 10;
        total = total.toFixed(2);

        if (total % 1 == 0) {
            total = Math.round(total);
        }

        $("#final").val(total);
    });


});