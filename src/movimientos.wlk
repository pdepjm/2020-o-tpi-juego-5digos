import wollok.game.*
import personaje.*
import villano.*
import estructuras.*
import objectos.*

class Izquierda{
	
	method imagePersonaje()
	
	method avanzar (position,cantidad) = position.left(cantidad)
}
class Derecha{
	method imagePersonaje()
	
	method avanzar (position,cantidad) = position.right(cantidad)
}
class Arriba{
	
	method imagePersonaje()
	
	method avanzar (position,cantidad) = position.up(cantidad)
}
class Abajo{
	
	method imagePersonaje()
	
	method avanzar (position,cantidad) = position.down(cantidad)
}

object carpinchoRickIzquierda inherits Izquierda{
	
	method opuesto()= carpinchoRickDerecha
	
	override method imagePersonaje()="CarpIzquierda.png"
}
object carpinchoRickDerecha inherits Derecha{
	
	method opuesto()= carpinchoRickIzquierda
	
	override method imagePersonaje()="CarpDerecha.png"
}
object carpinchoRickArriba inherits Arriba{
	
	method opuesto()= carpinchoRickDerecha
	
	override method imagePersonaje()="CarpBack.png"
}
object carpinchoRickAbajo inherits Abajo{
	
	method opuesto()= carpinchoRickArriba
	
	override method imagePersonaje()="CarpFrente.png"
}

object carpinchoMortyIzquierda inherits Izquierda{
	
	method opuesto()= carpinchoMortyDerecha
	
	override method imagePersonaje()="Carp2Izquierda.png"
}
object carpinchoMortyDerecha inherits Derecha{
	
	method opuesto()= carpinchoMortyIzquierda
	
	override method imagePersonaje()="Carp2Derecha.png"
}
object carpinchoMortyArriba inherits Arriba{
	
	method opuesto()= carpinchoMortyAbajo
	
	override method imagePersonaje()="Carp2Back.png"
}
object carpinchoMortyAbajo inherits Abajo{
	
	method opuesto()= carpinchoMortyArriba
	
	override method imagePersonaje()="Carp2Frente.png"
}

object zombieBabosoIzquierda inherits Izquierda{
	
	method opuesto()= zombieBabosoDerecha
	
	override method imagePersonaje()="ZombieIzquierda.png"
}
object zombieBabosoDerecha inherits Derecha{
	
	method opuesto()= zombieBabosoIzquierda
	
	override method imagePersonaje()="ZombieDerecha.png"
}
object zombieBabosoArriba inherits Arriba{
	
	method opuesto()= zombieBabosoAbajo
	
	override method imagePersonaje()="ZombieBack.png"
}
object zombieBabosoAbajo inherits Abajo{
	
	method opuesto()= zombieBabosoArriba
	
	override method imagePersonaje()="ZombieFrente.png"
}
