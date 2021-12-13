
class GUI {
  Button Encrypt, Decrypt;
  Textfield PlainText;
  Textfield EncryptedMessages;
  Textfield KlarText;
  String mess;

  GUI() {
    Encrypt = cp5.addButton("encr");
    Encrypt.setPosition(400, 100)
      .setSize(200, 30)
      .setLabel("Encrypt Message")
      ;


    PlainText = cp5.addTextfield("text");
    PlainText.setPosition(100, 100)
      .setSize(200, 30)
      .setFocus(true)
      ;

    EncryptedMessages = cp5.addTextfield("EncryptedText");
    EncryptedMessages.setPosition(100, 150)
      .setSize(200, 30)
      .setFocus(true)
      ;


    Encrypt = cp5.addButton("Decrypt");
    Encrypt.setPosition(400, 150)
      .setSize(200, 30)
      .setLabel("Decrypt Message")
      ;
      
      
    KlarText = cp5.addTextfield("PlainText");
    KlarText.setPosition(100, 200)
      .setSize(500, 40)
      .setFocus(true)
      ;
  }

  void setEncText(String s) {
    EncryptedMessages.setText(s);
  }
  
  String getPlainTextField() {
    return(cp5.get(Textfield.class, "text").getText());
  }

  String getEncryptedTextField() {
    return(cp5.get(Textfield.class, "EncryptedText").getText());
  }
  
   
   void DecryptedMessage(String s) {
     PlainText.setText(s);
   } 
  
  void claerTextField() {
    cp5.get(Textfield.class, "text").clear();
  }
}
