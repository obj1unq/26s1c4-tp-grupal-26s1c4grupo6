import obstaculos.*
import wollok.game.*
import comidas.*
object spawner {
    var contador = 0
    var obstaculosActivos = []
    const manzana = { new Manzana(id="manzana") }
    const banana = { new Banana(id="banana") }
    const manzanaPodrida = { new ManzanaPodrida(id="manzanaPodrida") }
    const manzanaDorada = { new ManzanaDorada(id="manzanaDorada") }

    const ave = {new Ave(id = "ave", estadoAnimacion = alasArriba, position = game.at(25, 1))}
    const corredor = {new Corredor(id = "corredor", estadoAnimacion = corredorUno, position = game.at(25, 1))}
    const auto = {new Auto(id = "auto",estadoAnimacion = autoHumo, position = game.at(25,1))}
    const obstaculos = [ave, corredor, auto,banana, banana, manzana, manzanaPodrida, manzanaDorada]
    

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
