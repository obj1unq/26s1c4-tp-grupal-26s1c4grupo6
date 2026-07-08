import wollok.game.*
import forest.*
import comidas.*

object juego{
	method movimientos(){
        keyboard.up().onPressDo({forest.saltar()})
        keyboard.c().onPressDo({self.comerSiHayComida()})
        keyboard.down().onPressDo({ forest.agacharse() })
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


