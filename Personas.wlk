import Marcas.*
import Carpas.*

class Personas {
    var property peso
    var property jarrasTomadas = []
    var property leGustaTradicional
    var property nivelDeAguante
    
    method alcoholIngerido() {
        return self.jarrasTomadas().sum({j => j.alcohol()})
    }
    
    method estaEbria() {
        return self.alcoholIngerido() * peso > nivelDeAguante
    }
    
    method leGustaCerveza(marca)
    
    method quiereEntrarEnCarpa(carpa){
        return self.leGustaCerveza(carpa.marca()) and (self.leGustaTradicional() == carpa.bandaMusical())
    }
    
    method puedeEntrarEnCarpa(carpa){
        return self.quiereEntrarEnCarpa(carpa) and carpa.puedeEntrarEnCarpa(self)
    }
    
    method entrarEnCarpa(carpa){
        if (self.puedeEntrarEnCarpa(carpa))
        {
            carpa.personasEnCarpa().add(self)
        }
        else
        {
            self.error("No se pudo entrar en la carpa.")
        }
    }
    
    method esPatriota()
}

class Belga inherits Personas {
    override method leGustaCerveza(marca) {
        return marca.lupuloPorLitro() > 4
    }
    override method esPatriota(){
        return jarrasTomadas.all({ jarra => jarra.marca().pais() == "Belga"})
    }
}

class Checo inherits Personas {
    override method leGustaCerveza(marca) {
        return marca.graduacion() > 8
    }
    override method esPatriota(){
        return jarrasTomadas.all({ jarra => jarra.marca().pais() == "Checo"})
    }
}

class Aleman inherits Personas {
    override method leGustaCerveza(marca) {
        return true
    }
    override method quiereEntrarEnCarpa(carpa){
        return super(carpa) and carpa.personasEnCarpa().size().even()
    }
    override method esPatriota(){
        return jarrasTomadas.all({ jarra => jarra.marca().pais() == "Aleman"})
    }
}
