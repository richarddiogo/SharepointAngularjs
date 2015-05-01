function Sacola(){

	var total = 0;
        this.obterTotal = 0;

	this.obterTotal = function(){
		return total;	
	}

 	this.incrementarTotal = function(){
		total++;
	}
}