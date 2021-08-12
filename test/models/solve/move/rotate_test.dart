import 'package:cubetimer/models/solve/move/move.dart';
import 'package:cubetimer/models/solve/move/rotate.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Basic RotateX to string', () async {
    Move move = RotateX(positive: true);
    expect(move.toString(), 'x');
    move = RotateX(positive: false);
    expect(move.toString(), "x'");
    move = RotateX(positive: true, count: 2);
    expect(move.toString(), "x2");
  });

  test('Basic RotateY to string', () async {
    Move move = RotateY(positive: true);
    expect(move.toString(), 'y');
    move = RotateY(positive: false);
    expect(move.toString(), "y'");
    move = RotateY(positive: true, count: 2);
    expect(move.toString(), "y2");
  });

  test('Basic RotateZ to string', () async {
    Move move = RotateZ(positive: true);
    expect(move.toString(), 'z');
    move = RotateZ(positive: false);
    expect(move.toString(), "z'");
    move = RotateZ(positive: true, count: 2);
    expect(move.toString(), "z2");
  });
}
