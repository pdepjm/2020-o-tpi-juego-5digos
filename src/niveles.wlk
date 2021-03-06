import wollok.game.*
import personaje.*
import villano.*
import estructuras.*
import objectos.*
import movimientos.*
import balas.*

object menuPrincipal { 

	var property position = game.origin()
	var property image = "menu.png"

	method iniciar() {
		game.addVisual(self)
		keyboard.enter().onPressDo({ game.removeVisual(self) juego.iniciar()})
	}
}

object juego{
	method iniciar() {
		self.configurarJuego()
		self.agregarPersonajes()
		self.configurarTeclas()
		self.agregarParedes()
		self.agregarVillanos()
		self.agregarBarraDeVida()
		self.agregarContadorMunicion()
		game.onCollideDo(personaje,{villano => villano.chocasteCarpincho(personaje)})
		game.onCollideDo(personaje2,{villano => villano.chocasteCarpincho(personaje2)})
		game.onCollideDo(personaje,{objeto => personaje.agarrar(objeto)})
		game.onCollideDo(personaje2,{objeto => personaje2.agarrar(objeto)})
	} 
	method configurarJuego() {
		game.ground("sueloClaro.png")
	}
	method agregarPersonajes() {
		personaje.iniciarP()
		personaje2.iniciarP()
		barraVidaP1.iniciarB()
		barraVidaP2.iniciarB()
		contadorMunicionP1.iniciarC()
		contadorMunicionP2.iniciarC()
		game.addVisual(personaje)
		game.addVisual(personaje2)
	}
	
	method agregarParedes(){
		paredes.generar()
		paredesDentro.generar()
		caja.generar()
		paredTrucha.generar()
	}
	
	method agregarVillanos(){
		generadorDeVillanos.generarVillanos()
		generarSuperVillano.generarVillanos()
	}
	
	method agregarBarraDeVida(){
		game.addVisual(barraVidaP1)
		game.addVisual(barraVidaP2)
	}
	
	method agregarContadorMunicion(){
		game.addVisual(contadorMunicionP1)
		game.addVisual(contadorMunicionP2)
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
	
object menuGameOver{
	
	var property position = game.origin()
	var property image = "menuGO.png"
	
	method iniciar() {
		game.addVisual(self)
		keyboard.f().onPressDo({game.stop()})
	}
}

object menuGanador{
	
	var property position = game.origin()
	var property image = "menuWin.png"
	
	method iniciar() {
		game.addVisual(self)
		keyboard.w().onPressDo({game.stop()})
	}
}