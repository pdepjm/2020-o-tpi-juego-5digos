import wollok.game.*
import niveles.*
import estructuras.*
import personaje.*
import balas.*

class ObjetosQueDanVida {
	var property cura
	var property position
	var property esAtravesable =true
	
	method efecto(unPersonaje){
		unPersonaje.curarse(cura)
		unPersonaje.actualizarVida()
		game.removeVisual(self)
	}
	method colisionConBala(bala){}
	method chocasteCarpincho(unPersonaje){}
}

class Pasto inherits ObjetosQueDanVida{
	method image() ="pasto.png"
}

object fabricaDePasto inherits Pasto{
	method generaUno(nuevaPosicion){
	    game.addVisual(new Pasto(position = nuevaPosicion,cura=33))
	}
}

class Mate inherits ObjetosQueDanVida{
	method image() ="mate.png"
}

object fabricaDeMate inherits Mate{
	method generaUno(nuevaPosicion){
	    game.addVisual(new Mate(position = nuevaPosicion,cura=100))
	}
}

object objetosDeAdelante{
	method objetosDelante(personajeQueSeMueve) = game.getObjectsIn(personajeQueSeMueve.direccion().avanzar(personajeQueSeMueve.position(),1))
    method todosObjetosAtravesables(personajeQueSeMueve) = self.objetosDelante(personajeQueSeMueve).all({objeto => objeto.esAtravesable()})
}

object objetosParaMoverseAdelante{
	method condicionParaMoverse(personajeEnMovimiento,direccion){
		 if(objetosDeAdelante.todosObjetosAtravesables(personajeEnMovimiento)){
    		personajeEnMovimiento.position(direccion.avanzar(personajeEnMovimiento.position(),1))
	     }
}
}


class Municion {
	var property position
	var property carga = 1
	method esAtravesable() = true
	method image()="municion.png"
	method efecto(unPersonaje){
		unPersonaje.cargar(carga)
		game.removeVisual(self)
	}
	method colisionConBala(bala){}
	method chocasteCarpincho(unPersonaje){}
}

object municion inherits Municion{
		method generaUno(nuevaPosicion){
	    game.addVisual(new Municion(position = nuevaPosicion))
	}
	
	
	
}
