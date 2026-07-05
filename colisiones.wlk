import wollok.game.*
import forest.*
import comidas.*

object juego{
	method movimientos(){
        keyboard.up().onPressDo({forest.saltar()})
        keyboard.c().onPressDo({self.comerSiHayComida()})
    }

    method comerSiHayComida(){
        if(self.hayObjetosDondeForest()){
            game.uniqueCollider(forest).choqueCon(forest)
        }
    }

    method hayObjetosDondeForest(){
        return not game.colliders(forest).isEmpty()
    }
}
