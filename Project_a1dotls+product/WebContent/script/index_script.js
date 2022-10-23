
$(function() {

	setInterval(fnSlide, 4000);
	
	
	function fnSlide() {
		
		$("#slideFrame").animate(
		{"margin-left": "-1200px"},
		3000,
		function(){
			$("#slideFrame a:first-child")
					.insertAfter("#slideFrame a:last-child");
			$("#slideFrame").css({"margin-left": "0"});
		});
	
	
	}

});