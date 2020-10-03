import wollok.game.*
import pepita.*
import terreno.*
import personaje.*
import villano.*
import estructuras.*

object juegos{
	method iniciar() {
		self.configurarJuego()
		self.agregarPersonajes()
		self.agregarVillano()
		self.configurarTeclas()
		self.configurarAcciones()
		game.start()
	}
	method configurarJuego() {
		game.title("Escape De los Carpinchos")
		game.width(30)
		game.height(15)
		game.boardGround("MapaBasicoJPG.jpg")
	}
	method agregarPersonajes() {
		game.addVisualCharacter(carpincho)
	}
	method agregarVillano(){
		game.addVisual(villano1)
		game.addVisual(villano2)
		game.addVisual(villano3)
	}
	method configurarTeclas() {
		keyboard.up().onPressDo({carpincho.subir()})
		keyboard.down().onPressDo({carpincho.bajar()})
		keyboard.left().onPressDo({carpincho.izquierda()})
		keyboard.right().onPressDo({carpincho.derecha()})
	}
	method configurarAcciones() {
		game.onCollideDo(carpincho, { visualColisionado => visualColisionado.chocasteCarpincho()})
	}
}


