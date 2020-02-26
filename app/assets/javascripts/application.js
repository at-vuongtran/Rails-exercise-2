//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

$(document).on('ready', function() {
  // your setup code here...
  $("#btn").click(function(){
    content = $("#text").val()
    element = $("#create-comment")
    user_id = element.attr('data-user')
    post_id = element.attr('data-post')
    $.ajax({
      type: "POST",
      url: "http://localhost:3000/comments",
      data: {comment: {user_id: user_id, post_id: post_id, content: content}},
      success(data){
        eldel = '<a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/comments/'+data.comment.id+'">Delete</a>'
        content = '<p><a href="http://localhost/users/'+ data.user.id + '">'+ data.user.name + '</a> :'+ data.comment.content+' <a href="http://localhost/comments/'+ data.comment.id + '/edit">Update</a>, '+ eldel +'</p>'
        $("#comments").append(content)
        return false
      },
      error(data) {
        console.log(data)
        return false
      }
    })
  })
});