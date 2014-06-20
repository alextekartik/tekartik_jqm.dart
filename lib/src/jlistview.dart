part of tekartik_jquerymobile;

LIElement jListNewItemElement({String title, String href, bool external}) {
  // simple href support of now
  Element textWrapper;
  LIElement listElement = new LIElement();
  if (href != null) {
    AnchorElement anchorElement = new AnchorElement(href: href);
    if (external == true) {
      anchorElement.attributes[ATTR_REL] = REL_EXTERNAL;
    }
    textWrapper = anchorElement;

    listElement.children.add(textWrapper);
  } else {
    textWrapper = listElement;
  }
  textWrapper.innerHtml = title;


  return listElement;
}


UListElement jListNewViewElement({bool inset: false}) {
  UListElement element = new UListElement()..attributes[ATTR_DATA_ROLE] = ROLE_LISTVIEW;
  if (inset) {
    element.attributes[ATTR_DATA_INSET] = INSET_TRUE;
  }
  return element;
}

//void refresh() {
//   listViewRefresh(jsObject);
// }
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

  bool get isEnhanced {
    /**
     * before
     * <ul data-role="listview" data-inset="true"><li>test</li></ul></div>
     * after
     * <ul data-role="listview" data-inset="true" class="ui-listview ui-listview-inset ui-corner-all ui-shadow"><li class="ui-li-static ui-body-inherit ui-first-child ui-last-child">test</li></ul></div>
     */

    return element.classes.contains("ui-listview");
  }
  // To call only once for object added dynamically
  void enhance() {
    if (isEnhanced) {
      devError('already enhanced ${element.outerHtml}');
    }
    // first time create the listview
    callMethod('listview');

    // second refresh it
    refresh();
  }

}
