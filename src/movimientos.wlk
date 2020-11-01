import wollok.game.*
import personaje.*
import villano.*
import estructuras.*
import objectos.*

class Izquierda{
	method cambioABala() = balaIzquierda
	method avanzar (position,cantidad) = position.left(cantidad)
}
class Derecha{
	method cambioABala() = balaDerecha
	method avanzar (position,cantidad) = position.right(cantidad)
}
class Arriba{
	method cambioABala() = balaArriba
	method avanzar (position,cantidad) = position.up(cantidad)
}
class Abajo{
	method cambioABala() = balaAbajo
	method avanzar (position,cantidad) = position.down(cantidad)
}

object carpinchoRickIzquierda inherits Izquierda{
	method opuesto()= carpinchoRickDerecha
	method imagePersonaje()="CarpIzquierda.png"
}
object carpinchoRickDerecha inherits Derecha{
	method opuesto()= carpinchoRickIzquierda
	method imagePersonaje()="CarpDerecha.png"
}

object carpinchoRickArriba inherits Arriba{
	method opuesto()= carpinchoRickDerecha
	method imagePersonaje()="CarpBack.png"
}

object carpinchoRickAbajo inherits Abajo{
	method opuesto()= carpinchoRickArriba
	method imagePersonaje()="CarpFrente.png"
}

object carpinchoMortyIzquierda inherits Izquierda{
	method opuesto()= carpinchoMortyDerecha
	method imagePersonaje()="Carp2Izquierda.png"
}
object carpinchoMortyDerecha inherits Derecha{
	method opuesto()= carpinchoMortyIzquierda
	method imagePersonaje()="Carp2Derecha.png"
}
object carpinchoMortyArriba inherits Arriba{
	method opuesto()= carpinchoMortyAbajo
	method imagePersonaje()="Carp2Back.png"
}
object carpinchoMortyAbajo inherits Abajo{
	method opuesto()= carpinchoMortyArriba
	method imagePersonaje()="Carp2Frente.png"
}

object zombieBabosoIzquierda inherits Izquierda{
	method opuesto()= zombieBabosoDerecha
	method imagePersonaje()="ZombieIzquierda.png"
}
object zombieBabosoDerecha inherits Derecha{
	method opuesto()= zombieBabosoIzquierda
	method imagePersonaje()="ZombieDerecha.png"
}
object zombieBabosoArriba inherits Arriba{
	method opuesto()= zombieBabosoAbajo
	method imagePersonaje()="ZombieBack.png"
}
object zombieBabosoAbajo inherits Abajo{
	method opuesto()= zombieBabosoArriba
	method imagePersonaje()="ZombieFrente.png"
}

object balaIzquierda inherits Izquierda{
	 method image() = "fish.png"
}

object balaDerecha inherits Derecha{
	 method image() = "fish.png"
}

object balaArriba inherits Arriba{
	 method image() = "fish.png"
}

object balaAbajo inherits Abajo{
	 method image() = "fish.png"
}
