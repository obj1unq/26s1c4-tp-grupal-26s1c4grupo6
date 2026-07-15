import wollok.game.*
import forest.*
import spawner.*
class Obstaculo {
    var property position
    var estadoAnimacion
    var property id

    method nombreTick() = "Movimiento de obstaculo " + id.toString()

    method moverse() {
        game.onTick(130, self.nombreTick(), {self.obstaculoMoviendose()})
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
        game.removeTickEvent(self.nombreTick())
        game.removeVisual(self)
        spawner.quitar(self)
    }

    method choqueCon(personaje){
        if(not personaje.estaInmune()){
        game.removeTickEvent(self.nombreTick())
        personaje.perder("Chocaste!")
     }
    }
}

class Auto inherits Obstaculo{}

class Corredor inherits Obstaculo{}

class Ave inherits Obstaculo{}

object alasAbajo {
    method image() = "ave-abajo.png"
    method siguiente() = alasArriba
}
object alasArriba {
    method image() = "ave-arriba.png"
    method siguiente() = alasAbajo
}
object corredorUno {
    method image() = "corredor-uno.png"
    method siguiente() = corredorDos
}
object corredorDos {
    method image() = "corredor-dos.png"
    method siguiente() = corredorUno
}
object autoNormal {
    method image() = "autoNormal.png"
    method siguiente() = autoHumo 
}
object autoHumo {
    method image() = "autoHumo.png"
    method siguiente() = autoNormal
}

