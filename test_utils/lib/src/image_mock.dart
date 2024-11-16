import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

const kDogImageUrl = 'https://dog.png';

const kDogImage = NetworkImage(kDogImageUrl);

Future<void> ensureImagesPreloaded(WidgetTester tester) async {
  // Workaround to force load images so that it appears in golden renders
  await tester.pumpWidget(const SizedBox());
  await tester.runAsync(() {
    final context = tester.element(find.byType(SizedBox));
    return precacheImage(kDogImage, context);
  });
}

/// Runs [body] in separate [Zone] with [MockHttpClient].
R mockNetworkImagesFor<R>(R Function() body) {
  return HttpOverrides.runZoned(
    body,
    createHttpClient: (_) => createMockImageHttpClient(),
  );
}

// Mock classes using mocktail
class MockHttpClient extends Mock implements HttpClient {}

class MockHttpClientRequest extends Mock implements HttpClientRequest {}

class MockHttpClientResponse extends Mock implements HttpClientResponse {}

class MockHttpHeaders extends Mock implements HttpHeaders {}

class MockStreamSubscription<T> extends Mock implements StreamSubscription<T> {}

/// Registers fallback values for the types used in mocktail
void registerFallbackValues() {
  registerFallbackValue(Uri.parse('https://example.com'));
  registerFallbackValue((_) {});
  registerFallbackValue(() {});
  registerFallbackValue((_) {});
}

/// Returns a [MockHttpClient] that responds with demo image to all requests.
MockHttpClient createMockImageHttpClient() {
  final mockClient = MockHttpClient();
  final mockRequest = MockHttpClientRequest();
  final mockResponse = MockHttpClientResponse();
  final mockHeaders = MockHttpHeaders();

  // Mock HttpClient behavior
  when(() => mockClient.getUrl(any())).thenAnswer((_) async => mockRequest);
  when(() => mockRequest.headers).thenReturn(mockHeaders);
  when(() => mockRequest.close()).thenAnswer((_) async => mockResponse);
  when(() => mockResponse.compressionState)
      .thenReturn(HttpClientResponseCompressionState.notCompressed);
  when(() => mockResponse.contentLength).thenReturn(_image.length);
  when(() => mockResponse.statusCode).thenReturn(HttpStatus.ok);
  when(() => mockResponse.listen(
        any(),
        onError: any(named: "onError"),
        onDone: any(named: "onDone"),
        cancelOnError: any(named: "cancelOnError"),
      )).thenAnswer((invocation) {
    final onData =
        invocation.positionalArguments[0] as void Function(List<int>);
    final onDone = invocation.namedArguments[#onDone] as void Function()?;
    final onError = invocation.namedArguments[#onError] as Function?;
    final cancelOnError = invocation.namedArguments[#cancelOnError] as bool?;

    return Stream<List<int>>.fromIterable([_image]).listen(
      onData,
      onDone: onDone,
      onError: onError,
      cancelOnError: cancelOnError,
    );
  });

  return mockClient;
}

// A cute dog
final _image = base64Decode(
  "/9j/4AAQSkZJRgABAQAAAQABAAD/4QDeRXhpZgAASUkqAAgAAAAGABIBAwABAAAAAQAAABoBBQABAAAA...==",
);
