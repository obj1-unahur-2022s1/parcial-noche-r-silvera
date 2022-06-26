import comidas.*
import comensales.*

class Cocina{
	const comidasPreparadas  = []
	
	method agregarAComidasPreparadas(unaComida){
		comidasPreparadas.add(unaComida)
	}
	
	method sacarDeComidasPreparadas(unaComida){
		comidasPreparadas.remove(unaComida)
	}
	
	method cantidadDeComidasVegetarianas() = comidasPreparadas.count{c => c.esAptoVegetariano()}
	
	method cantidadDeComidasCarnivoras() = comidasPreparadas.count{c => not c.esAptoVegetariano()}
	
	method tieneBuenaOfertaVegetariana(){
		const comidasCarnivoras = self.cantidadDeComidasCarnivoras()
		const comidasVegetarianas = self.cantidadDeComidasVegetarianas()
		
		if (comidasCarnivoras > comidasVegetarianas){
			
			return comidasCarnivoras - comidasVegetarianas <= 2
		}
		else{
			return comidasVegetarianas - comidasCarnivoras >= 2
		}
	}
	
	method platosCarnivoros() = comidasPreparadas.filter{c=> not c.esAptoVegetariano()}
	
	method platoFuerteCarnivoro() = self.platosCarnivoros().max{p => p.valoracion()}
	
	method comidasQueLeGustanA(unComensal) = comidasPreparadas.filter{c => unComensal.leAgrada(c)}
	
	method elegirPlatoPara(unComensal){
		if(not self.comidasQueLeGustanA(unComensal).isEmpty()){
			const comida = self.comidasQueLeGustanA(unComensal).anyOne()
			self.sacarDeComidasPreparadas(comida)
			unComensal.comer(comida)
		}
		else{
			self.error("Error, no se ha podido elegir un plato para el comensal.")
		}
	}
}