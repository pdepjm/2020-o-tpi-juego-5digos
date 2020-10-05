import wollok.game.*
import estructuras.*

object personaje {
	var jugadorVivo = true
	var property direccion = derecha
	var property position = game.at(1,1)
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
	    return direccion.imagePersonaje()
	}
	method agarrar(unaComida){
		unaComida.efectos(self)
	}
	method perder(){
		game.removeVisual(self)
		jugadorVivo = false
	}
}

object izquierda{
	method imagePersonaje() = "CarpIzquierda.png"
	method imagePersonaje2() = "Carp2Izquierda.png"
	method avanzar (position,cantidad) = position.left(cantidad)
}
object derecha{
	method imagePersonaje() = "CarpDerecha.png"
	method imagePersonaje2() = "Carp2Derecha.png"
	method avanzar (position,cantidad) = position.right(cantidad)
}
object arriba{
	method imagePersonaje() = "CarpBack.png"
	method imagePersonaje2() = "Carp2Back.png"
	method avanzar (position,cantidad) = position.up(cantidad)
}
object abajo{
	method imagePersonaje() = "CarpFrente.png"
	method imagePersonaje2() = "Carp2Frente.png"
	method avanzar (position,cantidad) = position.down(cantidad)
}
 
object personaje2 {
	var jugadorVivo = true
	var property direccion = derecha
	var property position = game.at(1,14)
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
	    return direccion.imagePersonaje2()
	}
	method agarrar(unaComida){
		unaComida.efectos(self)
	}
		method perder(){
		game.removeVisual(self)
		jugadorVivo = false
	}
}