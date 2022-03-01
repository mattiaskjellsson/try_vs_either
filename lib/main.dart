import 'dart:math';
import 'package:dartz/dartz.dart';

class Failure {}

int f() {
  throw Exception();
}

Either<Failure, int> g() {
  return Left(Failure());
}


main() async { 
  const N = 10000;
  Stopwatch s1 = Stopwatch();
  Stopwatch s2 = Stopwatch();
  
  s1.start();
  for(int i = 0; i < N; i++) {
    try {
      final a = f();
    } catch (e) {
    }
  }
  s1.stop();
  
  s2.start();
  for(int i = 0; i < N; i++) {
    final b = g();
  }
  s2.stop();
  
  
  print(s1.elapsedMicroseconds);
  print(s2.elapsedMicroseconds);
}
