class Depositos {
	const formaciones = new List()
	const locomotoras = new List()
	
	method vagonesMasPesados() = formaciones.map({f => f.vagonMasPesado()}).asSet()
	method necesitaConductorExperimentado() = formaciones.any({f => f.esCompleja()})
	
}
