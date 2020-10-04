import wollok.game.*
import personaje.*
import villano.*
import estructuras.*

object elJuegoDelCarpincho{
	method iniciar() {
		self.configurarJuego()
		self.agregarPersonajes()
		self.configurarTeclas()
		paredes.generar()
		paredesDentro.generar()
		game.onCollideDo(personaje,{villano => villano.chocasteCarpincho()})
		game.start()
	}
	method configurarJuego() {
		game.title("Escape De los Carpinchos")
		game.width(35)
		game.height(19)
		game.boardGround("suelo.png")
	}
	method agregarPersonajes() {
		game.addVisual(personaje)
		game.addVisual(personaje2)
		game.addVisual(villano1)
	}
	method configurarTeclas() {
		keyboard.up().onPressDo{personaje.ir(arriba)}
		keyboard.down().onPressDo{personaje.ir(abajo)}
		keyboard.left().onPressDo{personaje.ir(izquierda)}
		keyboard.right().onPressDo{personaje.ir(derecha)}
		
		keyboard.up().onPressDo{personaje2.ir(arriba)}
		keyboard.down().onPressDo{personaje2.ir(abajo)}
		keyboard.left().onPressDo{personaje2.ir(izquierda)}
		keyboard.right().onPressDo{personaje2.ir(derecha)}
	}
}


