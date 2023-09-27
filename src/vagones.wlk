/* tiene baños o no
 * cantidad de pasajeros
 * peso max
 */
 
 class VagonPasajeros {
 	const property largo
 	const property ancho
 	const property tieneBanios
 	var property estaOrdenado = true
 	
 	method cantPasajeros() {
 		if (ancho <= 3 and self.estaOrdenado()) {
 			return 8 * largo
 		} else if(ancho <= 3 and not self.estaOrdenado()){
 			return (8 * largo) - 15
 		}else if(ancho > 3 and self.estaOrdenado()){
 			return 10 * largo
 		}else{
 			return (10 * largo) - 15
 		}
 	}
 	
 	method cargaMaxima() {if (self.tieneBanios()) {return 300} else {return 800}}
 	method pesoMaximo() = 2000 + 80 * self.cantPasajeros() + self.cargaMaxima()
 	
 	method esPopular() = self.cantPasajeros() > 50
 	method esCarguero() = self.cargaMaxima() >= 1000
 	
 	method hacerMantenimiento() = estaOrdenado
 	
 	method llevaPasajeros() = self.cantPasajeros() > 0
 }
 
 class VagonCarga {
 	const property cargaMaximaIdeal
 	var property maderasSueltas
 	
 	method cargaMaxima() = self.cargaMaximaIdeal() - 400 * maderasSueltas
 	method cantPasajeros() = 0
 	method tieneBanios() = false
 	method pesoMaximo() = 1500 + self.cargaMaxima()
 	
 	method esPopular() = self.cantPasajeros() > 50
 	method esCarguero() = self.cargaMaxima() >= 1000
 	
 	method hacerMantenimiento() = 0.max(maderasSueltas - 2)
 	method llevaPasajeros() = false
 }
 
 class VagonDormitorio {
 	const property compartimientos
 	var property camasEnCompartimiento
 	
 	method cantPasajeros() = compartimientos * camasEnCompartimiento
 	method tieneBanios() = true
 	method cargaMaxima() = 1200
 	method pesoMaximo() = 4000 + 80 * self.cantPasajeros() + self.cargaMaxima()
 	
 	method esPopular() = self.cantPasajeros() > 50
 	method esCarguero() = self.cargaMaxima() >= 1000
 	
 	method hacerMantenimiento() {}
 	method llevaPasajeros() = self.cantPasajeros() > 0
 	
 }
 
 
 