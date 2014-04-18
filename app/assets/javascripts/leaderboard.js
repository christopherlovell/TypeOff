$(document).ready(function(){
	$("#nav").click(function(){
	  $("#howitworks").slideToggle("slow");
	});

	$("#headings span").on("click",function(){
	  $("#heading").css("font-family", $(this).attr("id"));
	  $("#heading").html($(this).text());
	  $("#trybutton").attr("href", $(this).attr("href"));
	  $("#trybutton").html("Try on " + $(this).attr("value"));
	});

	$("#texttable span").on("click",function(){
	  $("#text").css("font-family", $(this).attr("id"));
	});
  
	$("#texttablelink").on("click",function(){
	  $("#headings").css("opacity", "0");
	  $("#texttable").css("opacity", "1");
	  $("#headings").css("z-index", "0");
	  $("#texttable").css("z-index", "1");
	  $("#headingstable").css("opacity", "0.5");
	  $("#texttablelink").css("opacity", "1");
	});

	$("#headingstable").on("click",function(){
	  $("#headings").css("opacity", "1");
	  $("#texttable").css("opacity", "0");
	  $("#headings").css("z-index", "1");
	  $("#texttable").css("z-index", "0");
	  $("#headingstable").css("opacity", "1");
	  $("#texttablelink").css("opacity", "0.5");
	});
  
  // call the tablesorter plugin 
  $("table").tablesorter({ 
    // sort on the first column and third column, order asc 
    sortList: [[1,1]] 
  }); 
  
});