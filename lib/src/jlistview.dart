part of tekartik_jquerymobile;

LIElement jListNewItemElement({String title, String summary, String href, bool external, Icon icon}) {
  // simple href support of now
  Element textWrapper;
  LIElement listElement = new LIElement();
  Element wrapperElement;


  if (href != null) {
    AnchorElement anchorElement = new AnchorElement(href: href);
    if (external == true) {
      anchorElement.attributes[ATTR_REL] = REL_EXTERNAL;
    }

    if (icon != null) {
      anchorElement.attributes[ATTR_DATA_ICON] = icon.name;
    }
    wrapperElement = anchorElement;
    listElement.append(wrapperElement);
  } else {
    if (icon != null) {
      devError('For now, icon needs anchor - TO BE IMPLEMENTED (OR NOT)');
    }
    wrapperElement = listElement;
  }

  // Support for summary
  // <h2>title</h2
  // <p>summary</p>
  if (summary != null) {
    // webmidi=xxxx:output_num
    // handle factories
    wrapperElement
        ..append(//
        new HeadingElement.h2()..innerHtml = title)
        //
        ..append(new ParagraphElement()..innerHtml = summary);
    //new JqmElement.fromElement(anchorElement)..disable();


  } else {
    wrapperElement.innerHtml = title;
  }


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
