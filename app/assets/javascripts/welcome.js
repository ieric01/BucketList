
$(function() {
  $("#name").autocomplete({
    source: "/search_suggestions",
    select: function(event, ui) {
    window.location.replace(ui.item.url_value)
    }
   });
});

$('document').ready(function() {
  setTimeout(function() {
    $('.alert').slideUp();
  }, 3000);
});

