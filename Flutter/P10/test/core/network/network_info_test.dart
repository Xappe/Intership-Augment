import 'package:clean_arquiteture_tdd_course/core/network/network_info.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  NetworkInfoImpl networkInfo;
  MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group("isConnected", () {
    test("should forward the call to DataConnectionChecker.hasConnection", () async {
      //arrange
      final tHasConnnectionFuture = Future.value(true);

      when(mockDataConnectionChecker.hasConnection).thenAnswer((_) => tHasConnnectionFuture);
      //act
      final result = networkInfo.isConnected;
      //assert
      verify(mockDataConnectionChecker.hasConnection);
      expect(result, tHasConnnectionFuture);
    });
  });
}
