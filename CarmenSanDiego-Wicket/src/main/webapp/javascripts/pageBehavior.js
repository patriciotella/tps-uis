function expedientesTab() {
	$("#mapamundiTab")[0].setAttribute("class","");
	$("#expedientesTab")[0].setAttribute("class","active")
	$("#expedientes").show();
}

function mapamundiTab() {
	$("#expedientesTab")[0].setAttribute("class","");
	$("#mapamundiTab")[0].setAttribute("class","active")
	$("#expedientes").hide();
}

function cancelarEdicionVillano() {
	$("#expedientes").hide();
}