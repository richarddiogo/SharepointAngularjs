var AngularJSApp = angular.module("AngularJSApp", ["ngResource", "ngSanitize"])
    .config(function ($routeProvider, $httpProvider) {
        $httpProvider.defaults.withCredentials = true;
        delete $httpProvider.defaults.headers.common["X-Requested-With"]; 
    });
 
AngularJSApp.factory('FeedbackResource', function ($resource) {
    return $resource('https://mattosfilhoadv-public.sharepoint.com');
});
 
function ProfissionaisController($scope,$http){
	myApp.factory('reviewService', ['$http',
	function ($http){
	// $http
	//$httpProvider.defaults.headers.common['X-Requested-With'];
	var restQueryUrl = "https://mattosfilhoadv-public.sharepoint.com/_api/search/query?querytext=%27FullNameOWSTEXT:a*%27&rowlimit=500&selectproperties=%27mtNOME,mtFuncao,mtEscritorio,mtATUACAO,mtFoto,listItemID,mtPL,mtEmail,mtTelefone,mtFuncaoEN,mtATUACAOEN%27&startrow=0&QueryTemplatePropertiesUrl=%27spfile://webroot/queryparametertemplate.xml%27";


	$http.get(restQueryUrl,{withCredentials : true})
	.success(function(data){
		debugger;
		$scope.profissionais = data.d.query.PrimaryQueryResult.RelevantResults.Table.Rows.results;	})
	.error(function(data, status) {
        var data = data || "Request failed";
        var status = status;
    });
}()
]);

}

function JSOM_CALLBACK(x){

}

function ProfissionaisController($scope,$http){
	// $http
	//$httpProvider.defaults.headers.common['X-Requested-With'];
	//var restQueryUrl = "https://mattosfilhoadv-public.sharepoint.com/_api/search/query?querytext=%27FullNameOWSTEXT:a*%27&rowlimit=500&selectproperties=%27mtNOME,mtFuncao,mtEscritorio,mtATUACAO,mtFoto,listItemID,mtPL,mtEmail,mtTelefone,mtFuncaoEN,mtATUACAOEN%27&startrow=0&QueryTemplatePropertiesUrl=%27spfile://webroot/queryparametertemplate.xml%27";
    
    /*var restQueryUrl = "http://mirrorfashion.caelum.com.br/produtos?callback=JSOM_CALLBACK";
	$http.jsonp(restQueryUrl)
	.success(function(data){
		debugger;
		$scope.profissionais = data.produtos;
	})
	.error(function(data, status) {
        var data = data || "Request failed";
        var status = status;
    });*/

	var profissionais = {"dados":[  
			{"Nome":"Richard", "ID":100},
			{"Nome":"Rafael", "ID":200},
			{"Nome":"Jonas", "ID":300},
		]}

    $scope.profissionais = profissionais.dados;
}


//$httpProvider.defaults.useXDomain = true; 
//delete $httpProvider.defaults.headers.common['X-Requested-With'];



