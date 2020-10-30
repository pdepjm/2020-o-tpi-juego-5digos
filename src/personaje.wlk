import wollok.game.*
import estructuras.*
import movimientos.*
import balas.*
import objectos.*

class Personaje{
	var jugadorVivo = true
	var property vida = 99
	var property direccion
	var property position
	var property municiones = 13

	method ir(newDireccion){
		direccion = newDireccion
		self.moverse()
	}
	method curarse(cura){
		vida = (vida + cura).min(99)
	}
	method recibirDanio(danio){
		vida = (vida-danio).max(0)
		if(vida==0){
			self.perder()
		}
		else {
			self.ir(direccion.opuesto())
		}
	}
	method moverse(){
	     if(objetosDeAdelante.todosObjetosAtravesables(self)){
    		position = direccion.avanzar(position,1)
    	 }
	}
	method esAtravesable() = true
	method image ()=direccion.imagePersonaje()
	method agarrar(objeto){
		objeto.efecto(self)
	}
	method cargar(cant){
		municiones = (municiones + cant).min(14) 
	}
	method perder(){
		game.removeVisual(self)
		jugadorVivo = false
		game.schedule(5000, {game.stop()})
	}
	method disparar(){
		if(municiones==0){
			game.say(self, "no tengo balas")
		}
		else{
		    generadorDeBalas.generarBalas(self)
		    municiones--
		    }
	}
	method iniciarP(){
	self.position(position)
	self.direccion(direccion)
	}
}

object personaje inherits Personaje (position= game.at(1,1), direccion = carpinchoRickDerecha){

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
}

object personaje2 inherits Personaje (position= game.at(1,14), direccion = carpinchoMortyDerecha){

	method imagenVida(){
		if (vida == 99){
			barraVidaP2.recorrerListaVidas(0)
		}
		else if (vida == 66){
			barraVidaP2.recorrerListaVidas(1)
		}
		else if (vida == 33){
			barraVidaP2.recorrerListaVidas(2)
		}
		else if (vida == 0){
			barraVidaP2.recorrerListaVidas(3)
		}
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
