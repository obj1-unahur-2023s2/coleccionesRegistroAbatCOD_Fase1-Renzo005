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
	method agregarAbatidosVariosDias(/*cantidades,dias*/registrosAbatidos) {
		registrosAbatidos.forEach{e => self.agregarAbatidosDia(e)}
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
	method diasConAbatidosSuperioresA(cuanto) 
	method esCrack() = 
	/*
ultimoValorDeAbatidosConSize(): Demostrar que last() == size()-1.
diasConAbatidosSuperioresA(cuanto): los dias que abatió un valor superior al indicado.
valoresDeAbatidosPares(): los valores de abatidos del registro que son valores pares.
elValorDeAbatidos(cantidad): encuentra y retorna el valor indicado en cantidad.
abatidosSumando(cantidad): la lista de valores que resulta de sumar el valor indicado en 'cantidad' a cada valor de abatidos del registro.
abatidosEsAcotada(n1,n2): indica si en el registro, la cantidad de abatidos se encuentra entre los valores indicados.
algunDiaAbatioMasDe(cantidad): indica si algún día de que se tiene registro, la cantidad de abatidos es mayor al valor indicado.
todosLosDiasAbatioMasDe(cantidad): indica si todos los días de que se tiene registro, la cantidad de abatidos es mayor al valor indicado.
cantidadAbatidosMayorALaPrimera(): la cantidad de valores de abatidos diaria que superan a la cantidad indicada para el primer día del registro.
esCrack(): indica verdadero si en todos los días de los que se tiene registro, el valor de abatidos siempre fue aumentando (mayor valor día a día).
	 */
	
}