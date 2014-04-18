
$(document).ready(function(){
  
  $("#try").hide();
  $("#info").hide();
  $("#controls").hide();
		
  $("#title").on("click",function(){
	  $(this).css("opacity", 1);
	  $("#upper").css("opacity", 0.5);
	  $("#lower").css("opacity", 0.5);
    $("#headingchamp").html('<%= h @font_1.title %>');
    $("#challenger").html('<%= h @font_2.title %>');
	});
  
  $("#heading_vote").click(function(){
  
    var fontid='<%= h @font_1.id %>'
    $(".text").html(fontid);
    $.ajax({
      type: "POST", url: 'fonts/'+fontid+'/vote', success: function(){
        $(".text").html('voted');
      }
    });
  });
  
	$("#upper").on("click",function(){
	  $(this).css("opacity", 1);
	  $("#title").css("opacity", 0.5);
	  $("#lower").css("opacity", 0.5);
	  $(".text").html("ABCDEFGH<br>IJKLMNOPQR<br>STUVWXYZ");
	});

	$("#lower").on("click",function(){
	  $(this).css("opacity", 1);
	  $("#title").css("opacity", 0.5);
	  $("#upper").css("opacity", 0.5);
	  $(".text").html("abcdefgh<br>ijklnopqr<br>stuvwxyz");
  });

  $("#plus").click(function(){
    $("#controls").slideToggle("slow");
  });

  $("#i").on("click",function(){
    $("#try").fadeToggle();
    $("#info").fadeToggle();
  });

});