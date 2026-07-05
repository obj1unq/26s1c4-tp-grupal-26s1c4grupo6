import obstaculos.*
import wollok.game.*
object spawner {
    const ave = {new Ave(estadoAnimacion = alasArriba, position = game.at(25, 1))}
    const corredor = {new Corredor(estadoAnimacion = corredorUno, position = game.at(25, 1))}
    const auto = {new Auto(estadoAnimacion = autoHumo, position = game.at(25,1))}
    const obstaculos = [ave, corredor, auto]
    
    method iniciar() {
        game.onTick(1500, "Spawn de obstaculos", { self.crearObstaculoRandom() })
    }

    method crearObstaculoRandom() {
        const obstaculoElegido = obstaculos.anyOne()
        const obstaculoNuevo = obstaculoElegido.apply()

        game.addVisual(obstaculoNuevo)
        obstaculoNuevo.moverse()
    }
}
