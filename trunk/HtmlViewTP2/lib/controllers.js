'use strict';

var app = angular.module('carmenSanDiegoApp',[])

app.controller('PaisesCtrl', function ($scope) {
	
	$scope.paises = [
	                 {'nombrePais' : 'Uruguay'},
	                 {'nombrePais' : 'Chile'},
	                 {'nombrePais' : 'Marruecos'}
	];
	
	$scope.paisActual ={'nombrePais' : 'Argentina'};
	
	$scope.paisesFallidos = [
	                         {'nombrePais' : 'Lisboa'},
	                         {'nombrePais' : 'Israel'}
	];
	
	$scope.destinos = [
	                 {'nombrePais' : 'Egipto'},
	                 {'nombrePais' : 'Rusia'},
	                 {'nombrePais' : 'Brasil'}
	];
});

app.controller('LugaresCtrl', function ($scope) {
	
	$scope.lugares = [
	                  {'nombreLugar' : 'Embajada'},
	                  {'nombreLugar' : 'Museo'},
	                  {'nombreLugar' : 'Biblioteca'}
	];
});


app.controller('VillanosCtrl', function ($scope) {
	
	$scope.villanos = [
	                   {'nombre': 'Carmen Sandiego',
	       	'sexo': 'Femenino',
    	   'señas_particulares': ['Pelo rojo',
    	   						  'maneja un convertible',
    	   						  'posee un collar de rubies',
    	   						  'su comida favorita son los tacos mexicanos'],
    	   'hobbies': 'Juega Tenis'},
    	   {'nombre': 'Carlos Monte',
   	       	'sexo': 'Masculino',
       	   'señas_particulares': ['Pelo Negro',
       	   						  'maneja una moto',
       	   						  'posee un collar de rubies',
       	   						  'su comida favorita son los tacos mexicanos'],
       	   'hobbies': 'Juega Futbol'},
       	{'nombre': 'Daniel Miller',
      	       	'sexo': 'Masculino',
          	   'señas_particulares': ['Pelo Negro',
          	   						  'maneja una moto',
          	   						  'posee un collar de rubies',
          	   						  'su comida favorita son los tacos mexicanos'],
          	   'hobbies': 'Juega Futbol'},
          	 {'nombre': 'Maria Romualda de los Valles',
          	       	'sexo': 'Femenino',
              	   'señas_particulares': ['Pelo Negro',
              	   						  'maneja una moto',
              	   						  'posee un collar de rubies',
              	   						  'su comida favorita son los tacos mexicanos'],
              	   'hobbies': 'Juega Futbol'}] 
});