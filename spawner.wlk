import obstaculos.*
import wollok.game.*
//object spawner {
//    const ave = {new Ave(estadoAnimacion = alasArriba, position = game.at(25, 1))}
//    const corredor = {new Corredor(estadoAnimacion = corredorUno, position = game.at(25, 1))}
//    const auto = {new Auto(estadoAnimacion = autoHumo, position = game.at(25,1))}
//    const obstaculos = [ave, corredor, auto]
//    
//    method iniciar() {
//        game.onTick(1500, "Spawn de obstaculos", { self.crearObstaculoRandom() })
//    }
//
//    method crearObstaculoRandom() {
//        const obstaculoElegido = obstaculos.anyOne()
//        const obstaculoNuevo = obstaculoElegido.apply()
//
//        game.addVisual(obstaculoNuevo)
//        obstaculoNuevo.moverse()
//    }
//}
object spawner {
    var contador = 0
    var obstaculosActivos = []

    const ave = {new Ave(id = "ave", estadoAnimacion = alasArriba, position = game.at(25, 2))}
    const corredor = {new Corredor(id = "corredor", estadoAnimacion = corredorUno, position = game.at(25, 1))}
    const auto = {new Auto(id = "auto",estadoAnimacion = autoHumo, position = game.at(25,1))}
    const obstaculos = [ave, corredor, auto]
    

    method iniciar() {
        contador = 0
        obstaculosActivos = []
        game.onTick(1500, "Spawn de obstaculos", { self.crearObstaculoRandom() })
    }

    method crearObstaculoRandom() {
        const obstaculoElegido = obstaculos.anyOne()
        const obstaculoNuevo = obstaculoElegido.apply()
        contador = contador + 1
        obstaculoNuevo.id(contador)

        obstaculosActivos.add(obstaculoNuevo)
        game.addVisual(obstaculoNuevo)
        obstaculoNuevo.moverse()
    }

    method quitar(obstaculo) {
        obstaculosActivos.remove(obstaculo)
    }

    method detener() {
        game.removeTickEvent("Spawn de obstaculos")
        obstaculosActivos.forEach { obstaculo =>
            game.removeTickEvent(obstaculo.nombreTick())
            game.removeVisual(obstaculo)
        }
        obstaculosActivos = []
    }
}
