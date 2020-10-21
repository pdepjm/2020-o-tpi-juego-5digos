import wollok.game.*
import personaje.*
import villano.*
import estructuras.*
import objectos.*

class Balas inherits Objetos{
	
	var property direccion
	override method image() = "fish.png"
	
	method chocasteCarpincho(personaje) {}
	
	method seguirCurso(){
		
		position = (direccion.cambioABala() ).avanzar(position, 1)
	}
	
	method desaparecer(){
		game.removeVisual(self)
	}
	
	method efectos(unPersonaje){}
	
	//*Falta assets de balas
	//falta imagen

}

object generadorDeBalas{
 	method generarBalas(persona){
 		var bala = new Balas (position = persona.position(), direccion = persona.direccion())
 		game.addVisual(bala)
 		game.onTick(300, "disparo" , {bala.seguirCurso()})
 		game.onCollideDo(bala, { colicionado =>
			colicionado.colisionConBala(bala)
			 
			})
 		
 	}
 }














//class Balas{
//	var property image
//	var property cantidad=30
//	var danio = 45
//	var property direccion = personaje.direccion()
//	var property position = personaje.position()
//	
//	method esAtravesable() = false
//	
//	method disparar(){
//		game.addVisual(self)
//		self.avanzarHastaChocar()
//	}
//	
//	method disparo(zombie){
//		zombie.recivirDanio(danio)
//	}
//	
//	method chocaZombie(){
//		
//	}
//	
//	method avanzarHastaChocar(){
//	    if(self.todosObjetosAtravesables()){
//	    	position = direccion.avanzar(position,1)
//	    	self.avanzarHastaChocar()
//	    }
//	    else if(self.chocaZombie()){
//	    	self.disparo(zombie)
//	    }
//	    else {
//	    	
//	    }
//	}
//	
//	method objetosDelante()=game.getObjectsIn(direccion.avanzar(position,1))
//	
//	method todosObjetosAtravesables() = self.objetosDelante().all({objeto => objeto.esAtravesable()})
//
//}




