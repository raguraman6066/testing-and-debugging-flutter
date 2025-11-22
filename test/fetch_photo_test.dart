import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:patterns/photo.dart';

import 'fetch_photo_test.mocks.dart';

@GenerateMocks([Client])
void main() {
  group("fetch photo", () {
    test("return photo successfully", () async {
      final client = MockClient();
      when(
        client.get(Uri.parse("https://jsonplaceholder.typicode.com/photos/1")),
      ).thenAnswer((_) async {
        return Response(
          '{"id":1,"title":"sample title","url":"www.sample.com"}',
          200,
        );
      });
      expect(await fetchPhoto(client), isA<Photo>());
    });
    test("not return photo exception", () async {
      final client = MockClient();
      when(
        client.get(Uri.parse("https://jsonplaceholder.typicode.com/photos/1")),
      ).thenAnswer((_) async {
        return Response('Not Found', 404);
      });
      expect(fetchPhoto(client), throwsException);
    });
  });
}
