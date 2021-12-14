///clase correspondiente a los datos de una Guía
///@param [numguia] correspondiente al id de una guía
///@param [rut] correspondiente al rut del cliente
///@param [nombrecliente] correspondiente al nombre del cliente
///@param [numcontacto] correspondiente al numero de contacto del cliente
///@param [fecha] correspondiente a la fecha de inicio de la ruta
///@param [direccion] correspondiente a la dirección del cliente
///@param [comuna] correspondiente a la comuna donde reside el cliente
///@param [region] correspondiente a la región donde reside el cliente
///@param [patente] correspondiente a la patente del camión que se encarga de transportar el pedido
///@param [chofer] correspondiente al rut del chofer que se encarga del transporte del pedido
///@param [estado] correspondiente al estado inicial de la entrega
class Guia {
  final String numguia;
  final String rut;
  final String nombrecliente;
  final String numcontacto;
  final String fecha;
  final String direccion;
  final String comuna;
  final String region;
  final String patente;
  final String chofer;
  final String estado;

  //constructor de una guía
  Guia(
      this.numguia,
      this.rut,
      this.nombrecliente,
      this.numcontacto,
      this.fecha,
      this.direccion,
      this.comuna,
      this.region,
      this.patente,
      this.chofer,
      this.estado);
}
