
class GUI {
  Button Encrypt, Decrypt;
  Textfield m;
  String mess;

  GUI() {
    Encrypt = cp5.addButton("encr");
    Encrypt.setPosition(400, 100)
      .setSize(200, 30)
      .setLabel("Encrypt Message")
      ;


    m = cp5.addTextfield("text");
    m.setPosition(100, 100)
      .setSize(200, 30)
      .setFocus(true)
      ;

    m = cp5.addTextfield("EncryptedText");
    m.setPosition(100, 150)
      .setSize(200, 30)
      .setFocus(true)
      ;


    Encrypt = cp5.addButton("Decrypt");
    Encrypt.setPosition(400, 150)
      .setSize(200, 30)
      .setLabel("Decrypt Message")
      ;
      
      
    m = cp5.addTextfield("Plain Text");
    m.setPosition(100, 200)
      .setSize(500, 40)
      .setFocus(true)
      ;
  }

  void setTask(String s) {
    this.mess = s;
  }

  String getTextField() {
    return(cp5.get(Textfield.class, "text").getText());
  }
  void claerTextField() {
    cp5.get(Textfield.class, "text").clear();
  }
}
