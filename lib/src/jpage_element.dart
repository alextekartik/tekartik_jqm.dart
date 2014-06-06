part of tekartik_jquerymobile;

class JPageElement extends JElement {
  JPageElement(jsObject) : super(jsObject);
  void page() {
    //devPrint(document.body.innerHtml);
    jsObject.callMethod('page');
  }
  
  void show() {
    
  }
}