import wollok.game.*
import niveles.*
import estructuras.*
import personaje.*
import balas.*

class Objetos {
	
	var property position
	
	method esAtravesable() = true
	
	method desaparecer(){
		
		game.removeVisual(self)
	}
	
	method image()

}

class Comida inherits Objetos {
	
	var property cura = 33
	
	method curarPersonaje(unPersonaje){
		unPersonaje.curarse(cura)
	}
	
	method efectos(unPersonaje){
		
		self.curarPersonaje(unPersonaje)
		
		unPersonaje.imagenVida()
		
		self.desaparecer()
	}
			
	method chocasteCarpincho(unPersonaje){

		self.efectos(unPersonaje)
	}
}

class PowerUp inherits Objetos{
	
	var property cura = 100
	
	method curarPersonaje(unPersonaje){
		
		unPersonaje.curarse(cura)
	}
	
	method efectos(unPersonaje){
		
		self.curarPersonaje(unPersonaje)
		
		unPersonaje.imagenVida()
		
		self.desaparecer()
	}
	
	method chocasteCarpincho(unPersonaje){
		
		self.efectos(unPersonaje)
	}
}

class Pasto inherits Comida{//habria q cambiarlo a pasto
	
	override method image() ="pasto.png"
	
}

object pasto inherits Pasto{
	
	method generaUno(nuevaPosicion){
		
	    game.addVisual(new Pasto(position = nuevaPosicion))
	
	}
	
	method generar(){
		
	const lugar = [] 
	
	lugar.add(new Position(x=5, y=7))
	
	lugar.add(new Position(x=3, y=14))
	
	lugar.add(new Position(x=17, y=2))
	
	lugar.add(new Position(x=6, y=2))
	
	lugar.forEach{p => game.addVisual(new Pasto(position = p))}	
	}
	
}

class Mate inherits PowerUp{
	
	override method image() ="mate.png"

}

object mate{
	
	method generaUno(nuevaPosicion){
		
	    game.addVisual(new Mate(position = nuevaPosicion))
	
	}
	
	method generar(){
			
	const lugar = [] 
		
		lugar.add(new Position(x=6, y=8))
		
		lugar.add(new Position(x=4, y=14))
		
		lugar.add(new Position(x=18, y=3))
		
		lugar.add(new Position(x=7, y=3))
		
		lugar.forEach{p => game.addVisual(new Mate(position = p))}	
	}
}

class Balas inherits Objetos{
	
	var property direccion
	override method image() = "fish.png"
	
	
	method seguirCurso(){
		
		position = (direccion.cambioABala() ).avanzar(position, 1)
	}
	
	
	method desaparecer(){
		game.removeVisual(self)
	}
	
	
	//falta imagen

}

object balas{
 	method generarBalas(persona){
 		var bala = new Balas (position = persona.position(), direccion = persona.direccion())
 		game.addVisual(bala)
 		game.onTick(1000, "disparo" , {bala.seguirCurso()})
 		game.onCollideDo(bala, { colicionado =>
			colicionado.colicionConBala(bala)
			 
			})
 		
 	}
 }




/*
class Llaves inherits Objetos{
	
	//falta imagen

}*/
