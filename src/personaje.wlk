import wollok.game.*

//no hay que repetir la logica
object carpincho {
	
	var property energia = 100 //falta poner limite a 100 
	var property position = game.at(1,5)
	var property image="CarpDerecha.png"
	
	method tomarMate(){
		if(energia<100){
			energia+=25
		}
	}
	
	method subir(){
		self.moverseA(position.up(0.25))
		self.image("CarpBack.png")
	}
	method bajar(){
		self.moverseA(position.down(0.25))
		self.image("CarpFrente.png")
	}
	method izquierda(){
		self.moverseA(position.left(0.5))
		self.image("CarpIzquierda.png")
	}
	method derecha(){
		self.moverseA(position.right(0.5))
		self.image("CarpDerecha.png")
	}
	method moverseA(pos){
			position = pos
	}
}
//esta mal repite logica
object carpincho2 {
	var property energia = 100
	var property position = game.at(1,1)
	var property image="CarpDerecha.png"
	
	method tomarMate(){
		if(energia<100){
			energia+=25
		}
	}
	
	method subir(){
		self.moverseA(position.up(0.25))
		self.image("CarpBack.png")
	}
	method bajar(){
		self.moverseA(position.down(0.25))
		self.image("CarpFrente.png")
	}
	method izquierda(){
		self.moverseA(position.left(0.5))
		self.image("CarpIzquierda.png")
	}
	method derecha(){
		self.moverseA(position.right(0.5))
		self.image("CarpDerecha.png")
	}
	method moverseA(pos){
			position = pos
	}
}

