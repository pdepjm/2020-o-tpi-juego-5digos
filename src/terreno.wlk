import wollok.game.*
import pepita.*
import juego.*

class Pared {
	var property position
	method image() = "muro.png"
}

class Mate{
	var property position
	var property image
}

const mate1 = new Mate(position=game.at(2,5) , image="pepita.png" )
const mate2 = new Mate(position=game.at(10,6) , image="pepita.png" )
const mate3 = new Mate(position=game.at(14,9) , image="pepita.png" )
