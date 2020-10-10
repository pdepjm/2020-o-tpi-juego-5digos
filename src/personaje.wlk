import wollok.game.*
import estructuras.*
import movimientos.*

class Personaje{
	var jugadorVivo = true
	var property vida = 100
	var property direccion
	var property position

	method ir(nuevaDireccion){
		direccion = nuevaDireccion
		self.moverse()
	}

	method curarse(cura){
		vida = (vida+cura).min(100)
	}

	method recivirDanio(danio){
		vida = (vida-danio).max(0)
		if(vida==0){self.perder()}
		else {self.ir(direccion.opuesto())}
	}

	method moverse(){
		if(self.todosObjetosAtravesables()){
			position = direccion.avanzar(position,1)
		}
	}
//-----------------	
	method objetosDelante()=game.getObjectsIn(direccion.avanzar(position,1))
	
	method todosObjetosAtravesables() = self.objetosDelante().all({objeto => objeto.esAtravesable()})
//-----------------	
	method image ()=direccion.imagePersonaje()
	
	method agarrar(unaComida){
		unaComida.efectos(self)
	}
	
	method perder(){
		game.removeVisual(self)
		jugadorVivo = false
		game.schedule(5000, {game.stop()})
	}
}

object personaje inherits Personaje{
	method iniciarP(){
	self.position(game.at(1,1))
	self.direccion(carpinchoRickDerecha)
	}
}

object personaje2 inherits Personaje{
	method iniciarP(){
	self.position(game.at(1,14))
	self.direccion(carpinchoMortyDerecha)
	}
}
