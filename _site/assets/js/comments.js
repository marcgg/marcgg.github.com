$(document).ready(function(){
  var url = "https://disqus.com/api/3.0/threads/list.json"
  var api_key = "jo71Z19p42l7daP6JLOXUOBTPKvcyi1x1lo0DuGEugrRUXEFNaf3OKvaNS5byfzV"
  var forum = "marcgg"
  var thread = "link:" + window.location.href
  $.ajax({
    url: url,
    dataType: "json",
    data: {
      api_key: api_key,
      forum: forum,
      thread: thread
    },
    success: function(data){
      var $show = $("#show-disqus")
      var postsCount = data.response[0].posts
      var message = ""
      if(postsCount == 0){
        message += "Be the first to contribute with a comment"
      }else if (postsCount == 1){
        message += "Read the comments or contribute with your own"
      }else{
        message += "Read the " + postsCount + " comments or contribute with your own"
      }
      $show.html(message)
    },
    statusCode: {
      400: function() {},
      500: function() {}
    }
  })
})

document.getElementById('show-disqus').onclick=function(e){
  e.preventDefault();
  document.getElementById("disqus_hide").innerHTML = "";
  document.getElementById("show-disqus").innerHTML = "";
  document.getElementById("show-disqus-arrow").innerHTML = "";

}
