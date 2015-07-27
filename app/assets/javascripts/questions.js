var ready;
ready = function() {

  $('#sub-questions').click(function(event){
    event.preventDefault();
    event.stopPropagation();
    var route = $(this).attr('href');
    var data = $('.question-box').val();
    $.ajax({
      url: route,
      method: 'POST',
      data: {question: data}
    })
    .done(function(response){
          document.location="/users/" + response.user_id + "/hives"
    })
    .fail(function(response){
      console.log('failed');
    })
  })


};

$(document).ready(ready);
$(document).on('page:load', ready);