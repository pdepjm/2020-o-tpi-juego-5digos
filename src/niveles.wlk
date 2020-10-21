import wollok.game.*
import personaje.*
import villano.*
import estructuras.*
import objectos.*
import movimientos.*
import balas.*

object nivel0 { 

	var property position = game.origin()
	const image = "menu.png"

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
		pasto.generar()
		mate.generar()
		paredesDentro.generar()
		caja.generar()
		paredTrucha.generar()
		generadorDeVillanos.generarVillanos()
		game.addVisual(barraVidaP1)
		game.addVisual(barraVidaP2)
		game.onCollideDo(personaje,{villano => villano.chocasteCarpincho(personaje)})
		game.onCollideDo(personaje2,{villano => villano.chocasteCarpincho(personaje2)})
		game.onCollideDo(personaje,{unaComida => personaje.agarrar(unaComida)})
		game.onCollideDo(personaje2,{unaComida => personaje2.agarrar(unaComida)})
	} 
	
	method configurarJuego() {
		game.ground("sueloClaro.png")
	}
		
	method agregarPersonajes() {
		personaje.iniciarP()
		personaje2.iniciarP()
		barraVidaP1.iniciarB()
		barraVidaP2.iniciarB()
		game.addVisual(personaje)
		game.addVisual(personaje2)
	}
	method configurarTeclas() {
		keyboard.up().onPressDo{personaje.ir(carpinchoRickArriba)}
		keyboard.down().onPressDo{personaje.ir(carpinchoRickAbajo)}
		keyboard.left().onPressDo{personaje.ir(carpinchoRickIzquierda)}
		keyboard.right().onPressDo{personaje.ir(carpinchoRickDerecha)}
	
		keyboard.w().onPressDo{personaje2.ir(carpinchoMortyArriba)}
		keyboard.s().onPressDo{personaje2.ir(carpinchoMortyAbajo)}
		keyboard.a().onPressDo{personaje2.ir(carpinchoMortyIzquierda)}
		keyboard.d().onPressDo{personaje2.ir(carpinchoMortyDerecha)}
		
		keyboard.f().onPressDo{personaje.disparar()}
		keyboard.p().onPressDo{personaje2.disparar()}
		
		}
	}


