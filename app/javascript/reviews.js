$(function () {
    $(".js-more").on('click', function() {
      var id = $(this).data("id");
      $.get("/reviews/" + id + ".json", function(data) { 
        $("#body-" + id).html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "Comments: " + '"' + data["content"] + '"');
      });
    });
  });
  
 
  $(function () {
    $(".js-next").on("click", function() {
      var nextId = parseInt($(".js-next").attr("data-id")) + 1;
      $.get("/reviews/" + nextId + ".json", function(data) { 
        var review = data;
        var rname = review["restaurant"]["name"];
        $(".restName").html("<a href='/restaurants/"+data['id'].toString()+"'>"+rname+"</a>");
        $(".reviewBody").html(review["content"]);
        var cuisineType = review["cuisines"][0]["name"];
        $(".reviewCuisines").html(cuisineType + ".");
        $('.reviewRating').css({ 'font-weight': 'bold' });
        $(".reviewRating").html(review["rating"]);
        var visitDate = review["date_visited"];
        var date = new Date(visitDate);
        var newDate = date.toLocaleDateString();
        $(".reviewDateVisited").html(newDate);
        $(".reviewUpdatedAt").html(review["updated_at"]);
        $('.userEmail').css({ 'font-weight': 'bold' });
        $(".userEmail").html(review["user"]["email"]);
        $("a[href$='.com']").html(review["restaurant"]["name"]);
        $(".load_more").css({ 'font-weight': 'bold' });
        $(".load_more").html(review["restaurant"]["name"]);
        $(".js-next").attr("data-id", review["id"]);
      });
    });
  });
  

  $(function() {
    $(".load_more_reviews").on("click", function(e) {
      $.get( this.href).done(function( response ) { 
        $(".reviews").html(response)
      })
      e.preventDefault();
    });
  });