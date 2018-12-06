$(document).ready(function() {

    // Etat masqué du menu dropdown par défaut
$('#delivery_form').hide();

$('#order_delivery_method_bike').on('click', function() {
       $('#delivery_form').show()
})

$('#order_delivery_method_pickup').on('click', function() {
    $('#delivery_form').hide()
})

});