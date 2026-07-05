import wollok.game.*
import forest.*
import comidas.*
import spawner.*
import obstaculos.*

/*
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
*/

object forestRun {

    method iniciar() {
        game.title("Forest Run")
        game.height(9)
        game.width(16)
        game.cellSize(50)
        self.configurarNivel()
        game.start()
    }

    method configurarNivel() {
        game.clear() 
        game.boardGround("fondo-nivel-1.gif")
        forest.reiniciar() // Hacer, reiniciar los atributos de forest
        game.addVisual(forest)
        game.addVisual(manzana)
        self.movimientos()
        forest.correr()
        spawner.iniciar()
        keyboard.r().onPressDo({ self.configurarNivel() })
        game.onCollideDo(forest, { objeto => objeto.choqueCon(forest) })
    }

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
    
    method terminar() {
        game.say(forest, "¡Perdiste! Presioná R para reiniciar.")
    }
}
