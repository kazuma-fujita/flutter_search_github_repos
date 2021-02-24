import 'package:flutter_search_github_repos/github_api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_web_server/mock_web_server.dart';

import 'fixture.dart';

void main() {
  MockWebServer _server;
  GithubApiClient _apiClient;

  setUp(() async {
    _server = MockWebServer(port: 8081);
    _apiClient = GithubApiClientImpl(baseUrl: 'http://127.0.0.1:8081');
    await _server.start();
  });

  tearDown(() async {
    await _server.shutdown();
  });

  group('API communication testing', () {
    test('Http status 200 test', () async {
      final mockResponse = fixture('http_status_200.json');
      _server.enqueue(httpCode: 200, body: mockResponse);
      final responseBody = await _apiClient.get('/endpoint');
      final request = _server.takeRequest();
      expect(responseBody, isNotEmpty);
      expect(request.uri.path, '/endpoint');
    });

    test('Http status 404 test', () async {
      final mockResponse = fixture('http_status_404.json');
      _server.enqueue(httpCode: 404, body: mockResponse);
      expect(() => _apiClient.get('/endpoint'), throwsException);
    });

    test('Http status 422 test', () async {
      final mockResponse = fixture('http_status_422.json');
      _server.enqueue(httpCode: 422, body: mockResponse);
      expect(() => _apiClient.get('/endpoint'), throwsException);
    });
  });

  group('API communication error testing', () {
    test('Network error test', () async {
      _server.enqueue(httpCode: 200);
      await _server.shutdown();
      expect(() => _apiClient.get('/endpoint'), throwsException);
    });
  });
}
