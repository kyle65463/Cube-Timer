import 'package:cubetimer/utils/statistics_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test ao5 under normal situation', () async {
    List<int> nums = [1, 2, 3, 4, 5, 6, 7];
    int result = StatisticsUtils.ao5(nums);
    expect(result, 5);

    nums = [111, 312312331, 30, 40, 5231313123, 60, 70];
    result = StatisticsUtils.ao5(nums);
    expect(result, 57); // (40 + 60 + 70) / 3 = 56.67

    nums = [1213, 221332, 3131, 412313, 5131231];
    result = StatisticsUtils.ao5(nums);
    expect(result, 212259); // (221332 + 3131 + 412313) / 3 = 212258.667

    nums = List.generate(10000, (index) => index);
    result = StatisticsUtils.ao5(nums);
    expect(result, 9997); // (9996 + 9997 + 9998) / 3 = 9997
  });

  test('Test ao5 when not enough data', () async {
    List<int> nums = [11232131331, 2, 3, 4];
    int result = StatisticsUtils.ao5(nums);
    expect(result, -1);

    nums = [];
    result = StatisticsUtils.ao5(nums);
    expect(result, -1);
  });

  test('Test ao5 with dnf', () async {
    List<int> nums = [-1, -2, 3, 4, 5, 6, 7];
    int result = StatisticsUtils.ao5(nums);
    expect(result, 5); // (4 + 5 + 6) / 3 = 5

    nums = [-1, -1, -1, 4, 5, 6, 7];
    result = StatisticsUtils.ao5(nums);
    expect(result, 6); // (5 + 6 + 7) / 3 = 6

    nums = [-1, -1, -1, 4, -1, 6, 7];
    result = StatisticsUtils.ao5(nums);
    expect(result, -2); // DNF

    nums = [1, 2, 3, -1, -1, 6, 7];
    result = StatisticsUtils.ao5(nums);
    expect(result, -2); // DNF

    nums = [1, 2, 9, 10, -1, 11, 12];
    result = StatisticsUtils.ao5(nums);
    expect(result, 11); // (10 + 11 + 12) / 3 = 11

    nums = [1, -1];
    result = StatisticsUtils.ao5(nums);
    expect(result, -1);

    nums = [-1, 1, 2, 3, 4];
    result = StatisticsUtils.ao5(nums);
    expect(result, 3); // (2 + 3 + 4) / 3 = 3

    nums = [1, 2, 3, -1, -1];
    result = StatisticsUtils.ao5(nums);
    expect(result, -2); // DNF
  });

  test('Test ao12 under normal situation', () async {
    List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    int result = StatisticsUtils.ao12(nums);
    expect(result, 6); // (2 + ... + 10) / 9 = 6

    nums.shuffle();
    result = StatisticsUtils.ao12(nums);
    expect(result, 6);

    nums = List.generate(10000, (index) => index);
    result = StatisticsUtils.ao12(nums);
    expect(result, 9993); // (9989 + ...  + 9997) / 9 = 9993
  });

  test('Test ao12 when not enough data', () async {
    List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    int result = StatisticsUtils.ao12(nums);
    expect(result, -1);

    nums = [];
    result = StatisticsUtils.ao12(nums);
    expect(result, -1);
  });

  test('Test ao12 with dnf', () async {
    List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, -1, -1, -1];
    int result = StatisticsUtils.ao12(nums);
    expect(result, -2); // DNF

    nums.shuffle();
    result = StatisticsUtils.ao12(nums);
    expect(result, -2); // DNF

    nums = [-1, -1, -1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    result = StatisticsUtils.ao12(nums);
    expect(result, 9); // (5 + ... + 13) / 9

    nums = List.generate(10000, (index) => index);
    nums.add(-1);
    result = StatisticsUtils.ao12(nums);
    expect(result, 9994); // (9990 + ... + 9998) / 3 = 9993

    nums = List.generate(10000, (index) => index);
    nums..add(-1)..add(-1);
    result = StatisticsUtils.ao12(nums);
    expect(result, 9995); // (9991 + ... + 9999) / 3 = 9993

    nums = List.generate(10000, (index) => index);
    nums..add(-1)..add(-1)..add(-1);
    result = StatisticsUtils.ao12(nums);
    expect(result, -2); // DNF
  });

  test('Best', () async {
    List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, -1, -1, -1];
    int result = StatisticsUtils.best(nums);
    expect(result, 1);

    nums.shuffle();
    result = StatisticsUtils.best(nums);
    expect(result, 1);

    nums = [-1, -1, -1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    result = StatisticsUtils.best(nums);
    expect(result, 4);

    nums = [];
    result = StatisticsUtils.best(nums);
    expect(result, -1);

    nums = [-1];
    result = StatisticsUtils.best(nums);
    expect(result, -2);

    nums = [-1, -1, -1];
    result = StatisticsUtils.best(nums);
    expect(result, -2);

    nums = [-1, 1];
    result = StatisticsUtils.best(nums);
    expect(result, 1);

    nums = [2, 10, -1];
    result = StatisticsUtils.best(nums);
    expect(result, 2);
  });
}
