import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patterns/test1.dart';

class Expressions {
  int add(int a, int b) {
    return a + b;
  }

  int sub(int a, int b) {
    return a - b;
  }

  int mul(int a, int b) {
    return a * b;
  }
}

void main() {
  test("test add function", () {
    var expressions = Expressions();
    expect(expressions.add(1, 3), 4);
  });
  test("test sub function", () {
    var expressions = Expressions();
    expect(expressions.sub(5, 3), equals(2));
  });
  test("test multiply function", () {
    var expressions = Expressions();
    expect(expressions.mul(5, 3), 15);
  });

  //widget test
  testWidgets("test my homepage has a title and number", (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: MyHomePage(number: 100, title: "Example title")),
    );
    //verify title exists
    expect(find.text("Example title"), findsOneWidget);
    //verify number exists
    expect(find.text("100"), findsOneWidget);
  });
}
