function expedientesTab() {
	$("#mapamundiTab")[0].setAttribute("class","");
	$("#expedientesTab")[0].setAttribute("class","active")
	$("#mapamundi").hide();
	$("#expedientes").show();
}

function mapamundiTab() {
	$("#expedientesTab")[0].setAttribute("class","");
	$("#mapamundiTab")[0].setAttribute("class","active")
	$("#expedientes").hide();
	$("#mapamundi").show();
}

function cancelarEdicionVillano() {
	$("#expedientes").hide();
}

function inspeccionarVillano() {
	console.log($("#editorDeVillano")[0]);
	$("#editorDeVillano").show();
}