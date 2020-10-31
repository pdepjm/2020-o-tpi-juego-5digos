import wollok.game.*
import personaje.*
import villano.*
import estructuras.*
import objectos.*

class Balas {
	var property position
	var property direccion
	var property danioDeBala
	
	method esAtravesable() = true
	method image() = "Balas.png"
	method seguirCurso(){
		position = direccion.cambioABala().avanzar(position, 1)
	}
	
	method efecto(algo){}
	
	method colisionConBala(bala) {
		bala.desaparecer()
	}
	
	method chocasteCarpincho(unPersonaje){}
	
	method desaparecer(){
		game.removeVisual(self)
	}
}

object generadorDeBalas{
	
 	method generarBalas(persona){
 		const bala = new Balas (position = persona.position(), direccion = persona.direccion(),danioDeBala=33)
 		game.addVisual(bala)
 		game.onTick(75, "disparo" , {bala.seguirCurso()})
 		game.onCollideDo(bala, { colicionado =>
			colicionado.colisionConBala(bala)
			})
 	}
 }



