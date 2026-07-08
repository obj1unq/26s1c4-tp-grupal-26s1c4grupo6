import wollok.game.*
import forest.*
import comidas.*
import spawner.*
import obstaculos.*
import score.*
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
//
//object forestRun {
//
//    method iniciar() {
//        game.title("Forest Run")
//        game.height(9)
//        game.width(16)
//        game.cellSize(50)
//        self.configurarNivel()
//        game.start()
//    }
//
//    method configurarNivel() {
//        game.clear() 
//        game.boardGround("fondo-nivel-1.gif")
//        forest.reiniciar() // Hacer, reiniciar los atributos de forest
//        game.addVisual(forest)
//        game.addVisual(manzana)
//        self.movimientos()
//        forest.correr()
//        spawner.iniciar()
//        keyboard.r().onPressDo({ self.configurarNivel() })
//        game.onCollideDo(forest, { objeto => objeto.choqueCon(forest) })
//    }
//
//    method movimientos(){
//        keyboard.up().onPressDo({forest.saltar()})
//        keyboard.c().onPressDo({self.comerSiHayComida()})
//    }
//
//    method comerSiHayComida(){
//        if(self.hayObjetosDondeForest()){
//            game.uniqueCollider(forest).choqueCon(forest)
//        }
//    }
//
//    method hayObjetosDondeForest(){
//        return not game.colliders(forest).isEmpty()
//    }
//    
//    method terminar() {
//        game.say(forest, "¡Perdiste! Presioná R para reiniciar.")
//    }
//}
//
object forestRun {
    var estaJugando = false

    method iniciar() {
        game.title("Forest Run")
        game.height(9)
        game.width(16)
        game.cellSize(50)

        self.reiniciar()
        game.start()
    }

    method reiniciar() {
        game.clear()
        spawner.detener()
        game.removeTickEvent("movimientoDeForest")
        game.removeTickEvent("sumarScore")

        game.boardGround("fondo-nivel-1.gif")
        forest.reiniciar()
        score.reiniciar()

        game.addVisual(forest)
        game.addVisual(energiaForest)
        game.addVisual(score)

        forest.correr()
        spawner.iniciar()
        game.onTick(200, "sumarScore", { score.sumarPunto() })

        self.movimientos()
        keyboard.r().onPressDo({ self.reiniciar() })
        game.onCollideDo(forest, { objeto => objeto.choqueCon(forest) })

        estaJugando = true
    }

    method movimientos() {
        keyboard.up().onPressDo({ if (estaJugando) forest.saltar() })
        keyboard.down().onPressDo({ if (estaJugando) forest.agacharse() })
    }

    method terminar(motivo) {
        estaJugando = false
        spawner.detener()
        game.removeTickEvent("movimientoDeForest")
        game.removeTickEvent("sumarScore")
        game.say(forest, "¡Perdiste! " + motivo + " Marcador: " + score.puntos().toString() + ". Presioná R para reiniciar.")
    }

   
}