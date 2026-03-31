class ErrorMessages {
  // Server & Network Errors
  static const String serverError = 'Ocurrió un error en el servidor.';
  static const String badRequest = 'Solicitud inválida (error del cliente).';
  static const String networkError = 'Sin conexión a internet.';
  static const String timeoutError =
      'Tiempo de espera agotado. Verifica tu conexión.';
  static const String requestCancelled = 'La solicitud fue cancelada.';

  // Cache Errors
  static const String cacheError = 'Error al procesar la información en caché.';
  static const String noCacheData =
      'No se pudieron cargar datos locales. Verifica tu conexión a internet.';

  // Business Errors
  static const String businessError =
      'Ha ocurrido un error de lógica de negocio.';
  static const String selectFundError = 'Por favor selecciona un fondo';
  static const String errorNotificationMethod = 'Debe elegir email o SMS';
  static const String errorMinAmount = 'El monto debe ser al menos COP 100.0';
  static const String insufficientBalance = 'Saldo insuficiente';

  // Unknown
  static const String unexpectedError = 'Ocurrió un error inesperado.';
}
