import wollok.game.*
import niveles.*
import personaje.*


class Villano{
	var property position
	var property direccion = abajo
	
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
	
	method ir(nuevaDireccion){
			direccion = nuevaDireccion
			self.moverse()
		}
	
	method moverse(){
		if(game.getObjectsIn(direccion.avanzar(position,1)).all({objeto => objeto.esAtravesable()})){
			position = direccion.avanzar(position,1)
	}
}
}

object villanos{
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
		const villano1 = new Villano(position = game.at(3,9))
		const villano2 = new Villano (position = game.at(5,5))
	    const villano3 = new Villano (position = game.at(15,13))
	    const villano4 = new Villano (position = game.at(10,8))	
	    villanos.add(villano1)
	    villanos.add(villano2)
	    villanos.add(villano3)
	    villanos.add(villano4)
	    villanos.forEach{villano => game.addVisual(villano)}
	    game.onTick(3000, "movimiento", {villanos.forEach({villano => villano.moverse()}) }) 
	}

}







