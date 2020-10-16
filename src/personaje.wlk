import wollok.game.*
import estructuras.*
import movimientos.*

class Personaje{
	var jugadorVivo = true
	var property vida = 99
	var property direccion
	var property position

	method ir(nuevaDireccion){
		direccion = nuevaDireccion
		self.moverse()
	}
	
	method imagenVida(){
		if (vida == 99){
			barraDeVida.recorrerListaVidas(0)
		}
		else if (vida == 66){
			barraDeVida.recorrerListaVidas(1)
		}
		else if (vida == 33){
			barraDeVida.recorrerListaVidas(2)
		}
		else if (vida == 0){
			barraDeVida.recorrerListaVidas(3)
		}
	}
	
	method curarse(cura){
		vida = (vida+cura).min(99)
		self.imagenVida()
	}

	method recibirDanio(danio){
		vida = (vida-danio).max(0)
		self.imagenVida()
		if(vida==0){self.perder()}
		else {self.ir(direccion.opuesto())}
	}

	method moverse(){
		if(self.todosObjetosAtravesables()){
			position = direccion.avanzar(position,1)
		}
	}
	
	method esAtravesable() = true
	
	method chocasteCarpincho(unPersonaje){}
	
	method efectos(unPersonaje){}
	
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
	/* */
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


object barraDeVida {
	
	const property position = game.at(4,15)
	const property imagenesVidas = ["vida99.png", "vida66.png", "vida33.png", "vida0.png"]
	var  imagenDeVida = imagenesVidas.get(0)
	
	method esAtravesable() = false
	
	method image() = imagenDeVida
	
	method recorrerListaVidas(unIndice){
		imagenDeVida = imagenesVidas.get(unIndice)
	}
}