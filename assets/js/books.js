$(document).ready(function(){
  $(".buy-popin").on("click", function(e){
    e.preventDefault()

    $popin = $("#buy-popin")
    $book = $(e.target).parents(".master-book-data")

    $popin.find("#buy-title").html(
        "\"" +
        $book.data("title") +
        "\" <span>by " +
        $book.data("author") +
        "</span>"
    )
    $us = $popin.find("#store-us")
    $fr = $popin.find("#store-fr")
    $other = $popin.find("#store-other")

    // US
    if($book.data("linkus") != ""){
      $us.attr("href", $book.data("linkus")).show()
    }else{
      $us.hide()
    }

    // FR
    if($book.data("linkfr") != ""){
      $fr.attr("href", $book.data("linkfr")).show()
    }else{
      $fr.hide()
    }

    // OTHER
    if($book.data("link") != ""){
      $other.attr("href", $book.data("link")).show()
    }else{
      $other.hide()
    }

    $.featherlight($popin, {})
  })
})
