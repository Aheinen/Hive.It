var ready;
ready = function() {

  // Register clicks on post-it divs and highlight
  $('.post-it').click(function(event){
    event.preventDefault();
    if ($(this).attr('class') === 'post-it active') {
      $(this).removeClass('active');
    }
    else if($('.active').length < 3) {
      $(this).addClass('active');
    }
  })

  $( ".draggable" ).draggable();
  $( ".dropbox" ).droppable({
      drop: function( event, ui ) {
        $( this )
          .addClass( "ui-state-highlight" )
      }
    });

  $('#sub-comps').click(function(event){
    event.preventDefault();
    var route = $(this).attr('href');
    var selectedHtml = $('.active h3').map(function(){return this.id});
    var data = []
    for (var i=0; i<selectedHtml.length; i+=1){
      data.push(selectedHtml[i]);
    }
    $.ajax({
      url: route,
      method: 'POST',
      data: {selected: data}
    })
    .done(function(response){
          document.location="/users/" + response.user_id + "/competencies/new"
    })
    .done(function(response){
      console.log('failed');
    })
  })

};

$(document).ready(ready);
$(document).on('page:load', ready);