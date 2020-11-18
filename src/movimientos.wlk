import wollok.game.*
import personaje.*
import villano.*
import estructuras.*
import objectos.*

class Izquierda{
	method cambioABala() = izquierda
	method avanzar (position,cantidad) = position.left(cantidad)
}
class Derecha{
	method cambioABala() = derecha
	method avanzar (position,cantidad) = position.right(cantidad)
}
class Arriba{
	method cambioABala() = arriba
	method avanzar (position,cantidad) = position.up(cantidad)
}
class Abajo{
	method cambioABala() = abajo
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
	method imagePersonaje()="ZombieIzquierda.png"
}
object zombieBabosoDerecha inherits Derecha{
	method imagePersonaje()="ZombieDerecha.png"
}
object zombieBabosoArriba inherits Arriba{
	method imagePersonaje()="ZombieBack.png"
}
object zombieBabosoAbajo inherits Abajo{
	method imagePersonaje()="ZombieFrente.png"
}

//se podia haber instanciado pero queda feo ademas la diversidad de objetos e instancias hace hermoso al mundo y si no nos agarramos en donde quieras(firma Didier)
object izquierda inherits Izquierda{}
object derecha inherits Derecha{}
object abajo inherits Abajo{}
object arriba inherits Arriba{}
