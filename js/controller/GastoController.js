function GastoController($scope){
	// $http
	//$http.jsonP("https://mattosfilhoadv-public.sharepoint.com/_api/search/query?querytext=%2…eryTemplatePropertiesUrl=%27spfile://webroot/queryparametertemplate.xml%27" ).success(function(data){

	//})
	//P dominon diferente
	var data = {"gasto":[  
			{"dia":1, "valor":100},
			{"dia":2, "valor":200},
			{"dia":3, "valor":300},
		]}


	$scope.dados = data.gasto;
}
