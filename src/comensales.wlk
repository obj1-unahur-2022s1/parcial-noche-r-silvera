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
	override method leAgrada(unaComida){
		
	}
}