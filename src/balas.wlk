import wollok.game.*
import personaje.*
import villano.*
import estructuras.*
import objectos.*

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
