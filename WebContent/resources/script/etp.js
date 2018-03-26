function ConvertFormToJSON(form) {
	var array = jQuery(form).serializeArray();
	var json = {};

	jQuery.each(array, function() {
		if (this.name.indexOf("_") != 0) {
//			json[this.name] = this.value.toUpperCase() || '';
			json[this.name] = this.value || '';
		}
	});

	return json;
}

function ConvertFormToJSONString(form) {
	//Call convertformtojson 
	var serialdata = ConvertFormToJSON(form);
	//Return the json object converted as JSON data
	return JSON.stringify(serialdata);
}

function autotab(original,destination){
	if (original.getAttribute&&original.value.length==original.getAttribute("maxlength")){
		destination.focus();
		destination.select();
	}
}