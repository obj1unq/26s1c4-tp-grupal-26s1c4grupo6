import wollok.game.*
import comidas.*
object forest{
    var property image = "forest-parado.png"
    var property position = game.at(0,1)
    var property energia=8


    method agacharse(){
        game.removeTickEvent("movimientoDeForest")
        position = game.at(0,0)
        image="forest-agachado.png"
        game.schedule(300, {position = game.at(0,1)
                            self.correr()           
                            }
                     )
    }

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
object energiaForest{
    method image()=forest.energia().toString() + "v.png"
    method position() = game.at(1,forest.position().y()+3)
}
