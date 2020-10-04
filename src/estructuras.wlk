import wollok.game.*
import pepita.*
import villano.*

class Pared {
	var property position
	method esAtravesable() = false
	method image () = "muroLadrillo.png"
}
 
class ParedInvisible {
	var property position
	method esAtravesable() = false
	method image () = "muroExterior.png"
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
		(1 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=largo/2))}
		posParedes.forEach{ p => game.addVisual(new ParedInvisible(position = p))}	
	}
}

object paredesDentro{
	method generar(){
	const posParedes = []
		(1 .. 4).forEach{ n => posParedes.add(new Position(x=2, y=n))}
		(6 .. 8).forEach{ n => posParedes.add(new Position(x=2, y=n))}
		(11 .. 13).forEach{ n => posParedes.add(new Position(x=2, y=n))}
		(15 .. 17).forEach{ n => posParedes.add(new Position(x=2, y=n))}
		posParedes.forEach{ p => game.addVisual(new Pared(position = p))}	
	}	
}
