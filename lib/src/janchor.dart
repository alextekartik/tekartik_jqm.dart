part of tekartik_jquerymobile;

AnchorElement jNewAnchorElement({String href: '#', String title, bool external, Icon icon, bool asButton}) {
  AnchorElement anchorElement = new AnchorElement(href: href);
  if (external == true) {
    anchorElement.attributes[ATTR_REL] = REL_EXTERNAL;
  }

  if (icon != null) {
    anchorElement.attributes[ATTR_DATA_ICON] = icon.name;
  }

  if (asButton == true) {
    anchorElement.classes.add('ui-btn');
  }
  
  if (title != null) {
    anchorElement.innerHtml = title;
  }
  return anchorElement;
}

//void refresh() {
//   listViewRefresh(jsObject);
// }
class JAnchor extends JElement {
  factory JAnchor.fromElement(AnchorElement element) {
    if (element == null) {
      return null;
    }
    return new JAnchor(jsElement(element));
  }

  JAnchor(jsObject) : super(jsObject);

}
