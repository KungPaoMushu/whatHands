 //= require turbolinks
$ ->
  $('.comment-reply').click ->
    $(this).closest('.comment').find('.reply-form').toggle()
    return

$('#<%= @comment.id %>').remove();