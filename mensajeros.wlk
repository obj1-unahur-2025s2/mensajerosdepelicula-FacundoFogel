object roberto{
    var vehiculo = bici

    method cambiarVehiculo(unVehiculo){
        vehiculo = unVehiculo
    }

    method peso(){
        return 90 + vehiculo.peso()
    }

    method puedeLlamar() {
      return false 
    }
}

object bici{
    method peso() {
      return 5
    }
}

object camion{
    var acoplados = 1

    method cantidadAcoplados(unaCantidad) {
      acoplados = unaCantidad
    }
    method peso(){
        return 500 * ((acoplados).max(1))
    }
}

object chuck{
    method peso(){
        return 80
    }

    method puedeLlamar(){
        return true
    }
}

object neo {
    var tieneCredito = true

    method cargarCredito(){
        tieneCredito = true
    }

    method agotarCredito() {
        tieneCredito = false
    }   

    method peso(){
        return 0
    }

    method puedeLlamar() {
        return tieneCredito
    }
}