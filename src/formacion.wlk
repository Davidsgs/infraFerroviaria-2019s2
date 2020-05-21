import vagones.*

class Formacion {
	var vagones = []
	
	method agregarVagon(vagon){
		vagones.add(vagon)
	}
	
	method quitarVagones(){
		vagones = []
	}
	
	method sacarVagon(vagon){
		vagones.remove(vagon)
	}
	
	method cantidadPasajerosQuePuedeLlevar(){
		return vagones.sum({vagon => vagon.cantidadPasajerosQuePuedeTransportar()})
	}
	
	method vagonesPopulares(){
		return vagones.filter({vagon => vagon.cantidadPasajerosQuePuedeTransportar() > 50})
	}
	
	method esFormacionCarguera(){
		return vagones.all({vagon => vagon.cantidadCargaMaxima() >= 1000})
	}
	
	method dispersionDePesos(){
		return vagones.max({vagon => vagon.pesoMaximo()}).pesoMaximo() - vagones.min({vagon => vagon.pesoMaximo()}).pesoMaximo()
	}
	
	method cantidadBanios(){
		return vagones.filter({vagon => vagon.tieneBanios()}).size()
	}
	
	method hacerMantenimiento(){
		vagones.forEach({vagon => vagon.hacerMantenimiento()})
	}
}
