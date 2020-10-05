import wollok.game.*
import personaje.*
import villano.*
import estructuras.*
import objectos.*

object nivel0 {

	var property position = game.origin()
	var image = "menu.png"

	method image() = image

	method iniciar() {
		game.addVisual(self)
		keyboard.enter().onPressDo({ game.removeVisual(self)
			nivel1.iniciar()
		})
	}

}

object nivel1{
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
	} 
	
	method configurarJuego() {
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
		
		keyboard.w().onPressDo{personaje2.ir(arriba)}
		keyboard.s().onPressDo{personaje2.ir(abajo)}
		keyboard.a().onPressDo{personaje2.ir(izquierda)}
		keyboard.d().onPressDo{personaje2.ir(derecha)}
	}
}