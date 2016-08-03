$(document).ready(function() {
    // home object is defined in template
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
          $('#template_html').show(500);
    });

    var fileSize = 0;

    function sendFile(fd) {
    //  $("#rubricProgress").html('');
      //console.log(fd);
      $.ajax({
        type: 'post',
        url: home.rubricUpoadUrl,
        data: fd, //new FormData($('#rubric_wrapper input').serializeArray()), //{ do_upload_rubric: 1, file: file, course_id: '<%= @keyset.context_id %>', resource_link_id: '_linkgen_temp_' },
        success: function (response) {
          response = JSON.parse(response);
          if(typeof response.error !== 'undefined') {
              $("#rubricProgress").html("<strong style=\'color: red\'>Error: "+response.error+"</strong>");
          } else {
              $('#total_score').val(response.score); // update the DIV
              $('#total_score').prop("disabled", true);
              $('#scoreOverride').show();
              $("#rubricProgress").html("<strong style=\'color: blue\'>"+response.message+"</strong>");
          }
        },
        xhrFields: {
          // add listener to XMLHTTPRequest object directly for progress (jquery doesn't have this yet)
          onprogress: function (progress) {
          //  console.log(progress);
            // calculate upload progress
            var percentage = Math.floor((progress.loaded / fileSize) * 100);

            $("#rubricProgress").html(home.progressImage);
            // log upload progress to console
            //console.log('progress', percentage);
            if (percentage === 100) {
            //  $("#rubricProgress").html('');
            }
          }
        },
        processData: false,
        contentType: false
      });
    }
    // Prevent Bootstrap dialog from blocking focusin
    $(document).on('focusin', function(e) {
      if ($(e.target).closest(".mce-window").length) {
        e.stopImmediatePropagation();
      }
    });

    $('#rubric_file').change(function () {
        //var fd = );
         var fd = new FormData();

         fileSize = this.files[0].size;

         fd.append('rubric_file', this.files[0]);
         fd.append('do_upload_rubric', 1);
         fd.append('linkgen_id', home.linkgen_id);
         fd.append('resource_link_id', '_linkgen_temp_');
         fd.append('institution_id', '1');
         //fd.append("file_1", file_data);

         /*var other_data = $('#rubric_wrapper input').serializeArray();
         $.each(other_data,function(key,input){
             fd.append(input.name,input.value);
         });*/

         sendFile(fd);
    });

});
