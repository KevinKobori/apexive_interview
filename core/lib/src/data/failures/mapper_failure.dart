enum MapperFailure {
  invalidJsonFormat('Invalid Json Format'),
  conversionError('Conversion Error'),
  unknownError('Unknown Error');
  
  final String message;

  const MapperFailure(this.message);
}
