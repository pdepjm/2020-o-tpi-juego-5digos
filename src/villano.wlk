import wollok.game.*
import pepita.*
import juego.*
import personaje.*

class Villano{
	var property position
	var property image="ZombieIzquierda.png"
	
	method chocasteCarpincho(){
//		terminar el juego
		game.say(self, "jaja pt")
		carpincho.perdiste()
		game.schedule(5000, { game.stop()})
	}
}

const villano1 = new Villano(position=game.at(2,7))
const villano2 = new Villano(position=game.at(8,7))
const villano3 = new Villano(position=game.at(10,9))
