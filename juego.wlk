import wollok.game.*
import forest.*
import comidas.*
import spawner.*
import obstaculos.*
import score.*
object forestRun {
    var estaJugando = false
    var enMenu = true

    method iniciar() {
        game.title("Forest Run")
        game.height(9)
        game.width(16)
        game.cellSize(50)
        game.boardGround("fondo-nivel-1.gif")
        game.start()
        self.mostrarMenu()
    }

    method mostrarMenu() {
        game.clear()
        enMenu = true
        game.addVisual(menu)

        keyboard.s().onPressDo({
            if (enMenu) self.comenzarJuego()
        })
    }

    method comenzarJuego() {
        enMenu = false
        game.removeVisual(menu)
        self.reiniciar()
    }

    method reiniciar() {
        game.clear()
        spawner.detener()
        game.removeTickEvent("movimientoDeForest")
        game.removeTickEvent("sumarScore")
        
       
        forest.reiniciar()
        score.reiniciar()

        game.addVisual(forest)
        game.addVisual(energiaForest)
        game.addVisual(score)

        forest.correr()
        spawner.iniciar()
        game.onTick(200, "sumarScore", { score.sumarPunto() })

        self.movimientos()

        estaJugando = true
    }

    method movimientos() {
        keyboard.up().onPressDo({ if (estaJugando) forest.saltar() })
        keyboard.down().onPressDo({ if (estaJugando) forest.agacharse() })
        keyboard.r().onPressDo({ self.reiniciar() })
        game.onCollideDo(forest, { objeto => objeto.choqueCon(forest) })
    }

    method terminar(motivo) {
        estaJugando = false
        spawner.detener()
        game.removeTickEvent("movimientoDeForest")
        game.removeTickEvent("sumarScore")
        game.say(forest, "¡Perdiste! " + motivo + " Marcador: " + score.puntos().toString() + ". Presioná R para reiniciar.")
    }
}

object menu {
    method position() = game.at(2,1)
    method image() = "forestMenu.png"
}