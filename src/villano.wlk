import wollok.game.*
import niveles.*
import personaje.*
import movimientos.*

class Villano{
	var property position
	var property vida = 100
	var property danio = 45
	var nuevaDireccion
	
	method esAtravesable() = true
	
	method recivirDanio(danioBala){
		vida = (vida-danioBala).max(0)
		if(vida==0){self.morir()}
	}
	
	method morir(){
		game.removeVisual(self)
		}

	method chocasteCarpincho(unPersonaje) {
		game.say(self, "jaja, EZ PT")
		self.hacerDanio(unPersonaje)
	}
	
	method hacerDanio(unPersonaje){
		unPersonaje.recivirDanio(danio)
	}

	method image() ="ZombieDerecha.png"

    method moverse(){
    	
    nuevaDireccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()
    
   	    self.moverseHacia(nuevaDireccion)
    }
    method moverseHacia(direccion){
    	
        if(self.todosObjetosAtravesables()){
    		position = direccion.avanzar(position,1)
    	    }
    }
//--------------------------
    method objetosDelante()=game.getObjectsIn(nuevaDireccion.avanzar(position,1))
	
    method todosObjetosAtravesables() = self.objetosDelante().all({objeto => objeto.esAtravesable()})
//--------------------------
}

object generadorDeVillanos{

	method generarVillanos(){
		const villanos = []
		const villano1 = new Villano(position = game.at(3,9),nuevaDireccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
		const villano2 = new Villano (position = game.at(5,5),nuevaDireccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano3 = new Villano (position = game.at(15,13),nuevaDireccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano4 = new Villano (position = game.at(10,8),nuevaDireccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())	
	    villanos.add(villano1)
	    villanos.add(villano2)
	    villanos.add(villano3)
	    villanos.add(villano4)
	    villanos.forEach{villano => game.addVisual(villano)}
	    game.onTick(1000, "movimiento", {villanos.forEach({villano => villano.moverse()})}) 
	}

}







