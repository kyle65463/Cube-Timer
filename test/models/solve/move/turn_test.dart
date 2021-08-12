import 'package:cubetimer/models/solve/move/move.dart';
import 'package:cubetimer/models/solve/move/turn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Basic TurnR to string', () async {
    Move move = TurnR(positive: true);
    expect(move.toString(), 'R');
    move = TurnR(positive: false);
    expect(move.toString(), "R'");
    move = TurnR(positive: true, count: 2);
    expect(move.toString(), "R2");
    move = TurnR(positive: false, wideness: 2);
    expect(move.toString(), "Rw'");
    move = TurnR(positive: true, wideness: 3);
    expect(move.toString(), "2Rw");
    move = TurnR(positive: false, wideness: 4);
    expect(move.toString(), "3Rw'");
    move = TurnR(positive: true, count: 2, wideness: 5);
    expect(move.toString(), "4Rw2");
  });

  test('Basic TurnL to string', () async {
    Move move = TurnL(positive: true);
    expect(move.toString(), 'L');
    move = TurnL(positive: false);
    expect(move.toString(), "L'");
    move = TurnL(positive: true, count: 2);
    expect(move.toString(), "L2");
    move = TurnL(positive: false, wideness: 2);
    expect(move.toString(), "Lw'");
    move = TurnL(positive: true, wideness: 3);
    expect(move.toString(), "2Lw");
    move = TurnL(positive: false, wideness: 4);
    expect(move.toString(), "3Lw'");
    move = TurnL(positive: true, count: 2, wideness: 5);
    expect(move.toString(), "4Lw2");
  });

  test('Basic TurnU to string', () async {
    Move move = TurnU(positive: true);
    expect(move.toString(), 'U');
    move = TurnU(positive: false);
    expect(move.toString(), "U'");
    move = TurnU(positive: true, count: 2);
    expect(move.toString(), "U2");
    move = TurnU(positive: false, wideness: 2);
    expect(move.toString(), "Uw'");
    move = TurnU(positive: true, wideness: 3);
    expect(move.toString(), "2Uw");
    move = TurnU(positive: false, wideness: 4);
    expect(move.toString(), "3Uw'");
    move = TurnU(positive: true, count: 2, wideness: 5);
    expect(move.toString(), "4Uw2");
  });

  test('Basic TurnD to string', () async {
    Move move = TurnD(positive: true);
    expect(move.toString(), 'D');
    move = TurnD(positive: false);
    expect(move.toString(), "D'");
    move = TurnD(positive: true, count: 2);
    expect(move.toString(), "D2");
    move = TurnD(positive: false, wideness: 2);
    expect(move.toString(), "Dw'");
    move = TurnD(positive: true, wideness: 3);
    expect(move.toString(), "2Dw");
    move = TurnD(positive: false, wideness: 4);
    expect(move.toString(), "3Dw'");
    move = TurnD(positive: true, count: 2, wideness: 5);
    expect(move.toString(), "4Dw2");
  });

  test('Basic TurnF to string', () async {
    Move move = TurnF(positive: true);
    expect(move.toString(), 'F');
    move = TurnF(positive: false);
    expect(move.toString(), "F'");
    move = TurnF(positive: true, count: 2);
    expect(move.toString(), "F2");
    move = TurnF(positive: false, wideness: 2);
    expect(move.toString(), "Fw'");
    move = TurnF(positive: true, wideness: 3);
    expect(move.toString(), "2Fw");
    move = TurnF(positive: false, wideness: 4);
    expect(move.toString(), "3Fw'");
    move = TurnF(positive: true, count: 2, wideness: 5);
    expect(move.toString(), "4Fw2");
  });

  test('Basic TurnB to string', () async {
    Move move = TurnB(positive: true);
    expect(move.toString(), 'B');
    move = TurnB(positive: false);
    expect(move.toString(), "B'");
    move = TurnB(positive: true, count: 2);
    expect(move.toString(), "B2");
    move = TurnB(positive: false, wideness: 2);
    expect(move.toString(), "Bw'");
    move = TurnB(positive: true, wideness: 3);
    expect(move.toString(), "2Bw");
    move = TurnB(positive: false, wideness: 4);
    expect(move.toString(), "3Bw'");
    move = TurnB(positive: true, count: 2, wideness: 5);
    expect(move.toString(), "4Bw2");
  });

  test('Basic TurnM to string', () async {
    Move move = TurnM(positive: true);
    expect(move.toString(), 'M');
    move = TurnM(positive: false);
    expect(move.toString(), "M'");
    move = TurnM(positive: true, count: 2);
    expect(move.toString(), "M2");
    move = TurnM(positive: false, wideness: 2);
    expect(move.toString(), "Mw'");
    move = TurnM(positive: true, wideness: 3);
    expect(move.toString(), "2Mw");
    move = TurnM(positive: false, wideness: 4);
    expect(move.toString(), "3Mw'");
    move = TurnM(positive: true, count: 2, wideness: 5);
    expect(move.toString(), "4Mw2");
  });

  test('Basic TurnS to string', () async {
    Move move = TurnS(positive: true);
    expect(move.toString(), 'S');
    move = TurnS(positive: false);
    expect(move.toString(), "S'");
    move = TurnS(positive: true, count: 2);
    expect(move.toString(), "S2");
    move = TurnS(positive: false, wideness: 2);
    expect(move.toString(), "Sw'");
    move = TurnS(positive: true, wideness: 3);
    expect(move.toString(), "2Sw");
    move = TurnS(positive: false, wideness: 4);
    expect(move.toString(), "3Sw'");
    move = TurnS(positive: true, count: 2, wideness: 5);
    expect(move.toString(), "4Sw2");
  });

  test('Basic TurnE to string', () async {
    Move move = TurnE(positive: true);
    expect(move.toString(), 'E');
    move = TurnE(positive: false);
    expect(move.toString(), "E'");
    move = TurnE(positive: true, count: 2);
    expect(move.toString(), "E2");
    move = TurnE(positive: false, wideness: 2);
    expect(move.toString(), "Ew'");
    move = TurnE(positive: true, wideness: 3);
    expect(move.toString(), "2Ew");
    move = TurnE(positive: false, wideness: 4);
    expect(move.toString(), "3Ew'");
    move = TurnE(positive: true, count: 2, wideness: 5);
    expect(move.toString(), "4Ew2");
  });
}
