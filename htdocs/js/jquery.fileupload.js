(function($) {
  var inputGroup = "<div class=\"input-group file-upload\"></div>";
  var fileNameDisplay = "<div tabindex=\"-1\" class=\"form-control file-caption  kv-fileinput-caption\" title=\"\"><span class=\"glyphicon glyphicon-file kv-caption-icon\" style=\"display: none;\"></span><div class=\"file-caption-name\"></div></div>";
  var inputButtonGroup = "<div class=\"input-group-btn\"></div>";
  var inputButton = "<div class=\"btn btn-primary btn-file\"></div>";
  var buttonText = "<i class=\"glyphicon glyphicon-folder-open\"></i>&nbsp;Browse …";
  var wrapper = function(element) {
    $(element).wrap(inputGroup);
    $(element).before(fileNameDisplay);
    $(element).parent().find(".file-caption-name").attr('id', element.name);
    $(element).wrap(inputButtonGroup);
    $(element).wrap(inputButton);
    $(element).before(buttonText);
  };

  $.fn.FileUpload = function() {
    this.each(function(index, element) {
      wrapper(element);
      $(element).change(function() {
        var filename = $(this).val().split('\\').pop();
        var placeHolder = $(this).parent().parent().parent().find(".file-caption-name");
        $(placeHolder).html(filename);
      });
    });
    return this;
  };
})(jQuery);
