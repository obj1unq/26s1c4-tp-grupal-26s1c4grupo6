import wollok.game.*

class Comida{ 
    var property position
    var property energiaDeComida
    var property image 

    method choqueCon(personaje){
        personaje.adquirirEnergiaDeComida(self)
        game.removeVisual(self)
    }

}

class Manzana inherits Comida{
//method position
    method energiaDeComida()=30
    method image()="manzana.jpg"
}

class Banana inherits Comida{
    //method position
    method energiaDeComida()=40 
    method image()="banana.jpg"
}