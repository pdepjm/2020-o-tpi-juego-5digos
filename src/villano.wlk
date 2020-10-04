import wollok.game.*
import pepita.*
import personaje.*

class Villano{
	var property position
	
	method esAtravesable() = true

	method chocasteCarpincho(){
		game.say(self, "jaja, sentate breo")
		personaje.perder()
		personaje2.perder()
		game.schedule(5000, {game.stop()})
	} 
	method image() ="ZombieDerecha.png"
}

object villanos{
	method generar(){
		const villanos = []
		villanos.add(new Position(x=4, y=16))
		villanos.add(new Position(x=6, y=5))
		villanos.add(new Position(x=15, y=13))
		villanos.add(new Position(x=10, y=8))
		villanos.forEach{ p => game.addVisual(new Villano(position = p))}
	}
}

