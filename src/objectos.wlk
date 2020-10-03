import wollok.game.*
import pepita.*
import juego.*
import estructuras.*

class Mate{
	var property position
	
    method image(){
    	return "muro.png"
    }
	method desaparecer(){
		mapa.remover(position)
		game.removeVisual(self)
	}
	method mostrar(){
		game.addVisual(self)
		mapa.agregar(position)
	}
}


