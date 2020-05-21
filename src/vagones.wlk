class VagonPasajero {
	var largo //medido en metros
	var ancho //medido en metros.
	var tieneBanios
	var estaOrdenado
	
	method setLargo(cantidad){
		largo = cantidad
	}
	
	method setAncho(cantidad){
		ancho = cantidad
	}
	
	method estaOrdenado(){
		return estaOrdenado
	}
	
	method desordenarVagon(){
		estaOrdenado = false
	}
	
	method ordenarVagon(){
		estaOrdenado = true
	}
	
	method tieneBanios(){
		return tieneBanios
	}
	
	method noTieneBanios(){
		tieneBanios = false
	}
	
	method siTieneBanios(){
		tieneBanios = true
	}
	
	method cantidadPasajerosQuePuedeTransportar(){
		var salida = 0
		if(ancho <= 3){
			salida = 8 * largo
		}else{
			salida = 10 * largo
		}
		if(not estaOrdenado){
			salida -= 15
		}
		return salida
	}
	
	
	
	method cantidadCargaMaxima(){
		if(tieneBanios){
			return 300
		}else{
			return 800
		}
	}
	
	method pesoMaximo(){
		return 2000 + (self.cantidadPasajerosQuePuedeTransportar() * 80) + self.cantidadCargaMaxima()
	}
	
	method hacerMantenimiento(){
		if(not estaOrdenado){
			self.ordenarVagon()
		}
	}
}

class VagonCarga{
	
	var cargaMaximaIdeal
	var maderasSueltas
	
	method cantidadPasajerosQuePuedeTransportar(){
		return 0
	}
	
	method tieneBanios(){return false}
	
	method setMaderasSueltas(cantidad){
		maderasSueltas = cantidad
	}
	
	method setCargaMaximaIdeal(cantidad){
		cargaMaximaIdeal = cantidad
	}
	
	method cantidadCargaMaxima(){
		return cargaMaximaIdeal - (400 * maderasSueltas)
	}
	
	method pesoMaximo(){
		return 1500 + self.cantidadCargaMaxima()
	}
	
	method hacerMantenimiento(){
		if(maderasSueltas > 2){
			maderasSueltas -= 2
		}else{
			maderasSueltas = 0
		}
	}
}

class VagonDormitorio{
	var compartimientos
	var camasPorCompartimiento
	
	method setCamasPorCompartimiento(cantidad){
		camasPorCompartimiento = cantidad
	}
	
	method setCompartimientos(cantidad){
		compartimientos = cantidad
	}
	
	method tieneBanios(){return true}
	
	method cantidadCargaMaxima(){
		return 1200
	}
	
	method cantidadPasajerosQuePuedeTransportar(){
		return compartimientos * camasPorCompartimiento
	}
	
	method pesoMaximo(){
		return 4000 + (80 * self.cantidadPasajerosQuePuedeTransportar()) + self.cantidadCargaMaxima()
	}
	
	method hacerMantenimiento(){
		
	}
}
