// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require turbolinks
//= require_tree .

//this function set the image upload in a image tag to user preview the image
function readURL(input) {
  document.getElementById('image-selected').style.display = 'block';

  if (input.files && input.files[0]) {
    var reader = new FileReader();
    
    reader.onload = function (e) {
      //change label to show in form view of photos
      document.getElementById('file-inputed').style.display = 'block';
      //show image name in label tag
      $('#file-inputed')
        .text(document.getElementById("image-field").files[0].name);
      //set image preview in image tag
      $('#image-selected')
        .attr('src', e.target.result)
        .width('100%')
        .height('auto')
        .attr('alt', input.files[0].name);
    };

    reader.readAsDataURL(input.files[0]);
  }
}