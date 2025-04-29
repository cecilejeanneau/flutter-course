import 'dart:async';

Future<void> waitALittleBit() async {
  print("before");
  await Future.delayed(const Duration(seconds: 3));
  print("after");
}

Future<String> getAsyncName() async {
  return "George";
}

Future<void> main() async {
  await waitALittleBit();
  getAsyncName().then((value) => print(value));
}