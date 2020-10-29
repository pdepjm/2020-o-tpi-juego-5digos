import wollok.game.*
import niveles.*
import estructuras.*
import personaje.*
import balas.*


class Objetos {
	
	var property cura
	var property position
	
	method esAtravesable() = true
	method desaparecer(){
		game.removeVisual(self)
	}
	method image()
	method colisionConBala(bala) {}
	method chocasteCarpincho(unPersonaje){
		unPersonaje.curarse(cura)
		unPersonaje.imagenVida()
		self.desaparecer()
	}
}

class Pasto inherits Objetos{
	override method image() ="pasto.png"
}

object fabricaDePasto inherits Pasto(cura=33){
	method generaUno(nuevaPosicion){
	    game.addVisual(new Pasto(position = nuevaPosicion,cura=33))
	}
	
	method generar(){
	const lugar = [] 
	lugar.add(new Position(x=5, y=7))
	lugar.add(new Position(x=3, y=14))
	lugar.add(new Position(x=17, y=2))
	lugar.add(new Position(x=6, y=2))
	lugar.forEach{p => game.addVisual(new Pasto(position = p,cura=33))}	
	}
}

class Mate inherits Objetos{
	override method image() ="mate.png"
}

object fabricaDeMate{
	method generaUno(nuevaPosicion){
	    game.addVisual(new Mate(position = nuevaPosicion,cura=100))
	}
	method generar(){
	const lugar = [] 
		lugar.add(new Position(x=6, y=8))
		lugar.add(new Position(x=4, y=14))
		lugar.add(new Position(x=18, y=3))
		lugar.add(new Position(x=7, y=3))
		lugar.forEach{p => game.addVisual(new Mate(position = p,cura=100))}	
	}
}

object objetosDeAdelante{
	
	method objetosDelante(personajeQueSeMueve) = game.getObjectsIn(personajeQueSeMueve.direccion().avanzar(personajeQueSeMueve.position(),1))
    method todosObjetosAtravesables(personajeQueSeMueve) = self.objetosDelante(personajeQueSeMueve).all({objeto => objeto.esAtravesable()})
	
	
}
