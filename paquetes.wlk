import mensajeros.*
import destinos.*


object paquete{
    var estaPago = false
    var destino = matrix

    method cambiarDestino(nuevoDestino) {
        destino = nuevoDestino
    }

    method estaPago() {
      return estaPago
    }

    method registrarPago() {
      estaPago = true
    }

    method puedeSerEntregado(unMensajero) {
      return destino.puedePasar(unMensajero) && estaPago
    }

    method precio() {
      return 50
    }
}

object paquetito {
    var destino = matrix
    
    method cambiarDestino(nuevoDestino) {
    destino = nuevoDestino
    }

    method estaPago() {
        return true
    }
    
    method precio() {
        return 0
    }

    method puedeSerEntregado(unMensajero) {
      return true
    }
}

object paqueton {
    const destinos = []
    var importePagado = 0

    method agregarDestino(unDestino) {
        destinos.add(unDestino)
    }

    method precio() {
      return 100 * destinos.size()
    }

    method recibirPago(unValor) {
        importePagado = (importePagado + unValor).min(self.precio())
    }

    method estaPago() {
      return importePagado == self.precio()
    }

    method puedeSerEntregado(unMensajero) {
      return destinos.all({destino => destino.puedePasar(unMensajero)}) 
      && self.estaPago()
    }
}