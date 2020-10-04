import wollok.game.*
import pepita.*
import villano.*

class Pared {
	var property position
	method esAtravesable() = false
	method image () = "muro.png"
}

class ParedInvisible {
	var property position
	method esAtravesable() = false
	method image () = "muro.png"
}

object paredes{
	method generar(){
		const ancho = game.width() - 1
		const largo = game.height() - 1
		const posParedes = []
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=0))}
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=largo))}
		(0 .. largo).forEach{ n => posParedes.add(new Position(x=0, y=n))}
		(0 .. largo).forEach{ n => posParedes.add(new Position(x=ancho, y=n))}
		posParedes.forEach{ p => game.addVisual(new ParedInvisible(position = p))}	
	}
}

object paredesDentro{
	method generar(){
	const ancho = game.width()
	const posParedes = []
		(1 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=9))}
		(1 .. 5).forEach{ n => posParedes.add(new Position(x=n, y=3))}
		posParedes.forEach{ p => game.addVisual(new Pared(position = p))}	
	}	
}