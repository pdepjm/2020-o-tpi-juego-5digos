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

const villano1 = new Villano(position=game.at(10,3))
const villano2 = new Villano(position=game.at(3,1))
const villano3 = new Villano(position=game.at(4,2))
