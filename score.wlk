import wollok.game.*

object score {
    var puntos = 0
    const cantidadDigitos = 5
    const property position = game.at(1, 8)

    method puntos() = puntos

    method sumarPunto() {
        puntos += 1
    }

    method reiniciar() {
        puntos = 0
    }

    method text() = self.conCeros(puntos)

    method conCeros(numero) {
        var texto = numero.toString()
        const faltantes = cantidadDigitos - texto.length()
        if (faltantes > 0) {
            faltantes.times({ i => texto = "0" + texto })
        }
        return texto
    }

    method textColor() = "FFFFFF"
}