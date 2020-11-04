import wollok.game.*
import niveles.*
import villano.*
import objectos.*

class Paredes{
	var property position
	method esAtravesable() = false
	method esRompible() = false
	method colisionConBala(bala) {
		bala.desaparecer()
		return true
	}
}

class ParedLadrillo inherits Paredes {
	method image () = "muroLadrillo.png"
}
 
class ParedExterior inherits Paredes {
	method image () = "muroExterior.png"
}

class ParedTrucha inherits Paredes {
	method image () = "paredTrucho.png"
	override method esRompible() = true
	override method colisionConBala(bala) {
		bala.desaparecer()
		game.removeVisual(self)
		return true
	}
}

class Cajas{
	var property position
	var property esAtravesable = false
	method esRompible() = true
	method image() = "caja.png"
	method spawnearObjeto(){
		fabricaDePasto.generaUno(position)
		}
	method colisionConBala(bala) {
		bala.desaparecer()
		game.removeVisual(self)
		fabricaDePasto.generaUno(position)
		return true
	}
}

object caja{
	
	method generar(){
		const cajas = []
		(3 .. 3).forEach{ n => cajas.add(new Position(x=1 , y=n))}
		(12 .. 12).forEach{ n => cajas.add(new Position(x=1 , y=n))}
		(6 .. 6).forEach{ n => cajas.add(new Position(x=25 , y=n))}
		(9 .. 9).forEach{ n => cajas.add(new Position(x=25 , y=n))}
		(14 .. 14).forEach{ n => cajas.add(new Position(x=25 , y=n))}
		(7 .. 8).forEach{ n => cajas.add(new Position(x=1, y=n))}
		(1 .. 1).forEach{ n => cajas.add(new Position(x=25 , y=n))}
		(8 .. 8).forEach{ n => cajas.add(new Position(x=n, y=4))}
		(8 .. 8).forEach{ n => cajas.add(new Position(x=n, y=11))}
		(16 .. 16).forEach{ n => cajas.add(new Position(x=n, y=4))}
		(16 .. 16).forEach{ n => cajas.add(new Position(x=n, y=11))}
		(10 .. 10).forEach{ n => cajas.add(new Position(x=n, y=1))}
		(10 .. 10).forEach{ n => cajas.add(new Position(x=n, y=14))}
		(10 .. 10).forEach{ n => cajas.add(new Position(x=n, y=3))}
		(10 .. 10).forEach{ n => cajas.add(new Position(x=n, y=12))}
		(20 .. 20).forEach{ n => cajas.add(new Position(x=n , y=1))}
		(20 .. 20).forEach{ n => cajas.add(new Position(x=n , y=14))}
		(22 .. 22).forEach{ n => cajas.add(new Position(x=n , y=1))}
		(22 .. 22).forEach{ n => cajas.add(new Position(x=n , y=14))}
		(17 .. 17).forEach{ n => cajas.add(new Position(x=n , y=1))}
		(17 .. 17).forEach{ n => cajas.add(new Position(x=n , y=14))}
		cajas.forEach{ p => game.addVisual(new Cajas(position = p))}	
		
	}
}

object paredTrucha{
	
	method generar(){
		const pared = []
		(7 .. 8).forEach{ n => pared.add(new Position(x=14 , y=n))}
		(7 .. 8).forEach{ n => pared.add(new Position(x=18 , y=n))}
		(7 .. 8).forEach{ n => pared.add(new Position(x=21 , y=n))}
		(7 .. 8).forEach{ n => pared.add(new Position(x=9 , y=n))}
		(15 .. 15).forEach{ n => pared.add(new Position(x=n , y=6))}
		(15 .. 15).forEach{ n => pared.add(new Position(x=n , y=9))}
		(17 .. 17).forEach{ n => pared.add(new Position(x=n , y=6))}
		(17 .. 17).forEach{ n => pared.add(new Position(x=n , y=9))}
		(11 .. 12).forEach{ n => pared.add(new Position(x=21 , y=n))}
		(3 .. 4).forEach{ n => pared.add(new Position(x=21 , y=n))}
		(1 .. 3).forEach{ n => pared.add(new Position(x=n , y=4))}
        (1 .. 3).forEach{ n => pared.add(new Position(x=n , y=11))}
		pared.forEach{ p => game.addVisual(new ParedTrucha(position = p))}	
	}
}


object paredesDentro{
	
	method generar(){
	const posParedes = []
	    (22 .. 25).forEach{ n => posParedes.add(new Position(x=n, y=5))}
	    (22 .. 25).forEach{ n => posParedes.add(new Position(x=n, y=10))}
	    (9 .. 10).forEach{ n => posParedes.add(new Position(x=21, y=n))}
	    (5 .. 6).forEach{ n => posParedes.add(new Position(x=21, y=n))}
	    (1 .. 2).forEach{ n => posParedes.add(new Position(x=21, y=n))}
	    (13 .. 14).forEach{ n => posParedes.add(new Position(x=21, y=n))}
		(3 .. 4).forEach{ n => posParedes.add(new Position(x=4, y=n))}
		(3 .. 4).forEach{ n => posParedes.add(new Position(x=5, y=n))}
		(11 .. 12).forEach{ n => posParedes.add(new Position(x=4, y=n))}
		(11 .. 12).forEach{ n => posParedes.add(new Position(x=5, y=n))}
		(7 .. 8).forEach{ n => posParedes.add(new Position(x=4, y=n))}
		(7 .. 8).forEach{ n => posParedes.add(new Position(x=5, y=n))}
		(1 .. 6).forEach{ n => posParedes.add(new Position(x=9, y=n))}
		(9 .. 14).forEach{ n => posParedes.add(new Position(x=9, y=n))}
		(10 .. 11).forEach{ n => posParedes.add(new Position(x=n, y=11))}
		(10 .. 11).forEach{ n => posParedes.add(new Position(x=n, y=4))}
		(6 .. 6).forEach{ n => posParedes.add(new Position(x=14, y=n))}
		(9 .. 9).forEach{ n => posParedes.add(new Position(x=14, y=n))}
		(9 .. 9).forEach{ n => posParedes.add(new Position(x=16, y=n))} 
		(6 .. 6).forEach{ n => posParedes.add(new Position(x=16, y=n))} 
		(9 .. 9).forEach{ n => posParedes.add(new Position(x=18, y=n))}
		(6 .. 6).forEach{ n => posParedes.add(new Position(x=18, y=n))}
		(1 .. 3).forEach{ n => posParedes.add(new Position(x=16, y=n))}
		(12 .. 14).forEach{ n => posParedes.add(new Position(x=16, y=n))}
		posParedes.forEach{ p => game.addVisual(new ParedLadrillo(position = p))}	
	}
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
		posParedes.forEach{ p => game.addVisual(new ParedExterior(position = p))}	
	}
}

