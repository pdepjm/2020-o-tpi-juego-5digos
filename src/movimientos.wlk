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
	
	method cambioABala() = balaDerecha
	
	override method imagePersonaje()="CarpDerecha.png"
}

object carpinchoRickArriba inherits Arriba{
	
	method opuesto()= carpinchoRickDerecha
	
	method cambioABala() = balaArriba
	
	override method imagePersonaje()="CarpBack.png"
}

object carpinchoRickAbajo inherits Abajo{
	
	method opuesto()= carpinchoRickArriba
	
	method cambioABala() = balaAbajo
	
	override method imagePersonaje()="CarpFrente.png"
}

object carpinchoMortyIzquierda inherits Izquierda{
	
	method opuesto()= carpinchoMortyDerecha
	
	method cambioABala() = balaIzquierda
	
	override method imagePersonaje()="Carp2Izquierda.png"
}
object carpinchoMortyDerecha inherits Derecha{
	
	method opuesto()= carpinchoMortyIzquierda
	
	method cambioABala() = balaDerecha
	
	override method imagePersonaje()="Carp2Derecha.png"
}
object carpinchoMortyArriba inherits Arriba{
	
	method opuesto()= carpinchoMortyAbajo
	
	method cambioABala() = balaArriba
	
	override method imagePersonaje()="Carp2Back.png"
}
object carpinchoMortyAbajo inherits Abajo{
	
	method opuesto()= carpinchoMortyArriba
	
	method cambioABala() = balaAbajo
	
	override method imagePersonaje()="Carp2Frente.png"
}

object zombieBabosoIzquierda inherits Izquierda{
	
	method opuesto()= zombieBabosoDerecha
	
	method cambioABala() = balaIzquierda
	
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

///
object balaIzquierda inherits Izquierda{
	
	 override method imagePersonaje() = "fish.png"
}

object balaDerecha inherits Derecha{
	
	 override method imagePersonaje() = "fish.png"
}

object balaArriba inherits Arriba{
	
	 override method imagePersonaje() = "fish.png"
}

object balaAbajo inherits Abajo{
	
	 override method imagePersonaje() = "fish.png"
}

