'use strict';

var app = angular.module('carmenSanDiegoApp', [])

app.controller('Controller', function($scope, $http, $timeout) {

	$scope.iniciarJuego = function() {
    	$http.get('/iniciarJuego')
    		.success(function(data) {
    			$scope.juegoId = data.juegoActual.id;
    			$scope.villanos = data.expedientesDeVillanos.villanos;
    			$scope.paisActual = data.juegoActual.paisActual;
    			$scope.descripcionDelCaso = data.juegoActual.descripcionDelCaso;
    			$scope.villanoAcusado = data.juegoActual.villanoAcusado;
    			$scope.paisAnterior = data.juegoActual.paisAnterior;
    			$scope.destinosFallidos = data.juegoActual.destinosFallidos;
    			$scope.paisesPorDondePasoElCriminal = data.juegoActual.recorridoCriminal;
    		}
    	)
    }
    
    $scope.iniciarJuego();
    
	$scope.mostrarLugarConPista = function() {
		$http.get('/pista/' +$scope.juegoId + '/'+ $('.titulo')[0].id)
		.success(function(data) {
			$scope.pista = data;
			$scope.escondeAlVillano = (data.toString().indexOf("Tenga cuidado, el villano está en el lugar") > -1);
		});
	}

	$scope.viajarAPais = function() {
		if($scope.paisSeleccionado){
			$http.post('/viajar/' + $scope.juegoId + '/' + $scope.paisSeleccionado)
			.success(function(data) {
				$scope.paisActual = data.paisActual;
				$scope.paisAnterior = data.paisAnterior;
				$scope.paisesPorDondePasoElCriminal = data.recorridoCriminal;
				$scope.destinosFallidos = data.destinosFallidos;
				$scope.paisSeleccionado = null;
			});
		}
	};
	
	$scope.viajarAPaisAnterior = function() {
		if($scope.paisAnterior){
			$http.post('/volverAPaisAnterior/' + $scope.juegoId)
			.success(function(data) {
				$scope.paisAnterior = data.paisAnterior;
				$scope.paisActual = data.paisActual;
			});
		}
	};
	
	$scope.mostrarDetallesDelVillano = function() {
		if($scope.villanoSeleccionado){
			$scope.villanos.forEach(function(each) {
				if(each.nombre == $scope.villanoSeleccionado){
					$scope.sexoDelVillano = each.sexo;
					$scope.caracteristicasDelVillano = each.seniasParticulares;
					$scope.hobbiesDelVillano = each.hobbies;
				}
			});
		}
	};
	
	$scope.acusarVillano = function() {
		if($scope.villanoSeleccionado){
			$http.post('/acusarA/' + $scope.juegoId + '/' + $scope.villanoSeleccionado)
			.success(function() {
				$scope.villanoAcusado = $scope.villanoSeleccionado;
				$scope.notificarMensaje("Orden emitida contra " + $scope.villanoSeleccionado);
			});
		}
	};
	
	$scope.finalizarJuego = function() {
		$http.post('/finalizarPartida/' + $scope.juegoId)
		.success(function(data) {
			$scope.gano = (data.resolucionDePartida.toString().indexOf("Ganaste") > -1);
			$scope.culpableDelRobo = data.culpableDelRobo;
			$scope.nombreDelCaso = data.nombreDelCaso;
			$scope.nombreDelObjetoRobado = data.nombreDelObjetoRobado;
			$scope.villanoAcusado = data.villanoAcusado;
		});
	};
	
//...........................................FEEDBACK & ERRORES.............................................//
	$scope.msgs = [];
	$scope.notificarMensaje = function(mensaje) {
		$scope.msgs.push(mensaje);
		
		$timeout(function(){
			while($scope.msgs.length > 0) 
				$scope.msgs.pop();
	    }, 3000);
	};

	$scope.errors = [];
    $scope.notificarError = function(mensaje) {
    	$scope.errors.push(mensaje);
		$timeout(function(){
			while($scope.errors.length > 0) 
				$scope.errors.pop();
	    }, 3000);
    }
	
});