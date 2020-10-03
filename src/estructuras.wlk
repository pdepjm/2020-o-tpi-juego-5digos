import wollok.game.*
import pepita.*
import terreno.*
import personaje.*
import villano.*
import objectos.*

object mapa{
	const posProhibidas = []
	var property posOcupadas = []

	method agregar(pos){posOcupadas.add(pos)}
	method remover(pos){posOcupadas.remove(pos)}
	method posicionOcupada(pos)= posProhibidas.contains(pos) or posOcupadas.contains(pos)
	
	method esUnaPared(pos)= posProhibidas.contains(pos)
	
	method agregarPosiciones(){
		5.times{i=>
			5.times{j=>
				posProhibidas.add(game.at(i*2,j*2))
			}
		}
		13.times{k=>
			posProhibidas.add(game.at(k,0))
			posProhibidas.add(game.at(k,29))
			posProhibidas.add(game.at(0,k))
			posProhibidas.add(game.at(29,k))			
		}
	}
}