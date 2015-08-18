var ready;
ready = function() {
  var pusher = new Pusher('cf25b0bc9947e040c849');
  var chatWidget = new PusherChatWidget(pusher, {
    // chatEndPoint: 'pusher-realtime-chat-widget/src/php/chat.php'
  });

  $(document).on('click', '.bee-img', function(event) {
    event.preventDefault();
    var message = $(this).parent().attr('class');
    console.log($(this).parent().attr('class'));
    $.ajax({
      method: 'GET',
      url: '',
      data: { message: message }
    })
  })

};

$(document).ready(ready);
$(document).on('page:load', ready);

