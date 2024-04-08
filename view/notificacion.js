$(document).ready(function(){

    mostrar_notificacion();
    mostrar_punto();

});

function mostrar_notificacion(){

    var formData = new FormData();
    formData.append('usu_id',$('#user_idx').val());

    $.ajax({
        url: "../../controller/notificacion.php?op=mostrar",
        type: "POST",
        data: formData,
        contentType: false,
        processData: false,
        success: function(data){
            if (data==''){

            }else{
                data = JSON.parse(data);
                console.table(data.not_id);
                $.notify({
                    icon: 'glyphicon glyphicon-star',
                    message: data.not_mensaje,
                    url: "http://localhost/HelpDesk/view/detalleTicket/?ID="+data.tick_id
                });

                $.post("../../controller/notificacion.php?op=actualizar", {not_id : data.not_id, }, function (data) {

                });

                mostrar_punto();
            }
        }
    });

}

function mostrar_punto(){

    var formData = new FormData();
    formData.append('usu_id',$('#user_idx').val());

    $.ajax({
        url: "../../controller/notificacion.php?op=listar",
        type: "POST",
        data: formData,
        contentType: false,
        processData: false,
        success: function(data){
            data = JSON.parse(data);
            console.table(data);

            var element = document.getElementById("campanita");
            if (data.iTotalRecords != 0){                
                element.classList.add("active");
            } else {
                element.classList.remove("active");
            }
        }
    });

}

setInterval(function(){
    mostrar_notificacion();
}, 5000);


