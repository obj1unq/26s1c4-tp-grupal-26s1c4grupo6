import colisiones.*
import wollok.game.*
import comidas.*
object forest{
    var property image = "forest-parado.png"
    var property position = game.at(0,1)
    var property energia=8

    method forestCorriendo(){
        if(self.image()=="forest-parado.png"){
            image="forest-corriendo.png"
        }else{
            image="forest-parado.png"
        }
    }


    method perderSiEstaCansado(){
        if (self.estaCansado()) {
            self.perder("¡Te cansaste!") 
        }
    }

    method bajarEnergia(cantidad){
        energia=(energia-cantidad).max(0)
        self.perderSiEstaCansado()
    }

    method estaCansado(){
        return energia==0
    }
    method correr(){
        game.onTick(100, "movimientoDeForest" ,{self.forestCorriendo()})
    } 
    method comer(comida){
         energia= (energia + comida.energiaDeComida()).min(10)   
    }

    method saltar(){
        position=self.position().up(1)
        game.schedule(400, { position = self.position().down(1) })  
        self.bajarEnergia(2)
    }
    method agacharse(){
        game.removeTickEvent("movimientoDeForest")
        position = game.at(0,0)
        self.bajarEnergia(1)
        image="forest-agachado.png"
        game.schedule(400, {position = game.at(0,1)
                            self.correr()           
                            }
                     )
    }
    method reiniciar(){
        energia = 10
    }
    method perder(motivo) {
        forestRun.terminar(motivo)
    }    
}

object energiaForest{
    method image()=forest.energia().toString() + ".png"
    method position() = game.at(1,forest.position().y()+3)
}
