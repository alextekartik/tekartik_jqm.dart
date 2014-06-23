part of tekartik_jquerymobile;

//<div data-role="navbar">
//  <ul>
//    <li><a href="a.html" class="ui-btn-active ui-state-persist">One</a></li>
//    <li><a href="b.html">Two</a></li>
//  </ul>
//</div><!-- /navbar -->

DivElement jNewNavBarElement({IconPos iconPos}) {
  DivElement element = new DivElement()..attributes[ATTR_DATA_ROLE] = ROLE_NAVBAR;

  if (iconPos != null) {
    element.attributes[ATTR_DATA_ICONPOS] = iconPos.name;
  }
  return element;
}

class JNavBar extends JqmElement {
  UListElement _listElement;
  UListElement get listElement {
    if (_listElement == null) {
      if (element.children.isNotEmpty) {
        _listElement = element.children.first;
      }
      if (_listElement == null) {
        _listElement = new UListElement();
        element.children.insert(0, _listElement);
      }
    }
    return _listElement;
  }

  factory JNavBar.fromElement(Element element) {
    if (element == null) {
      return null;
    }
    return new JNavBar(jsElement(element));
  }

  JNavBar(jsObject) : super(jsObject) {

  }
}
