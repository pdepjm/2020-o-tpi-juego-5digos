import wollok.game.*
import pepita.*
import personaje.*

class Villano{
	var property position
	method image() ="jugador.png"
	
	method esAtravesable() = true

	method chocasteCarpincho(){
		game.say(self, "jaja pt")
		personaje.perder()
		personaje2.perder()
		game.schedule(5000, {game.stop()})
	}
}

object villanos{
	method generar(){
		const villanos = []
		villanos.add(new Position(x=4, y=19))
		villanos.add(new Position(x=12, y=5))
		villanos.add(new Position(x=9, y=13))
		villanos.add(new Position(x=10, y=8))
		villanos.forEach{ p => game.addVisual(new Villano(position = p))}
	}
}
