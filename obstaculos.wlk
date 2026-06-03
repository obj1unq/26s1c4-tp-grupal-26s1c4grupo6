import wollok.game.*

class Obstaculo{
    var property position

    method collision(personaje) {
        personaje.perder()
    }

    method movePosition(){
        position = position.left(1)
        
        if (position.x() < 0){
            self.remove()
        }
    }
    
    method remove(){
        game.removeVisual(self)
    }

}
class Pozo inherits Obstaculo{
    method image() = 
}

class Auto inherits Obstaculo{
    method image() =
}

class Corredor inherits Obstaculo{
    method image() =
}

class Ave inherits Obstaculo{
    method image() =
}

