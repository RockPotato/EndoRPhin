$(document).ready(function(){
	var ddd;
	$("input[name=orderPrice]").attrchange({
		
		trackValues: true,
	    callback: function(ev) {
	    	ddd = ev;
	      // The data-clicked-items attribute has been changed
	      if ( ev.attributeName === 'value' ) {
	        // The data-clicked-items attribute has changed, so update the number in DOM
	       	$("input[name=surtax]").attr('value',$("input[name=orderPrice]").val()/10);
	      }
	    }

	});
})
