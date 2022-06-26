import comidas.*

class Comensal {
	var property peso
	const property comidasQueComio = []
	
	method leAgrada(unaComida)
	
	method comer(unaComida){
		comidasQueComio.add(unaComida)
	}
	
	method pesoDeTodasLasComidasQueComio() = comidasQueComio.sum{c => c.peso()}
	
	method estaSatisfecho() = self.pesoDeTodasLasComidasQueComio() >= peso * 0.01
}

class Vegetariano inherits Comensal{
	override method leAgrada(unaComida) = 
	
		unaComida.esAptoVegetariano()  and unaComida.valoracion() > 85
										
	method ningunaComidaEsAbundante() = comidasQueComio.all{c => not c.esAbundante()}
	
	override method estaSatisfecho() = super() and self.ningunaComidaEsAbundante()
}

class HambrePopular inherits Comensal{
	override method leAgrada(unaComida) = unaComida.esAbundante()
}

class DePaladarFino inherits Comensal{
	override method leAgrada(unaComida) = unaComida.peso().between(150,300) and
										unaComida.valoracion() > 100
	
	method cantidadDeComidasQueComioEsPar() = comidasQueComio.size() % 2 == 0	
	override method estaSatisfecho() = super() and self.cantidadDeComidasQueComioEsPar()
}

