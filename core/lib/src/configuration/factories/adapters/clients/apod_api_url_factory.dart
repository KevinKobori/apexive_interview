String apodApiUrlFactory({
  required String baseURL,
  required String apiKey,
  required String requestPath,
}) =>
    '$baseURL$apiKey$requestPath';
