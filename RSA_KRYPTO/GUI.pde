
class GUI {
  Button Encrypt, Decrypt;
  Textfield m;
  String mess;
  
  GUI() {
    Encrypt = cp5.addButton("encr");
    Encrypt.setPosition(100, 100)
      .setSize(200, 19)
      .setLabel("Encrypt Message")
      ;


    m = cp5.addTextfield("text");
    m.setPosition(100, 400)
      .setSize(200, 30)
      .setFocus(true)
      ;
  }
  
   void setTask(String s) {
    this.mess = s;
  }
  
  String getTextField() {
    return(cp5.get(Textfield.class, "text").getText());
  }
void claerTextField(){
  cp5.get(Textfield.class, "text").clear();
}
}
