import wollok.game.*
import personaje.*
import villano.*
import estructuras.*
import objectos.*

object elJuegoDelCarpincho{
	method iniciar() {
		self.configurarJuego()
		self.agregarPersonajes()
		self.configurarTeclas()
		paredes.generar()
		pescado.generar()
		paredesDentro.generar()
		villanos.generar()
		game.onCollideDo(personaje,{villano => villano.chocasteCarpincho()})
		game.onCollideDo(personaje2,{villano => villano.chocasteCarpincho()})
		game.onCollideDo(personaje,{unaComida => personaje.agarrar(unaComida)})
		game.onCollideDo(personaje2,{unaComida => personaje2.agarrar(unaComida)})
		game.start()
	} 
	method configurarJuego() {
		game.title("Escape De los Carpinchos")
		game.width(35)
		game.height(19)
		game.ground("sueloClaro.png")
	}
	method agregarPersonajes() {
		game.addVisual(personaje)
		game.addVisual(personaje2)
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




