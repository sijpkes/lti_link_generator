$(document).ready(function() {
    $('select#tool').change(function() {
        var s = $(this).find("option:selected");
        var val = s.val();
        var header = s.text();
        if(val > 0) {
          $("#tool-header > h2").text(header);
          $("#tool-header").show(500);
          $('#settings-row').slideDown(500);
        } else {
          $("#tool-header").hide(500);
          $('#settings-row').slideUp(500);
        }
    });

    $('a#edit_template').click(function(e) {
          e.preventDefault();
          $('#template').show(500);
    });

  /*  $('a#edit_settings').click(function(e) {
          e.preventDefault();
          $('#settings').show(500);
    });*/
});
