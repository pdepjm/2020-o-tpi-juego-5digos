import wollok.game.*
import niveles.*
import personaje.*


class Villano{
	var property position
	
	method esAtravesable() = true

	method chocasteCarpincho(){
		game.say(self, "jaja, sentate breo")
		personaje.perder()
		personaje2.perder()
		game.schedule(5000, {game.stop()})
	} 
	method image() ="ZombieDerecha.png"
	
	method nuevaPosicion(){
		const x = 0.randomUpTo(game.width()).truncate(0)
		const y = 0.randomUpTo(game.height()).truncate(0)
		position = game.at(x,y) 
	}
}



object villanos{
	
	method generar(){
		const villanos = []
		villanos.add(new Position(x=3, y=16))
		villanos.add(new Position(x=5, y=5))
		villanos.add(new Position(x=15, y=13))
		villanos.add(new Position(x=10, y=8))
		villanos.forEach{ p => game.addVisual(new Villano(position = p))}
		game.onTick(3000, "movimiento", {villanos.nuevaPosicion()}) ////*Falta arreglar*/
	}
	

}

