'use strict';

angular.module('CarmenSanDiegoApp', []).controller('ListaDePaisesRecorridos', function ($scope) {
	
	$scope.paises = [
	                 {'nombrePais' : 'Uruguay'},
	                 {'nombrePais' : 'Chile'},
	                 {'nombrePais' : 'Marruecos'}
	];
});