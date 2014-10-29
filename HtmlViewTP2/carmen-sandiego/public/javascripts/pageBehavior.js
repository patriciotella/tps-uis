function casoTab() {
	$('#myTab a:first').off('click');
	$("#casoBody").show();
}

function jugarTab() {
	$("#casoBody").hide();
}

function mostrarNombreDelLugar(id) {
	$('.titulo')[0].innerHTML = 'Est&aacute;s visitando: '
			+ id;
	$('.titulo')[0].id = id;
}

function mostrarNombreVillano(idVillano) {
	document.getElementById('modalVillano').innerHTML = 'Est&aacute;s inspeccionando a: '
			+ idVillano
}