var ready;
ready = function() {

  // Register clicks on post-it divs and highlight
  $('.post-it').click(function(event){
    event.preventDefault();
    console.log($(this).attr('class'));
    if ($(this).attr('class') === 'draggable post-it ui-draggable ui-draggable-handle active' || $(this).attr('class') === 'post-it active') {
      $(this).removeClass('active');
    }
    else if($('.active').length < 3) {
      $(this).addClass('active');
    }
  })

  $( ".draggable" ).draggable({
    containment: 'body'
  });
  $( ".dropbox" ).droppable({
      accept: '.draggable',
      drop: function( event, ui ) {
        // This changes the id of the droppable box to the name of the element being dropped inside
        $(this).attr('id', ui['draggable'][0].firstChild.nextSibling.id)
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
          document.location="/users/" + response.user_id + "/competencies/rank"
    })
    .fail(function(response){
      console.log('failed');
    })
  })

  $('#sub-order').click(function(event){
    event.preventDefault();
    var route = $(this).attr('href');
    var selectedHtml = $('.dropbox').map(function(){return this.id});
    var data = []
    for (var i=0; i<selectedHtml.length; i+=1){
      data.push(selectedHtml[i]);
    }
    $.ajax({
      url: route,
      method: 'PUT',
      data: {selected: data}
    })
    .done(function(response){
          document.location="/users/" + response.user_id + "/rhythms"
    })
    .fail(function(response){
      console.log('failed');
    })
  });

};

$(document).ready(ready);
$(document).on('page:load', ready);