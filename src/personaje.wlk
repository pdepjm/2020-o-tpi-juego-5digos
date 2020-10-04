import wollok.game.*
import estructuras.*

object personaje {
	var jugadorVivo = true
	var property direccion = derecha
	var property position = game.at(2,7)
	method ir(nuevaDireccion){
			direccion = nuevaDireccion
			self.moverse()
		}
	method moverse(){
		if(game.getObjectsIn(direccion.avanzar(position,1)).all({objeto => objeto.esAtravesable()})){
			position = direccion.avanzar(position,1)
		}
	}
	method image (){
	    return direccion.image()
	}
	method perder(){
		game.removeVisual(self)
		jugadorVivo = false
	}
}
object izquierda{
	method image() = "CarpIzquierda.png"
	method avanzar (position,cantidad) = position.left(cantidad)
}
object derecha{
	method image() = "CarpDerecha.png"
	method avanzar (position,cantidad) = position.right(cantidad)
}
object arriba{
	method image() = "CarpBack.png"
	method avanzar (position,cantidad) = position.up(cantidad)
}
object abajo{
	method image() = "CarpFrente.png"
	method avanzar (position,cantidad) = position.down(cantidad)
}

object personaje2 {
	var jugadorVivo = true
	var property direccion = derecha
	var property position = game.at(2,17)
	method ir(nuevaDireccion){
			direccion = nuevaDireccion
			self.moverse()
		}
	method moverse(){
		if(game.getObjectsIn(direccion.avanzar(position,1)).all({objeto => objeto.esAtravesable()})){
			position = direccion.avanzar(position,1)
		}
	}
	method image (){
	    return "pepita.png"
	}
		method perder(){
		game.removeVisual(self)
		jugadorVivo = false
	}
}
