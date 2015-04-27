
      $(function() {
   $("#name").autocomplete({
    source: "/search_suggestions",
    select: function(event, ui) {
    $('#name').val(ui.item.value);
    window.open(ui.item.value);
   
    }
   });
      });

