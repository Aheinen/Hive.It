var ready;
ready = function() {
  var pusher = new Pusher('cf25b0bc9947e040c849');
  var chatWidget = new PusherChatWidget(pusher, {
    // chatEndPoint: 'pusher-realtime-chat-widget/src/php/chat.php'
  });

  console.log(gon.mapped_messages)



  $(document).on('click', '.bee-img', function(event) {
    event.preventDefault();
    var message = $(this).parent().attr('class');
    // Change this when pushing to heroku
    var route = document.location.href.slice(21) + '/favorite'
    console.log($(this).parent().attr('class'));
    $.ajax({
      method: 'PATCH',
      url: route,
      data: { message: message }
    }).done(function(response) {
      console.log(response);
    })
  })

};

$(document).ready(ready);
$(document).on('page:load', ready);

