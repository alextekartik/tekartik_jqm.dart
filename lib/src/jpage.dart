part of tekartik_jquerymobile;

jPageElementCallPage(JElement jElement) {
  jElement.callMethod('page');
}

jPageElementCallEnhanceWithin(JElement jElement) {
  jElement.callMethod('enhanceWithin');
}

DivElement jNewPageElement(String id) {
  DivElement element = new DivElement()
      ..id = id
      ..attributes[ATTR_DATA_ROLE] = ROLE_PAGE;
  return element;
}

DivElement jNewPageHeaderElement({String title}) {
  HeadingElement h1 = new HeadingElement.h1()..setInnerHtml(title);
  DivElement element = new DivElement()
      ..attributes[ATTR_DATA_ROLE] = ROLE_HEADER
      ..children.add(h1);
  return element;
}

DivElement jNewPageContentElement() {
  // new in jq 1.4
  // <div role="main" class="ui-content">
  DivElement element = new DivElement()..attributes["role"] = "main" //
      ..classes.add('ui-content');
  return element;
}

class JPage extends JElement {
  factory JPage.fromElement(Element element) {
    if (element == null) {
      return null;
    }
    return new JPage(jsElement(element));
  }

  JPage(jsObject) : super(jsObject);
}


@deprecated // use JPage instead
class JPageElement extends JElement {
  JPageElement(jsElement) : super(jsElement);
  void page() {
    //devPrint("####1 " + document.body.innerHtml);
    //devPrint("## JPageElement.before page " + element.outerHtml);
    jsObject.callMethod('page');
    //devPrint("## JPageElement.after page " + element.outerHtml);
  }
  void enhanceWithin() {
    //devPrint("####2 " + document.body.innerHtml);
    jsObject.callMethod('enhanceWithin');
  }


  bool get isEnhanced {
    // Before
    //  <div data-role="page" id="simple"><div data-role="header" role="banner" class="ui-header ui-bar-inherit">h1 class="ui-title" role="heading" aria-level="1">Simple page</h1>  </div><div role="main" class="ui-content"    done</div></div>
    // After
    //  <div data-role="page" id="simple" tabindex="0" class="ui-page ui-page-theme-a"
    return element.classes.contains("ui-page");
  }
  void show() {

  }
}
