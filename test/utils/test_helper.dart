import 'package:klontong/data/service/api_service.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  ApiService,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
Future<void> main() async {}