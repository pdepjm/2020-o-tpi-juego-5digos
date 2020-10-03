import wollok.game.*
import pepita.*
import terreno.*
import personaje.*
import villano.*

object EscapeCarpincho{
	method iniciar() {
		self.configurarJuego()
		self.agregarPersonajes()
		self.agragarObjeto()
		self.agragarVillano()
		self.configurarTeclas()
		game.start()
	}
	method configurarJuego() {
		game.title("Escape De los Carpinchos")
		game.width(30)
		game.height(15)
		game.boardGround("MapaBasicoJPG.jpg")
	}
	method agregarPersonajes() {
		game.addVisualCharacter(carpincho2)
		game.addVisualCharacter(carpincho)
	}
	method agragarObjeto(){
		game.addVisual(mate1)
		game.addVisual(mate2)
		game.addVisual(mate3)
	}
	method agragarVillano(){
		game.addVisual(villano1)
		game.addVisual(villano2)
		game.addVisual(villano3)
	}
	
	method configurarTeclas() {
		keyboard.up().onPressDo({carpincho.moverseA(carpincho.position().up(0.25))})
		keyboard.down().onPressDo({carpincho.moverseA(carpincho.position().down(0.25))})
		keyboard.left().onPressDo({carpincho.moverseA(carpincho.position().left(0.5))})
		keyboard.right().onPressDo({carpincho.moverseA(carpincho.position().right(0.5))})
		
		keyboard.up().onPressDo({carpincho2.moverseA(carpincho2.position().up(0.25))})
		keyboard.down().onPressDo({carpincho2.moverseA(carpincho2.position().down(0.25))})
		keyboard.left().onPressDo({carpincho2.moverseA(carpincho2.position().left(0.5))})
		keyboard.right().onPressDo({carpincho2.moverseA(carpincho2.position().right(0.5))})
	}
}


