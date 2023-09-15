object registroAbatidosCOD {
	const registro = []
	
	method dia(reg) = reg.last()
	method cantidad(reg) = reg.first()
	method yaEstaElDia(dia) = registro.any({r => self.dia(r) == dia})
	method agregarAbatidosDia(cantidad,dia) {
		if (self.yaEstaElDia(dia)){
			self.error("Ya esta el dia")
		}
			registro.add([cantidad,dia])
	}
	method agregarAbatidosVariosDias(cantidades,dias,registrosAbatidos) {
		registrosAbatidos.forEach({e => self.agregarAbatidosDia(cantidades,dias)})
	}
	method registroDia(dia) = registro.find({r => self.dia(r) == dia})
	method eliminarElRegistroDelDia(dia) {
		if(not self.yaEstaElDia(dia)){
			self.error("No esta esta el dia")
		}
		registro.remove(self.registroDia(dia))
	}
	method eliminarLosRegistrosDeDias(/*[dia1,dia2,...]*/listaDeDias) {
		if(not listaDeDias.all{e => self.yaEstaElDia(e)}){
			self.error("Algun dia de la lista no esta incluido en el registro")
		}
		listaDeDias.forEach{e => self.eliminarElRegistroDelDia(e)}
	}
	
	method cantidadDeDiasRegistrados() = registro.size()
	method estaVacioElRegistro() = registro.isEmpty()
	method algunDiaAbatio(cantidad) = registro.any({r => self.cantidad(r) == cantidad})
	method primerValorDeAbatidos() = self.cantidad(registro.first())
	method ultimoValorDeAbatidos() = self.cantidad(registro.last())
	method maximoValorDeAbatidos() = self.cantidad(registro.max({r => self.cantidad(r)}))
	method totalAbatidos() = registro.sum({r => self.cantidad(r)})
	method cantidadDeAbatidosElDia(dia) = self.cantidad(self.registroDia(dia))
	method ultimoValorDeAbatidosConSize() = self.cantidad(registro.get(registro.size()-1)) 
	method diasConAbatidosSuperioresA(cuanto) = self.dia(registro.find({r => self.cantidad(r) == cuanto}))
	//method valoresDeAbatidosPares() = registro.map(self.cantidad(registro.filter({r => self.cantidad(r).even()})))
	method elValorDeAbatidos(cantidad) = registro.find({r => self.cantidad(r) == cantidad})
	method abatidosSumando(cantidad) = registro.map({r => self.cantidad(r) + cantidad})
	method abatidosEsAcotada(n1,n2) = registro.all({r => self.cantidad(r).between(n1,n2)})
	method algunDiaAbatioMasDe(cantidad) = registro.any({r => self.cantidad(r) > cantidad})
	method todosLosDiasAbatioMasDe(cantidad) = registro.all({r => self.cantidad(r) > cantidad})
	method cantidadAbatidosMayorALaPrimera() {}
	//method esCrack() = (1...)
	/*
cantidadAbatidosMayorALaPrimera(): la cantidad de valores de abatidos diaria que superan a la cantidad indicada para el primer día del registro.
esCrack(): indica verdadero si en todos los días de los que se tiene registro, el valor de abatidos siempre fue aumentando (mayor valor día a día).
	 */
	
}