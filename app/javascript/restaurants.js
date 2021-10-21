$(function() {
    $(".load_reviews").on("click", function(e) {
      $.ajax({
        method: "GET",
        url: this.href
      }).done(function(response) {
         $(".reviews").html(response)
      });
      e.preventDefault();
    });
  });