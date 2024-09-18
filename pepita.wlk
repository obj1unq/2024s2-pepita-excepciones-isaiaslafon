object pepita {
	var energia = 100
	
	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}
	
	method puedeVolar(distancia){
		return energia >= self.energiaNecesaria(distancia)
	}

	method energiaNecesaria(distancia){
		return 10 + distancia
	}

	method volar(distancia) {
		self.validarVolar(distancia)
		energia -= self.energiaNecesaria(distancia)
	}

	method validarVolar(distancia){
		if(not self.puedeVolar(distancia)){
			self.error("Estoy muy cansado!")
		}
	}
			
	method energia() {
		return energia
	}
}

object alpiste {
	method energiaQueAporta() {
		return 20
	}
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() {
		return madurez
	}
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() {
		return base * madurez
	}
}

object pepon {
	var energia = 30
	
	method energia() {
		return energia
	}
		
	method comer(comida) {
		energia += comida.energiaQueAporta() / 2
	}

	method energiaNecesaria(distancia){
		return 20 + 2 * distancia
	}

	method puedeVolar(distancia){
		return energia >= self.energiaNecesaria(distancia)
	}

	method volar(distancia) {
		self.validarVolar(distancia)
		energia -= self.energiaNecesaria(distancia)
	}

	method validarVolar(distancia){
		if(not self.puedeVolar(distancia)){
			self.error("Estoy muy cansado!")
		}
	}
	
}

object roque {
	var ave = pepita
	var cenas = 0;
	
	method cenas(){
		return cenas
	}
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas = cenas + 1
	}
}


object milena{
	const aves = #{}
	
	method agregarAve(ave){
		aves.add(ave)
	}

	method abandonarAve(ave){
		aves.remover(ave) //Si no estaba el ave simplemente no hace nada.
	}

	method movilizar(distancia){
		self.validarMovilizar(distancia)		
		aves.forEach({ave => ave.volar(distancia) })
	}

	//Validación para lanzar excepción.
	method validarMovilizar(distancia){
		if(not self.puedeMovilizar(distancia)){ //Se usa una consulta booleana para ver si hay que lanzarla.
			self.error("No puede movilizar a todas sus aves!")
		}
	}

	//Consulta de si puede realizar la acción a validar.
	method puedeMovilizar(distancia){
		return aves.all({ave => ave.puedeVolar(distancia)})
	}
	
	

}

