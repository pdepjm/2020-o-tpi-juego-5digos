import wollok.game.*
import niveles.*
import personaje.*
import movimientos.*


class Villano{
	
	var property position
	
	var property vida = 100
	
	var property danio = 45
	
	var nuevaDireccion
	
	method esAtravesable() = true
	
	method recivirDanio(danioBala){
		
		vida = (vida-danioBala).max(0)
		
		if(vida==0){self.morir()}
		
	}
	
	method morir(){
		
		game.removeVisual(self)
	}

	method chocasteCarpincho(unPersonaje){
		
		game.say(self, "jaja, EZ PT")
		
		self.hacerDanio(unPersonaje)
	}
	
	method hacerDanio(unPersonaje){
		
		unPersonaje.recivirDanio(danio)
	}

	method image() ="ZombieDerecha.png"

    method moverse(){
    	
    nuevaDireccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne()
    
   	    self.moverseHacia(nuevaDireccion)
    }
    method moverseHacia(direccion){
    	
        if(self.todosObjetosAtravesables()){
        	
    		position = direccion.avanzar(position,1)
    	    }
    }
//--------------------------
    method objetosDelante()=game.getObjectsIn(nuevaDireccion.avanzar(position,1))
	
    method todosObjetosAtravesables() = self.objetosDelante().all({objeto => objeto.esAtravesable()})
//--------------------------
}

object generadorDeVillanos{

	method generarVillanos(){
		
		const villanos = []

		const villano1 =  new Villano(position = game.at(1,5),nuevaDireccion =   [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
		const villano2 =  new Villano (position = game.at(1,10),nuevaDireccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano3 =  new Villano (position = game.at(3,5),nuevaDireccion =  [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano4 =  new Villano (position = game.at(3,10),nuevaDireccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano5 =  new Villano (position = game.at(6,4),nuevaDireccion =  [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano6 =  new Villano (position = game.at(6,11),nuevaDireccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano7 =  new Villano (position = game.at(12,1),nuevaDireccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano8 =  new Villano (position = game.at(13,1),nuevaDireccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano9 =  new Villano (position = game.at(12,14),nuevaDireccion =[zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano10 = new Villano (position = game.at(13,14),nuevaDireccion =[zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano11 = new Villano (position = game.at(13,7),nuevaDireccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano12 = new Villano (position = game.at(13,8),nuevaDireccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano13 = new Villano (position = game.at(15,7),nuevaDireccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano14 = new Villano (position = game.at(16,7),nuevaDireccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())	    
	    const villano15 = new Villano (position = game.at(18,1),nuevaDireccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano16 = new Villano (position = game.at(18,12),nuevaDireccion =[zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano17 = new Villano (position = game.at(19,1),nuevaDireccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano18 = new Villano (position = game.at(19,12),nuevaDireccion =[zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano19 = new Villano (position = game.at(23,7),nuevaDireccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano20 = new Villano (position = game.at(23,8),nuevaDireccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano21 = new Villano (position = game.at(24,8),nuevaDireccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano22 = new Villano (position = game.at(23,1),nuevaDireccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano23 = new Villano (position = game.at(23,12),nuevaDireccion =[zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano24 = new Villano (position = game.at(24,1),nuevaDireccion = [zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	    const villano25 = new Villano (position = game.at(24,12),nuevaDireccion =[zombieBabosoIzquierda,zombieBabosoDerecha,zombieBabosoArriba,zombieBabosoAbajo].anyOne())
	       
	    villanos.add(villano1)
	    villanos.add(villano2)
	    villanos.add(villano3)
	    villanos.add(villano4)
	    villanos.add(villano5)
	    villanos.add(villano6)
	    villanos.add(villano7)
	    villanos.add(villano8)
	    villanos.add(villano9)
	    villanos.add(villano10)
	    villanos.add(villano11)
	    villanos.add(villano12)
	    villanos.add(villano13)
	    villanos.add(villano14)
	    villanos.add(villano15)
	    villanos.add(villano16)
	    villanos.add(villano17)
	    villanos.add(villano18)
	    villanos.add(villano19)
	    villanos.add(villano20)
	    villanos.add(villano21)
	    villanos.add(villano22)
	    villanos.add(villano23)
	    villanos.add(villano24)
	    villanos.add(villano25)
	    
	    villanos.forEach{villano => game.addVisual(villano)}
	    game.onTick(1000, "movimiento", {villanos.forEach({villano => villano.moverse()})}) 
	}

}


