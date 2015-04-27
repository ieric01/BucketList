
$(function() {
  $("#name").autocomplete({
    source: "/search_suggestions",
    select: function(event, ui) {
    window.location.replace(ui.item.value)
    }
   });
});

