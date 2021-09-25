$(document).on('turbolinks:load', function() {
  function buildHTML(message) {
    var content = message.content ? `${ message.content }` : "";
    var img = message.image ? `<img src= ${ message.image }>` : "";
    var html = '<div class="row d-flex justify-content-end"><div class="col-4 d-flex justify-content-end"><div class="container-fluid mx-0 p-0"><% if message.content.present? %><div class="row d-flex justify-content-end"><span class="p-2 text-left bg-light rounded">${content}</span></div><% end %><% if message.image.attached? %><div class="row d-flex justify-content-end"><span class="p-2 text-center bg-light rounded">${img}</span></div><% end %><div class="row d-flex justify-content-end mb-2"><small><%= l message.created_at %></small></div></div></div></div>'
    return html;
  }
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var message = new FormData(this);
    var url = $(this).attr('action');

    $.ajax({
      url: url,
      type: 'POST',
      data: message,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.messages').append(html);
      $('#new_message').val('');
    })
    .fail(function(data){
      alert('エラーが発生したためメッセージは送信できませんでした。');
    })
    .always(function(data){
      $('.submit-btn').prop('disabled', false);
    })
  })
});