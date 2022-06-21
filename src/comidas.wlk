class Plato {
	var property peso
	var property esAbundante
	
	method esAptoVegetariano()
	method valoracion() = peso > 250
}

class Provoleta inherits Plato{
	var property tieneEspecias
	
	override method esAptoVegetariano() = not tieneEspecias
	method esEspecial() = esAbundante or tieneEspecias
	override method valoracion() = if(self.esEspecial()){120}else{80}
}

class HamburguesaDeCarne inherits Plato{
	const property tipoDePan
	
	override method peso() = 250
	
	override method esAptoVegetariano() = false
	
	override method valoracion() = 60 + tipoDePan.valoracion()
	
	
}

class HamburguesaVegetariana inherits HamburguesaDeCarne{
	var property estaHechaDe
	
	override method esAptoVegetariano() = true
	
	override method valoracion() = super() + 2*estaHechaDe.size().max(17)
	
}

object panIndustrial{
	method valoracion(){
		return 0
	}	
}

object panCasero{
	method valoracion(){
		return 20
	}
}

object panDeMasaMadre{
	method valoracion(){
		return 45
	}
}

class Parrilada inherits Plato{
	const cortesPedidos = []
	
	override method peso() = cortesPedidos.sum{c => c.peso()}
	override method esAptoVegetariano() = false
	method maximaCalidadDeSusCortes() = cortesPedidos.max{c => c.calidad()}
	method cantidadDeCortes() = cortesPedidos.size()
	override method valoracion() = 15 * self.maximaCalidadDeSusCortes() - self.cantidadDeCortes()
}

class Corte{
	var property nombreDelCorte
	var property calidad
	var property peso
}


//anyOne