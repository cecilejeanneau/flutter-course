void main() {
  // classic type
  String hello = "Hello world !";

  print(hello);

  // optional type
  var name = "GEORGE !";
  name = "23";

  print(name);

  const age = 18;

  print(age);

  String? city;
  // print(city?.toUpperCase());
  print(city?.toUpperCase() ?? "Paris");
}