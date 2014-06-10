part of tekartik_jquerymobile;

jPageElementCallPage(JElement jElement) {
  jElement.callMethod('page');
}

jPageElementCallEnhanceWithin(JElement jElement) {
  jElement.callMethod('enhanceWithin');
}

class JPageElement extends JElement {
  JPageElement(jsObject) : super(jsObject);
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