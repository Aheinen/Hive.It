var ready;
ready = function() {

  // Register clicks on post-it divs and highlight
  $('.post-it').click(function(e){
    e.preventDefault();
    if ($(this).attr('class') === 'post-it active') {
      $(this).removeClass('active');
    }
    else {
      $(this).addClass('active');
    }
  })

  $( ".draggable" ).draggable();
  $( ".dropbox" ).droppable({
      drop: function( event, ui ) {
        $( this )
          .addClass( "ui-state-highlight" )
          .find( "p" )
            .html( "Dropped!" );
      }
    });

};

$(document).ready(ready);
$(document).on('page:load', ready);