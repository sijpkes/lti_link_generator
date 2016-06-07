$(document).ready(function() {
    $('select#tool').change(function() {
        var val = $(this).find("option:selected").val();
        if(val > 0) {
          $('#launch_info').slideDown(500);
        } else {
          $('#launch_info').slideUp(500);
          $('#template').slideUp(500);
        }
    });

    $('a#edit_template').click(function(e) {
          e.preventDefault();
          $('#template').show(500);
    });

    $('a#edit_settings').click(function(e) {
          e.preventDefault();
          $('#settings').show(500);
    });
});
