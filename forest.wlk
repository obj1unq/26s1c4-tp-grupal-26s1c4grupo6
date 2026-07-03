import wollok.game.*
import comidas.*
object forest{
    var property image = "forest-parado.png"
    var property position = game.at(0,1)
    var property energia=100

    method forestCorriendo(){
        if(self.image()=="forest-parado.png"){
            image="forest-corriendo.png"
        }else{
            image="forest-parado.png"
        }
    }


    method correr(){
        game.onTick(100, "movimientoDeForest" ,{self.forestCorriendo()})
    } 
    method comer(comida){
         energia= energia + comida.energiaDeComida()       
    }

    method saltar(){
        position=self.position().up(1)
        game.schedule(300, { position = self.position().down(1) })       
    }
}
