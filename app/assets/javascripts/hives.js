// $(function(){
//   if($('span').is('.hive-chat')){
    // alert('got here')
    // var pusher = new Pusher('cf25b0bc9947e040c849');
    // var chatWidget = new PusherChatWidget(pusher, {
      // chatEndPoint: 'pusher-realtime-chat-widget/src/php/chat.php'
    // });
//   }
// });

var ready;
ready = function() {
  var pusher = new Pusher('cf25b0bc9947e040c849');
  var chatWidget = new PusherChatWidget(pusher, {
    // chatEndPoint: 'pusher-realtime-chat-widget/src/php/chat.php'
  });

};

$(document).ready(ready);
$(document).on('page:load', ready);

