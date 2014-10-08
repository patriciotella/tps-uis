'use strict';

angular.module('carmenSanDiegoApp', []).controller('ListaDePaisesRecorridos', function ($scope) {
	
	$scope.paises = [
	                 {'nombrePais' : 'Uruguay'},
	                 {'nombrePais' : 'Chile'},
	                 {'nombrePais' : 'Marruecos'}
	];
});

/*
 *Villano {'nombre': 'Carmen Sandiego',
    	   'sexo': 'Femenino',
    	   'señas_particulares': ['Pelo rojo',
    	   						  'maneja un convertible',
    	   						  'posee un collar de rubies',
    	   						  'su comida favorita son los tacos mexicanos'],
    	   'hobbies': 'Juega Tenis'}
 */
