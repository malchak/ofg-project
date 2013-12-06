$(document).ready(function(){
	$(".betting-table").hide();
	$(".betting-stats").on('click', function(){
		$(".golf-table").hide();
		$(".golf-stats a").removeClass('active');
		$(".betting-table").show();
		$(".betting-stats a").addClass('active');
	});
	$(".golf-stats").on('click', function(){
		$(".betting-table").hide();
		$(".betting-stats a").removeClass('active');
		$(".golf-table").show();
		$(".golf-stats a").addClass('active');
	});
})