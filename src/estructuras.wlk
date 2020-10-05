import wollok.game.*
import niveles.*
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
		posParedes.forEach{ p => game.addVisual(new ParedInvisible(position = p))}	
	}
}

object paredesDentro{
	method generar(){
	const posParedes = []
		(4 .. 6).forEach{ n => posParedes.add(new Position(x=6, y=n))}
		(4 .. 6).forEach{ n => posParedes.add(new Position(x=7, y=n))}
		(4 .. 6).forEach{ n => posParedes.add(new Position(x=8, y=n))}
		(9 .. 11).forEach{ n => posParedes.add(new Position(x=6, y=n))}
		(9 .. 11).forEach{ n => posParedes.add(new Position(x=7, y=n))}
		(9 .. 11).forEach{ n => posParedes.add(new Position(x=8, y=n))}
		(4 .. 6).forEach{ n => posParedes.add(new Position(x=21, y=n))}
		(4 .. 6).forEach{ n => posParedes.add(new Position(x=20, y=n))}
		(4 .. 6).forEach{ n => posParedes.add(new Position(x=19, y=n))}
		(9 .. 11).forEach{ n => posParedes.add(new Position(x=21, y=n))}
		(9 .. 11).forEach{ n => posParedes.add(new Position(x=20, y=n))}
		(9 .. 11).forEach{ n => posParedes.add(new Position(x=19, y=n))}
		posParedes.forEach{ p => game.addVisual(new Pared(position = p))}	
	}	
}
