void main(){
  displayMessage("hey", 5);
  displayMessage2("hey2", number: 2);
  displayMessage2("hey1");
  displayMessage3(number: 3, message: getMessage("hey4"));
}

void displayMessage(String message, int number) {

  for(int i = 0; i < number; i++) {
    print(message);
  }

}

void displayMessage2(String message, {int number = 1}) {

  for(int i = 0; i < number; i++) {
    print(message);
  }

}

// param order doesn't matter anymore with named parameters
void displayMessage3({required String message, int number = 3}) {

  for(int i = 0; i < number; i++) {
    print(message);
  }

}

String getMessage(String message){
  return message;
}