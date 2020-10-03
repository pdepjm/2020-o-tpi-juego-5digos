import wollok.game.*
import estructuras.*
import villano.*



object carpincho {
    var property jugadorVivo = true
	var property position = game.at(9,7)
	var property image="CarpDerecha.png"
	
	method subir(){
		self.moverseA(position.up(0.25))
		self.image("CarpBack.png")
	}
	method bajar(){
		self.moverseA(position.down(0.25))
		self.image("CarpFrente.png")
	}
	method izquierda(){
		self.moverseA(position.left(0.25))
		self.image("CarpIzquierda.png")
	}
	method derecha(){
		self.moverseA(position.right(0.25))
		self.image("CarpDerecha.png")
	}
	method moverseA(pos){
		//falta poner reestriccion para los muros
			position = pos
	}
	method agarrar(unMate){
		unMate.desaparecer()
	}
	method perdiste(){
		mapa.remover(position)
		game.removeVisual(self)
		jugadorVivo = false
	}
}
