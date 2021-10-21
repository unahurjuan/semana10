class Cerveza {
	var property lupuloPorLitro = 0
	var property pais = ""
	
	method graduacion()
}

class MarcaRubia inherits Cerveza {
	var graduacion
	override method graduacion() {
		return graduacion
	}
}

class MarcaNegra inherits Cerveza {
	override method graduacion() {
		return graduacionReglamentaria.graduacion().min(self.lupuloPorLitro() * 2)
	}
}

object graduacionReglamentaria {
	var property graduacion = 8
}

class MarcaRoja inherits MarcaNegra {
	override method graduacion() {
		return super() * 1.25
	}
}

class Jarras {
	var property litros 
	var property marca
	const property alcohol = self.litros() * (self.marca().graduacion() / 100)
}