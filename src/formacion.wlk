import vagones.*

class Formacion{
	
	const vagones = new List()
	
	method agregarVagon(unVagon){
		vagones.add(unVagon)
	}
	method cuantosPasajeros() = vagones.map({v => v.cantPasajeros()}).sum()
	method cantVagonesPopulares() = vagones.count({v => v.esPopular()})
	method esFormacionCarguera() = vagones.all({v => v.esCarguero()})
	method dispersionDePesos() = vagones.map({v => v.pesoMaximo()}).max() - vagones.map({v => v.pesoMaximo()}).min()
	method cantidadDeBanios() = vagones.count({v => v.tieneBanios()})
	
	method hacerMantenimiento() = vagones.forEach({v => v.hacerMantenimiento()})
	method estaEquilibrada() = self.vagonConMasPasajeros() - self.vagonConMenosPasajeros() < 20
	method vagonesConPasajeros() = vagones.filter({v => v.llevaPasajeros()})
	method cantPasajerosPorVagon() = self.vagonesConPasajeros().map({v => v.cantPasajeros()})
	method vagonConMasPasajeros() = self.cantPasajerosPorVagon().max()
	method vagonConMenosPasajeros() = self.cantPasajerosPorVagon().min()
	method estaOrganizada() {
		return not (1..vagones.size()-1).any {
			idx => not vagones.get(idx-1).llevaPasajeros() and vagones.get(idx).llevaPasajeros()
		}
	}
	
}
