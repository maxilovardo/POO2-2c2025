class Empleado{
    const nombre
    const direccion
    const estadoCivil
    const fNacimiento
    const sueldoBasico

    method nombre(){return nombre}
    method direccion(){return direccion}
    method estadoCivil(){return estadoCivil}
    method fNacimiento(){return fNacimiento}
    method sueldoBasico(){return sueldoBasico}

    method edad(){
        return (new Date - fNacimiento).div(365)
    }

    method sueldoBruto(){
        return self.sueldoBasico()
    }

    method sueldoNeto(){
        return self.sueldoBruto() - self.retensiones()
    }

    method retensiones(){
        return self.obraSocial() + self.aportesJubilatorios()
    }

    method obraSocial(){
        return self.sueldoBruto * self.descuentoPorObraSocial()
    }

    method descuentoPorObraSocial(){
        return 0.1
    }

    method aportesJubilatorios(){
        return self.sueldoBruto * self.descuentoPorAportes()
    }

    method descuentoPorAportes()

    method desgloceConceptos(){
        return "Sueldo Basico: " + self.sueldoBasico + "Sueldo Bruto: " + self.sueldoBruto +
             ", Sueldo Neto: " + self.sueldoNeto + ",Retensiones Obra Social: " + self.obraSocial + "Retensiones Aportes Jubilatorios: " + self.aportesJubilatorios
    }
}

class PlantaPermanente inherits Empleado{
    const cantHijos
    const antiguedad

    method cantHijos(){return cantHijos}
    method antiguedad(){return antiguedad}

    override method sueldoBruto(){
        return super() + self.salarioFamiliar()
    }

    method salarioFamiliar(){
        return self.asignacionPorHijo() + self.asignacionPorConyuge() + self.bonoAntiguedad()
    }

    method asignacionPorHijo(){
        return 150 * self.cantHijos()
    }

    method asignacionPorConyuge(){
        return if (estadoCivil == "Casado") {
            100
        }else{
            0
        }
    }

    method bonoAntiguedad(){
        return 50 * self.antiguedad()
    }

    override method obraSocial(){
        return super() + 20 * self.cantHijos()
    }

    override method descuentoPorAportes(){
        return 0.15
    }

    override method desgloceConceptos(){
        return super() + ", Asignacion por Hijo: " + self.asignacionPorHijo + ",Asignacion por Conyuge: " + self.asignacionPorConyuge + ",Bono Antigüedad: " + self.bonoAntiguedad
    }
}

class PlantaTemporaria inherits Empleado{
    const fechaFinDesignacion
    const cantHorasExtras

    method fechaFinDesignacion(){return fechaFinDesignacion}
    method cantHorasExtras(){return cantHorasExtras}

    override method sueldoBruto(){
        return super() + self.bonoHorasExtras()
    }

    method bonoHorasExtras(){
        return 40 * self.cantHorasExtras()
    }

    override method obraSocial(){
        return super() + self.comisionPorEdad()
    }

    method comisionPorEdad(){
        return if (self.edad() > 50){
            25
        }else{
            0
        }
    }

    override method aportesJubilatorios(){
        return super() + 5 * self.cantHorasExtras()
    }

    override method descuentoPorAportes(){
        return 0.1
    }

    override method desgloceConceptos(){
        return super() + ",Bono por Horas Extras: " + self.bonoHorasExtras + ", Retension por edad: " + self.comisionPorEdad
    }
}

class Contratado inherits Empleado{
    const numeroContrato
    const medioDePago

    method numeroContrato(){return numeroContrato}
    method medioDePago(){return medioDePago}

    override method retensiones(){
        return super() + 50
    }

    override method descuentoPorAportes(){
        return 0
    }

    override method descuentoPorObraSocial(){
        return 0
    }
}