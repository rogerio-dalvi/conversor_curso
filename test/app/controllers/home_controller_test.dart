import 'package:conversor_curso/app/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final homeController = HomeController(
    fromText: fromText,
    toText: toText,
  );

  test('Deve converter de real para dolar', () {
    fromText.text = '2.0';
    homeController.convert();
    expect(toText.text, '0.36');
  });
}
