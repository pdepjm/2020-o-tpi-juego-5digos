import wollok.game.*
import estructuras.*
import movimientos.*
import balas.*

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
			barraVidaP1.recorrerListaVidas(0)
		}
		else if (vida == 66){
			barraVidaP1.recorrerListaVidas(1)
		}
		else if (vida == 33){
			barraVidaP1.recorrerListaVidas(2)
		}
		else if (vida == 0){
			barraVidaP1.recorrerListaVidas(3)
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
	
	method disparar(){
		const bala = new Balas()
		bala.generarDisparo()
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

class BarrasDeVida{
	const property imagenesVidas = ["vida99.png", "vida66.png", "vida33.png", "vida0.png"]
	var  imagenDeVida = imagenesVidas.get(0)
	var property position
	
	method esAtravesable() = false
	
	method image() = imagenDeVida
	
	method recorrerListaVidas(unIndice){
		imagenDeVida = imagenesVidas.get(unIndice)
	}
}

object barraVidaP1 inherits BarrasDeVida{
	method iniciarB(){
		self.position(game.at(4,15))
	}
}

object barraVidaP2 inherits BarrasDeVida{
	method iniciarB(){
		self.position(game.at(23,15))
	}
}