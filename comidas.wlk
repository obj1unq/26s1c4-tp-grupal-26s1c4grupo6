import obstaculos.*
import wollok.game.*

class Comida inherits Obstaculo{ 
    var property energiaDeComida
 
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
 (position = game.at(game.width(), 1), energiaDeComida = 1){
  override method image() = "manzana.png"
}

en comidas
class ManzanaDorada inherits Comida
 (position = game.at(game.width(), 1), energiaDeComida = 3){
  override method image() = "manzana-dorada.png"
}
class ManzanaPodrida inherits Comida
 (position = game.at(game.width(), 1), energiaDeComida = -2){
  override method image() = "manzana-podrida.png"
}


class Banana inherits Comida
(position = game.at(game.width(), 1), energiaDeComida = 2){
      override method image() = "banana.png"

}



