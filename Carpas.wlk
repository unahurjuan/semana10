import Marcas.*
import Personas.*

class Carpa {
	var property limiteDePersonas
	var property personasEnCarpa
	var property bandaMusical
	var property marca
	
	method venderJarra(persona, capacidad) {
		var j1 = new Jarras(marca = self.marca(), litros = capacidad)
		if (personasEnCarpa.contains(persona))
		{
			persona.jarrasTomadas().add(j1)
		}
		else
		{
			self.error("La persona no esta en la carpa.")
		}
	}
	
	method puedeEntrarEnCarpa(persona){
		return not persona.estaEbria() and personasEnCarpa.size() < limiteDePersonas
	}
	
	method todosLosEbrios(){
		return self.personasEnCarpa().filter({g => g.estaEbria()})
	}
	
	method todosLosEbriosEmpedernidos() {
		return self.todosLosEbrios().filter({l => l.jarrasTomadas().all({k => k.litros() >= 1})}).size()
	}
}