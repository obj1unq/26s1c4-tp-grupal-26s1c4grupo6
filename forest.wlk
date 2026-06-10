import wollok.game.*
import comidas.*
object forest{
    var property image = "forest-parado.png"
    var property position = game.at(0,1)
    var property energia

    method moverse(){
        game.onTick(100, "movimientoDeForest" ,{self.forestCorriendo()})
    } 
    method forestCorriendo(){
        if(self.image()=="forest-parado.png"){
            image="forest-corriendo.png"
        }else{
            image="forest-parado.png"
        }
    }

    method comer(comida){
            game.onCollideDo(comida, {comida.choqueCon(self)})
    }

    method adquirirEnergiaDeComida(comida){
        energia= energia + comida.energiaDeComida()
    }
}

