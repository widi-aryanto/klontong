import 'package:flutter_test/flutter_test.dart';
import 'package:klontong/data/service/api_service.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import '../json_reader.dart';
import '../utils/test_helper.mocks.dart';

void main() {
  late ApiService apiService;
  late MockHttpClient mockHttpClient;
  late String dataList;
  late String dataDetail;

  setUp(() {
    mockHttpClient = MockHttpClient();
    apiService = ApiService(
      httpClient: mockHttpClient,
    );
    dataList = readJson("dummy/data_list.json");
    dataDetail = readJson("dummy/data.json");
  });

  group("API listData()", () {
    test("should return list of data when the response code is 200", () async {
      // arrange
      when(mockHttpClient.get(
        Uri.parse("https://my-json-server.typicode.com/widi-aryanto/klontong/list"),
      )).thenAnswer((_) async => http.Response(readJson("dummy/data_list.json"), 200));

      // act
      final result = await apiService.listData();

      // assert
      expect(result.toRawJson(), equals(dataList));
    });
  });

  group("API detail()", () {
    test("should return detail when the response code is 200", () async {
      // arrange
      when(mockHttpClient.get(
        Uri.parse("https://my-json-server.typicode.com/widi-aryanto/klontong/detail"),
      )).thenAnswer((_) async => http.Response(readJson("dummy/data.json"), 200));

      // act
      final result = await apiService.data(86);

      // assert
      expect(result.toRawJson(), equals(dataDetail));
    });
  });

  group("API searchData()", () {
    test("should return search list of data when the response code is 200", () async {
      // arrange
      when(mockHttpClient.get(
        Uri.parse("https://my-json-server.typicode.com/widi-aryanto/klontong/search"),
      )).thenAnswer((_) async => http.Response(readJson("dummy/data_list.json"), 200));

      // act
      final result = await apiService.searchData("ciki");

      // assert
      expect(result.toRawJson(), equals(dataList));
    });
  });
}