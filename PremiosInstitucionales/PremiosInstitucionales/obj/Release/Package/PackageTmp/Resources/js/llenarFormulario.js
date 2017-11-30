$(document).ready(function () {
    $(".addRow").click(function (e) {
        var sub = $(this).data("sub");
        var idSaveRow = "#saveRow-" + sub;
        var ids = $(idSaveRow).data("rows");
        ids = ids.slice(0, -1);
        var numRows = ids.split(",");
        var tableid = "#table-" + sub;
        var rowCount = $(tableid + " tr").length;
        var rowToAppend = "<tr>"
        for (var x = 0; x < numRows.length; x++){
            rowToAppend += "<td><textarea name='"+sub+"' id='row" + rowCount + "-" + numRows[x] + "' cols='20' rows='8' ></textarea></td>";
        }
        rowToAppend += "</tr>";
        $(tableid + ' tr:last').after(rowToAppend);
    });

    $(".removeRow").click(function (e) {
        var sub = $(this).data("sub");
        var tableid = "#table-" + sub;
        if ($(tableid + " tr").length !== 2) {
            $(tableid +' tr:last').remove();
        }
    });
});
