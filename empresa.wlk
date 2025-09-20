import mensajeros.*
import paquetes.*
object empresa {
    const mensajeros = []
    const paquetesEnviados = []
    const paquetesPendientes = []

    method enviarPaquete(unPaquete) {
        if(self.algunMensajeroPuedeEntregar(unPaquete)){
            paquetesEnviados.add(unPaquete)      
        }
        else{
            paquetesPendientes.add(unPaquete)
        }
    } 

    method contratar(unMensajero) {
        mensajeros.add(unMensajero)
    }

    method despedir(unMensajero) {
        mensajeros.remove(unMensajero)
    }

    method despedirATodos(unMensajero) {
        mensajeros.clear()
    }

    method esGrande() {
      return 2 < mensajeros.size()
    }

    method sePuedeEntregarPorPrimerEmpleado(unPaquete) {
        
        return if(!mensajeros.isEmpty()){
            unPaquete.puedeSerEntregado(mensajeros.first())
        }
        else{
            false
        }
    }

    method algunMensajeroPuedeEntregar(unPaquete) {
      return mensajeros.any({unMensajero => unPaquete.puedeSerEntregado(unMensajero)})
    }

    method todosLosQuePuedenLlevar(unPaquete) {
        return mensajeros.filter({unPaquete => unPaquete.puedeSerEntregado(unPaquete)})
    }

    method tieneSobrepeso() {
        return mensajeros.sum({m => m.peso()}) / mensajeros.size()  > 500
    }

    method pesoUltimoMensajero() {
        return mensajeros.last().peso()
    }

    method facturacion() {
        return paquetesEnviados.sum({p => p.precio()})
      
    }

    method enviar(conjuntoDePaquetes) {
        conjuntoDePaquetes.forEach({p => self.enviarPaquete(p)})
    }

    method enviarPaquetePendienteMasCaro() {
        if(self.algunMensajeroPuedeEntregar(self.paquetePendienteMasCaro()))
            self.enviarPaquete(self.paquetePendienteMasCaro())
            paquetesPendientes.remove(self.paquetePendienteMasCaro())
    }

    method paquetePendienteMasCaro() {
        return paquetesPendientes.max({p => p.precio()})
    }
}