import vagones.*
import locomotora.*

class Formacion{
	
	const vagones = new List()
	const locomotoras = new List()
	
	method agregarVagon(unVagon){
		vagones.add(unVagon)
	}
	method agregarLocomotora(unaLocomotora){
		locomotoras.add(unaLocomotora)
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
	method velocidadMaxima() = locomotoras.min({l => l.velocidadMaxima()}).velocidadMaxima()
	method sonTodasEficientes() = locomotoras.all({l => l.esEficiente()})
	method puedeMoverse() = self.sumaDelArrastre() >= self.sumaDePesos()
	method sumaDelArrastre() = locomotoras.sum({l => l.arrastre()})
	method sumaDePesos() = self.pesoDeVagones() + self.pesoDeLocomotoras()
	method pesoDeVagones() = vagones.sum({v => v.pesoMaximo()})
	method pesoDeLocomotoras() = locomotoras.sum({l => l.peso()})
	method kilosDeEmpujeQueLeFaltan() = 0.max(self.sumaDePesos() - self.sumaDelArrastre())
	method vagonMasPesado() = vagones.max({v => v.pesoMaximo()})
	method esFormacionCompleja() = self.unidadesDeLaFormacion() > 8 or self.sumaDePesos() > 80000
	method unidadesDeLaFormacion() = vagones.size() + locomotoras.size()
			
		

	
}
