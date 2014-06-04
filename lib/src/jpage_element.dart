part of tekartik_jquerymobile;

class JPageElement extends JObjectElement {
  JPageElement(jsObject) : super(jsObject);
  void page() {
    jsObject.callMethod('page');
  }
  
  void show() {
    
  }
}