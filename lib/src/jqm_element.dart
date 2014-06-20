part of tekartik_jquerymobile;

abstract class JqmObjectWithElement extends Object {
  JsObject get jsObject;

  void disable() {
    element.classes.add('ui-state-disabled');
  }

  void enable() {
    element.classes.remove('ui-state-disabled');
  }
  
  Element get element;
}


class JqmElement extends JElement with JqmObjectWithElement {
  JqmElement.empty() : super.empty();
  JqmElement(JsObject jsObject) : super(jsObject);

  factory JqmElement.fromElement(Element element) {
    if (element == null) {
      return null;
    }
    return new JqmElement(jsElement(element));
  }
}
