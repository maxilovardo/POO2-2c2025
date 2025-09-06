import empleado.*
import reciboHaberes.*

class Empresa{
    const nombre
    const cuit
    const property empleados = []
    const property recibosDeHaberes = []

    method nombre(){
        return nombre
    }

    method cuit(){
        return cuit
    }

    method sueldos(){
        return empleados.sum(empleado => empleado.sueldoNeto())
    }

    method sueldosBrutos(){
        return empleados.sum(empleado => empleado.sueldoBruto())
    }

    method retensiones(){
        return empleados.sum(empleado => empleado.retensiones())
    }

    method pagos(){
        empleados.forEach(empleado => recibosDeHaberes.add(
                new reciboHaberes(nEmpleado = empleado.nombre(), direccion = empleado.direccion(), fEmision = new Date(), 
                sueldoBruto = empleado.sueldoBruto(), sueldoNeto = empleado.sueldoNeto(), desgloceConceptos = empleado.desgloceConceptos())))
    }
}