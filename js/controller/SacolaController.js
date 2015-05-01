function SacolaController($scope){

	$scope.sacola = new Sacola();

	$scope.comprar = function(){
	 	$scope.sacola.incrementarTotal();
	}

}