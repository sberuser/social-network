var ajaxUrl = "ajax/profile/home/";
var dataTableApi;

function updateTable() {
    $.ajax({
        type: "GET",
        url: ajaxUrl,
        data: $().serialize()
    }).done(updateTableByData);
}

// http://api.jquery.com/jQuery.ajax/#using-converters
$.ajaxSetup({
    converters: {
        "text json": function (stringData) {
            var json = JSON.parse(stringData);
            $(json).each(function () {
                this.dateTime = this.dateTime.replace('T', ' ').substr(0, 16);
            });
            return json;
        }
    }
});

$(function () {
    dataTableApi = $('#dataTable').DataTable(extendsOpts({
        "columns": [
            {
                "render": selectArticle,
                "defaultContent": "",
                "orderable": false
            },
            {
                "data": "name"
            },
            {
                "data": "dateTime"
            },
            {
                "render": renderEditBtn,
                "defaultContent": "",
                "orderable": false
            },
            {
                "render": renderDeleteBtn,
                "defaultContent": "",
                "orderable": false
            }
        ],
        "order": [
            [
                2,
                "desc"
            ]
        ],
        "createdRow": function (row, data, dataIndex) {
            $(row).addClass('item');
        }
    }));
});

function makeEditable() {
    form = $('#detailsForm');
    $(document).ajaxError(function (event, jqXHR, options, jsExc) {});

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
}

https://api.jquery.com/jquery.extend/#jQuery-extend-deep-target-object1-objectN
function extendsOpts(opts) {
    $.extend(true, opts,
        {
            "ajax": {
                "url": ajaxUrl,
                "dataSrc": ""
            },
            "paging": false,
            "info": true,
            "language": {
                "search": "Искать по статьям"
            },
            "initComplete": makeEditable
        }
    );
    return opts;
}

function add() {
    $("#modalTitle").html("Добавление новой статьи");
    form.find(":input").val("");
    $("#editRow").modal();
}

function updateRow(id) {
    $("#modalTitle").html("Редактирование вашей статьи");
    $.get(ajaxUrl + id, function (data) {
        $.each(data, function (key, value) {
            form.find("textarea[name='" + key + "']").val(value);
        });
        $('#editRow').modal();
    });
}

function deleteRow(id) {
    $.ajax({
        url: ajaxUrl + id,
        type: "DELETE"
    })
        .done(function () {
            updateTable();
        });
}

function selectRow(id) {
    document.location.href = "article/"+id;
}

function updateTableByData(data) {
    dataTableApi.clear().rows.add(data).draw();
}

function save() {
    $.ajax({
        type: "POST",
        url: ajaxUrl,
        data: form.serialize()
    }).done(function () {
        $("#editRow").modal("hide");
        updateTable();
    });
}

function renderEditBtn(data, type, row) {
    if (type === "display") {
        return "<a onclick='updateRow(" + row.id + ");'>" +
            "<span class='glyphicon glyphicon-edit' aria-hidden='true'></span></a>";
    }
}

function renderDeleteBtn(data, type, row) {
    if (type === "display") {
        return "<a onclick='deleteRow(" + row.id + ");'>" +
            "<span class='glyphicon glyphicon-trash' aria-hidden='true'></span></a>";
    }
}

function selectArticle(data, type, row) {
    if (type === "display") {
        return "<a onclick='selectRow(" + row.id + ");'>" +
            "<span class='glyphicon glyphicon-eye-open' aria-hidden='true'></span></a>";
    }
}