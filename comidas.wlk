import obstaculos.*
import wollok.game.*

class Comida inherits Obstaculo{ 
    var property energiaDeComida
    var property image 

    override method choqueCon(personaje){
        personaje.comer(self)
        self.eliminar()
    }
    override method actualizarImagen() {}

    method initialize() {
            estadoAnimacion = null
    }

}



class Manzana inherits Comida
 (position = game.at(game.width(), 1), energiaDeComida = 1, image = "manzana.png"){
  
}



class Banana inherits Comida
(position = game.at(game.width(), 1), energiaDeComida = 2, image = "banana.png"){
}


object generadorDeComida{
    method añadirComidaAlAzar(){
        const comidas=[new Manzana(),new Banana()]
        const comidaRandom=comidas.anyOne()
        game.addVisual(comidaRandom)
        comidaRandom.moverse()
    }
}



class Obstaculo{
    var property position
    var estadoAnimacion

method moverse() {
        game.onTick(20, "Movimiento de obstaculo",{self.obstaculoMoviendose()})
    }

method obstaculoMoviendose(){    
        self.moverObstaculo()
        self.actualizarImagen()
    }

    method moverObstaculo(){
        position = position.left(1)

 if (position.x() < -1){
            self.eliminar()
        }
    }

 method image() = estadoAnimacion.image()

    method actualizarImagen(){
        estadoAnimacion = estadoAnimacion.siguiente()
    }
     
    method eliminar(){
        game.removeVisual(self)
    }

 method choqueCon(personaje){
        personaje.perder()
    }
}

/*
class Ave inherits Obstaculo{}

object alasAbajo {
    method image() = "ave-abajo.png"
    method siguiente() = alasArriba
}
object alasArriba {
    method image() = "ave-arriba.png"
    method siguiente() = alasAbajo
}*/


