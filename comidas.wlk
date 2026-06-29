import wollok.game.*

class Comida{ 
    var property position
    var property energiaDeComida
    var property image 

    method choqueCon(personaje){
        personaje.comer(self)
        game.removeVisual(self)
    }

}

object manzana inherits Comida{
    method initialize() {
        position = game.at(0, 1)//falta desplazamiento
        image = "manzana.png"
        energiaDeComida = 30
    }
}

class Banana inherits Comida{
    method initialize() {
        position = game.at(0, 1) //falta desplazamiento
        image = "banana.png"
        energiaDeComida = 40
    }
}

