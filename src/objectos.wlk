import wollok.game.*
import niveles.*
import estructuras.*
import personaje.*

class Objetos {
	
	var property position
	
	method esAtravesable() = true
	
	method desaparecer(){
		
		game.removeVisual(self)
	}
	
	method image()

}

class Comida inherits Objetos {
	
	var property cura = 30
	
	method curarPersonaje(unPersonaje){
		
		unPersonaje.curarse(cura)
	}
	
	method efectos(unPersonaje){
		
		self.curarPersonaje(unPersonaje)
		
		self.desaparecer()
	}
}

class Pescado inherits Comida{//habria q cambiarlo a pasto
	
	override method image() ="pasto.png"
	
}

object pescado inherits Pescado{
	
	method generaUno(nuevaPosicion){
		
	    game.addVisual(new Pescado(position = nuevaPosicion))
	
	}
	
	method generar(){
		
	const lugar = [] 
	
	lugar.add(new Position(x=5, y=7))
	
	lugar.add(new Position(x=3, y=14))
	
	lugar.add(new Position(x=17, y=2))
	
	lugar.add(new Position(x=6, y=2))
	
	lugar.forEach{p => game.addVisual(new Pescado(position = p))}	
	}
	
}

class Mate inherits Comida{
	
	//falta imagen

}

object mate{
	
	method generar(){
			
	const lugar = [] 
		
		lugar.add(new Position(x=5, y=7))
		
		lugar.add(new Position(x=3, y=14))
		
		lugar.add(new Position(x=17, y=2))
		
		lugar.add(new Position(x=6, y=2))
		
		lugar.forEach{p => game.addVisual(new Pescado(position = p))}	
	}
}

class Balas inherits Objetos{
	
	//falta imagen

}

class Llaves inherits Objetos{
	
	//falta imagen

}
