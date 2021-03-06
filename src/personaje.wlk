import wollok.game.*
import estructuras.*
import movimientos.*
import balas.*
import objectos.*
import villano.*
import niveles.*

class Personaje{
	var property jugadorVivo = true
	var property vida = 99
	var property direccion
	var property position
	var property municiones = 15
	var property barraDeVida
	var property contadorMunicion
	var property esAtravesable = true
	
	method image()=direccion.imagePersonaje()
	method ir(newDireccion){
		direccion = newDireccion
		self.moverse()
	}
	method curarse(cura){
		vida = (vida + cura).min(99)
		self.actualizarVida()
	}
	method recibirDanio(danio){
		vida = (vida-danio).max(0)
		self.actualizarVida()
		if(vida==0){
			self.perder()
		}
		else {
			self.ir(direccion.opuesto())
		}
    }
	method moverse(){
		objetosParaMoverseAdelante.condicionParaMoverse(self,direccion)
	}
	
	method agarrar(objeto){
		objeto.efecto(self)
	}
	method cargar(cant){
		municiones = (municiones + cant).min(15) 
		self.actualizarMunicion()
	}
	method perder(){
		game.removeVisual(self)
		jugadorVivo = false
		game.schedule(2000, {menuGameOver.iniciar()})
	}
	method disparar(){
		if(municiones==0){
			game.say(self, "no tengo balas")
		}
		else{
		    generadorDeBalas.generarBalas(self)
		    municiones--
		    self.actualizarMunicion()
		    }
	}
	method iniciarP(){
		self.position(position)
		self.direccion(direccion)
	}
	
	
	method actualizarVida(){
		barraDeVida.recorrerListaVidas(3 - (vida / 33))
	}
	
	/* 
	method actualizarVida(){
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
		
	}*/
	method actualizarMunicion(){
		contadorMunicion.mostrarMunicionRestante(15 - municiones)
	}
	
	//no iria pero para que no salga el mensaje
	method colisionConBala(bala){}
	method chocasteCarpincho(unPersonaje){}
	method efecto(unPersonaje){}
}

const personaje = new Personaje (contadorMunicion = contadorMunicionP1, barraDeVida = barraVidaP1, position= game.at(1,1), direccion = carpinchoRickDerecha)

const personaje2 = new Personaje (contadorMunicion = contadorMunicionP2, barraDeVida = barraVidaP2, position= game.at(1,14), direccion = carpinchoMortyDerecha)

class BarrasDeVida{
	const property imagenesVidas = ["vida99.png", "vida66.png", "vida33.png", "vida0.png"]
	    var  imagenDeVida = imagenesVidas.get(0)
	    var property position
	    var property esAtravesable = false
	
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

class ContadoresDeMunicion{
	const property imagenMunicion = ["balas15.png", "balas14.png","balas13.png","balas12.png","balas11.png","balas10.png","balas9.png","balas8.png","balas7.png","balas6.png","balas5.png","balas4.png","balas3.png","balas2.png","balas1.png","balas0.png"]
	var imagenDeMunicion = imagenMunicion.get(0)
	var property position
	
	method esAtravesable() = false
	
	method image() = imagenDeMunicion
	
	method mostrarMunicionRestante(unIndice){
		imagenDeMunicion = imagenMunicion.get(unIndice)
	}
}

object contadorMunicionP1 inherits ContadoresDeMunicion{
	method iniciarC(){
		self.position(game.at(5,15))
	}
}

object contadorMunicionP2 inherits ContadoresDeMunicion{
	method iniciarC(){
		self.position(game.at(24,15))
	}	
}
