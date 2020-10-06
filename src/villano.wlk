import wollok.game.*
import niveles.*
import personaje.*


class Villano{
	var property position
	var property direccion = abajo
	var indice
	
	method esAtravesable() = true

	method chocasteCarpincho() {
		game.say(self, "jaja, sentate breo")
		personaje.perder()
		personaje2.perder()
		game.schedule(5000, {game.stop()})
	} 
	method image() ="ZombieDerecha.png"
	/*
	method nuevaPosicion(){
		const x = 0.randomUpTo(game.width()).truncate(0)
		const y = 0.randomUpTo(game.height()).truncate(0)
		position = game.at(x,y) 
	}*/ 
	/* 
	method ir(nuevaDireccion){
			direccion = nuevaDireccion
			self.moverse()
		}
	
	method moverse(){
		if(game.getObjectsIn(direccion.avanzar(position,1)).all({objeto => objeto.esAtravesable()})){
			position = direccion.avanzar(position,1)
	}
}*/

    method moverse(){
    	indice = [1,2,3,4].anyOne()
    	self.moverseHacia(indice)
    }
    
    /*
    method moverseHacia(unIndice){
    	if (unIndice == 1){ position = position.up(1)}
    	if (unIndice == 2) {position = position.down(1)}
    	if (unIndice == 3) {position = position.left(1)}
    	if (unIndice == 4) {position = position.right(1)}
    }*/ 
    
    method moverseHacia(unIndice){
    	if (unIndice == 1){ self.irHaciaArriba()}
    	if (unIndice == 2) {self.irHaciaAbajo()}
    	if (unIndice == 3) {self.irHaciaDerecha()}
    	if (unIndice == 4) {self.irHaciaIzquierda()}
    }
    
    method irHaciaArriba(){
    	if(game.getObjectsIn(arriba.avanzar(position,1)).all({objeto => objeto.esAtravesable()})){
    		position = arriba.avanzar(position,1)
    	}
    	
    }
    
     method irHaciaAbajo(){
    	if(game.getObjectsIn(abajo.avanzar(position,1)).all({objeto => objeto.esAtravesable()})){
    		position = abajo.avanzar(position,1)
    	}
    }
    
    method irHaciaIzquierda(){
    	if(game.getObjectsIn(izquierda.avanzar(position,1)).all({objeto => objeto.esAtravesable()})){
    		position = izquierda.avanzar(position,1)
    	}
    }
    
    method irHaciaDerecha(){
    	if(game.getObjectsIn(derecha.avanzar(position,1)).all({objeto => objeto.esAtravesable()})){
    		position = derecha.avanzar(position,1)
    	}
    }
}

object generadorDeVillanos{
	/* 
	method generar(){
		const posicionesDeVillanos = []
		posicionesDeVillanos.add(new Position(x=3, y=16))
		posicionesDeVillanos.add(new Position(x=5, y=5))
		posicionesDeVillanos.add(new Position(x=15, y=13))
		posicionesDeVillanos.add(new Position(x=10, y=8))
		posicionesDeVillanos.forEach{ p => game.addVisual(new Villano(position = p))}
		game.onTick(3000, "movimiento", {posicionesDeVillanos.forEach({villano => villano.nuevaPosicion()}) }) 
	}
	*/
	
	method generarVillanos(){
		const villanos = []
		const villano1 = new Villano(position = game.at(3,9), indice = 0)
		const villano2 = new Villano (position = game.at(5,5), indice = 0)
	    const villano3 = new Villano (position = game.at(15,13), indice = 0)
	    const villano4 = new Villano (position = game.at(10,8), indice = 0)	
	    villanos.add(villano1)
	    villanos.add(villano2)
	    villanos.add(villano3)
	    villanos.add(villano4)
	    villanos.forEach{villano => game.addVisual(villano)}
	    game.onTick(3000, "movimiento", {villanos.forEach({villano => villano.moverse()}) }) 
	}

}







