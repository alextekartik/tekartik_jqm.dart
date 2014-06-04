part of tekartik_jquerymobile;

class JPageElement extends JObjectElement {
  JPageElement(jsObject) : super(jsObject);
  void page() {
    //devPrint(document.body.innerHtml);
    jsObject.callMethod('page');
  }
  
  void show() {
    
  }
}