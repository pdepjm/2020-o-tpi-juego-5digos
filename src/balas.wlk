import wollok.game.*
import personaje.*
import villano.*
import estructuras.*
import objectos.*

class Balas {
	var property position
	var property direccion
	var property danioDeBala = 33
	var property esAtravesable =true
	
	method image() = "Balas.png"
	method seguirCurso(){
		position = direccion.cambioABala().avanzar(position, 1)
	}
	method chocasteConObstaculoRompible(unObstaculo) = unObstaculo.esRompible()
	method chocasteConVillano(unVillano) = unVillano.esGolpeable()
	method colisionConBala(bala){
		bala.desaparecer()
	}
	method desaparecer(){
		game.removeVisual(self)
	}
	method efecto(unPersonaje){}
	method chocasteCarpincho(unPersonaje){}
}

object generadorDeBalas{
 	method generarBalas(persona){
 		const bala = new Balas (position = persona.position(), direccion = persona.direccion())
 		game.addVisual(bala)
 		game.onTick(75, "disparo" , {bala.seguirCurso()})
 		game.onCollideDo(bala, { colicionado => colicionado.colisionConBala(bala)})
 	}
 }
