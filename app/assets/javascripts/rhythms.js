var ready;
ready = function() {

  $('#sub-rhythms').click(function(event){
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
      document.location="/users/" + response.user_id + "/questions/new"
    })
    .fail(function(response){
      console.log('failed');
    })
  })

};

$(document).ready(ready);
$(document).on('page:load', ready);