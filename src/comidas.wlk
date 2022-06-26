class Plato {
	
	method peso()
	method esAptoVegetariano()
	method valoracion()
	method esAbundante() = self.peso() > 250
}

class Provoleta inherits Plato{
	var property tieneEspecias
	const property peso
	override method esAptoVegetariano() = not tieneEspecias
	method esEspecial() = self.esAbundante() or tieneEspecias
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
	
	override method valoracion() = super() + 17.min(2*estaHechaDe.size())
	
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

class Parrillada inherits Plato{
	const cortesPedidos = []
	
	method agregarACortesPedidos(unCorte){
		cortesPedidos.add(unCorte)
	}
	override method peso() = cortesPedidos.sum{c => c.peso()}
	override method esAptoVegetariano() = false
	method maximaCalidadDeSusCortes() = cortesPedidos.max{c => c.calidad()}.calidad()
	method cantidadDeCortes() = cortesPedidos.size()
	override method valoracion() = 0.max(15 * self.maximaCalidadDeSusCortes() - self.cantidadDeCortes())
}

class Corte{
	var property nombreDelCorte
	var property calidad
	var property peso
}


//anyOne