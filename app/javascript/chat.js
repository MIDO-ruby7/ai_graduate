$(function() {
  setInterval(function() {
    $.ajax({
      url: '/chats',
      dataType: 'script'
    });
  }, 5000);
});