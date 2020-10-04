import wollok.game.*
import pepita.*
import estructuras.*
import personaje.*

class ObjetoEnJuego{
	method image()
	method sufrirDanio(danio, agresor){}
	method agarrarItem(item) {}
	method esAtravesable() = true
}

class Mate inherits ObjetoEnJuego {
	var property position
}

class MuroDeMadera inherits ObjetoEnJuego {
	var property position
}

class Combustible inherits ObjetoEnJuego {
	var property position
}
