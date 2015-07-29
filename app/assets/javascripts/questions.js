var ready;
ready = function() {

  $('#group-hive').click(function(event){
    event.preventDefault();
    event.stopPropagation();
    var route = $(this).attr('href');
    var data = { question: $('.question-box').val(), solo: false };
    postQuestion(route, data);
  })

  $('#solo-hive').click(function(event){
    event.preventDefault();
    event.stopPropagation();
    var route = $(this).attr('href');
    var data = { question: $('.question-box').val(), solo: true };
    postQuestion(route, data);
  })

};

$(document).ready(ready);
$(document).on('page:load', ready);

var postQuestion = function(route, data){
  $.ajax({
    url: route,
    method: 'POST',
    data: data
  })
  .done(function(response){
    document.location="/users/" + response.user_id + "/hives/new";
  })
  .fail(function(response){
    console.log('failed');
  })
}
