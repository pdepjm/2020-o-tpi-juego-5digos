import wollok.game.*
import personaje.*
import villano.*
import estructuras.*
import objectos.*

class Balas {
	var property position
	var property direccion
	
	
	method chocasteCarpincho(unPersonaje) {}
	method esAtravesable() = true
	method image() = "Balas.png"
	method seguirCurso(){
		position = direccion.cambioABala().avanzar(position, 1)
	}
	method efectos(unPersonaje){}
	method colisionConBala(bala) {bala.desaparecer()}
	method desaparecer(){
		game.removeVisual(self)
	}
}

object generadorDeBalas{
	
 	method generarBalas(persona){
 		const bala = new Balas (position = persona.position(), direccion = persona.direccion())
 		game.addVisual(bala)
 		game.onTick(300, "disparo" , {bala.seguirCurso()})
 		game.onCollideDo(bala, { colicionado =>
			colicionado.colisionConBala(bala)
			})
 	}
 }



