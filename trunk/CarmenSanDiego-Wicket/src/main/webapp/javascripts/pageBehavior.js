function expedientesTab() {
	$("#mapamundiTab")[0].setAttribute("class","");
	$("#expedientesTab")[0].setAttribute("class","active")
	$("#mapamundi").hide();
	$("#expedientes").show();
	$("#editorDeVillano").hide();
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
	$("#editorDeVillano")[0];
	$("#editorDeVillano").show();
}

function volverInspeccionVillano() {
	$("#editorDeVillano").hide();
}