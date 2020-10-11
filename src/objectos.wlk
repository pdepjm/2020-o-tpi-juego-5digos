import wollok.game.*
import niveles.*
import estructuras.*
import personaje.*

class Objetos{
	
	var property position
	
	method esAtravesable()
	
	method desaparecer(){
		game.removeVisual(self)
	}
	
	method image()

}

class Comida inherits Objetos{
	
	var property cura = 50
	
	override method esAtravesable()= true
	
	method curarPersonaje(unPersonaje){
		
		unPersonaje.curarse(cura)
	}
	
	method efectos(unPersonaje){
		
		self.curarPersonaje(unPersonaje)
		
		self.desaparecer()
	}
	
	override method image() ="fish.png"
}

object pescado{
	
	method generaUno(nuevaPosicion){
		
	game.addVisual(new Comida(position = nuevaPosicion))
	
	}
	
	method generar(){
		
	const lugar = [] 
	
	lugar.add(new Position(x=5, y=7))
	
	lugar.add(new Position(x=3, y=14))
	
	lugar.add(new Position(x=17, y=2))
	
	lugar.add(new Position(x=6, y=2))
	
	lugar.forEach{p => game.addVisual(new Comida(position = p))}	
	}
	
}

object mate{
	
		method generar(){
			
		const lugar = [] 
		
		lugar.add(new Position(x=5, y=7))
		
		lugar.add(new Position(x=3, y=14))
		
		lugar.add(new Position(x=17, y=2))
		
		lugar.add(new Position(x=6, y=2))
		
		lugar.forEach{p => game.addVisual(new Comida(position = p))}	
	}
}








