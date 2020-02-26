//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

$(document).on('ready', function() {
  // your setup code here...
  $("#button").click(function(){
    value = $("#text").val()
    console.log(value)
    $.ajax({
      type: "POST",
      url: "/receive",
      data: {name: value},
      success(data){
        console.log(data)
        $("#parent").append("<p>"+data.name+"</p>")
        return false
      },
      error(data) {
        return false
      }
    })
  })
});