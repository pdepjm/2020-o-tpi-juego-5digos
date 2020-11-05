import wollok.game.*
import niveles.*
import personaje.*
import movimientos.*
import balas.*
import objectos.*

class Villano{
	
	var property position
	var property vida = 99
	var property danio = 33
	var property direccion
	var property esAtravesable =true
	
	method image() = direccion.imagePersonaje()
	method esGolpeable() = true
	method chocasteCarpincho(unPersonaje){
		game.say(self, "jaja, EZ PT")
		self.hacerDanio(unPersonaje)
	}
	method hacerDanio(unPersonaje){
		unPersonaje.recibirDanio(danio)
	}
    method moverse(){
        direccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()
   	    self.moverseHacia(direccion)
    }
    method moverseHacia(newDireccion){
        if(objetosDeAdelante.todosObjetosAtravesables(self)){	
    		position = newDireccion.avanzar(position,1)
    	    }
    }
    method colisionConBala(bala){
    	bala.desaparecer()
    	game.schedule(100,{game.removeVisual(self)})
    	self.spawnearObjeto()
    	return true
    }
    method spawnearObjeto(){
		municion.generaUno(position)
	}
}

class SuperVillano inherits Villano{
	var property vivo= true
	var property muerto=false
	override method image()="doge.png"
	override method moverse(){
		direccion = [izquierda,derecha,abajo,arriba].anyOne()
		self.moverseHacia(direccion)
	}
	override method colisionConBala(bala){
    	vida = (vida- bala.danioDeBala()).max(0)
    	bala.desaparecer()
    	if(vida==0){
			game.schedule(100,{game.removeVisual(self)})
			vivo=false
			muerto=true
			self.spawnearObjeto()
			if(generarSuperVillano.superZombiesMuertos()){
				game.schedule(2000, {nivel3.iniciar()})
			}
		  }
	   return true
    }
    override method spawnearObjeto(){
    	super()
    	fabricaDeMate.generaUno(position)
	}
}

object generarSuperVillano{
	
		const villanos= [
		new SuperVillano(position = game.at(23,7),direccion =   [izquierda,derecha,abajo,arriba].anyOne(),danio=66),
		new SuperVillano (position = game.at(23,12),direccion = [izquierda,derecha,abajo,arriba].anyOne(),danio=66),
	    new SuperVillano (position = game.at(23,2),direccion =  [izquierda,derecha,abajo,arriba].anyOne(),danio=66)]
	    
	    method generarVillanos(){
	    villanos.forEach{villano => game.addVisual(villano)}
	    game.onTick(750, "movimiento", {villanos.forEach({villano => villano.moverse()})}) 
	    }
	    method superZombiesMuertos()= villanos.all({villano => villano.muerto()})
}

object generadorDeVillanos{
	const villanos = [
	    new Villano(position = game.at(1,5),direccion =   [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(1,10),direccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(3,5),direccion =  [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(3,10),direccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(6,4),direccion =  [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(6,11),direccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(12,1),direccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(13,1),direccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(12,14),direccion =[zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(13,14),direccion =[zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(13,7),direccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(13,8),direccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(15,7),direccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(16,7),direccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),    
	    new Villano (position = game.at(18,1),direccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(18,12),direccion =[zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(19,1),direccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(19,12),direccion =[zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(23,7),direccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(23,8),direccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(24,8),direccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(23,1),direccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(23,12),direccion =[zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(24,1),direccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()),
	    new Villano (position = game.at(24,12),direccion =[zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())] 
	method generarVillanos(){
	    villanos.forEach{villano => game.addVisual(villano)}
	    game.onTick(1000, "movimiento", {villanos.forEach({villano => villano.moverse()})}) 
	}
}
