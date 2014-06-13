part of tekartik_jquerymobile;

LIElement jListNewItem({String title, String href}) {
 // simple href support of now
  Element textWrapper;
  LIElement listElement = new LIElement();
  if (href != null) {
    textWrapper = new AnchorElement(href: href);
    listElement.children.add(textWrapper);
  } else {
    textWrapper = listElement;
  }
  textWrapper.innerHtml = title;
  
  return listElement;
}

class JListView extends JElement {
  factory JListView.fromElement(Element element) {
    if (element == null) {
      return null;
    }
    return new JListView(jsElement(element));
  }
  
  JListView(jsObject) : super(jsObject);
  
  /**
   * refresh a list view
   * to call after the list is modified
   */
  void refresh() {
    callMethod('listview', ['refresh']);
  }
 
}