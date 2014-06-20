part of tekartik_jquerymobile_controller;


//const String DATA_ROLE_PAGE = r'page';

//JPageElement findJPageElement(Polymer top) {
//  //JsObject jsObject = jq.jElement(firstChild as Element).jsObject;//jElement(querjq.queryElement($['simple']);
//  Element jqmPageElement = top.querySelector('[data-role="page"]');
//  devPrint('YES${jqmPageElement}');
//  if (jqmPageElement == null) {
//    return null;
//  }
//  JPageElement jPageElement = new JPageElement(jElement(jqmPageElement).jsObject);
//  devPrint('YES${jqmPageElement}');
//  return jPageElement;
//}

//devPrint(jsObjectAsMap(jsObject));

abstract class PageHandleOnShow {
  void onShow();
}

abstract class PageHandleOnBeforeShow {
  void onBeforeShow();
}

abstract class PageHandleOnBeforeHide {
  void onBeforeHide();
}

abstract class PageHandleOnHide {
  void onHide();
}

class Page {

  PageContainer container;
  static Logger log = new Logger("tekartik_jqm_page");

  /**
   * smart id getter
   * can get from polymer element or from container
   */
  String get id {
    return jPage.id;
  }

  List<Element> get children {
    return jPage.element.children;
  }

  void _initPage() {
    if (jPage.element.parent == null) {
      container.jPageContainer.element.children.add(jPage.element);
    }
    container.pages[id] = this;
  }
  Page.create(this.container, String id) {
    jPage = new JPage.fromElement(jNewPageElement(id));
    _initPage();
  }
  Page.created(this.container, String id) {
    jPage = new JPage.fromElement(container.jPageContainer.element.querySelector('#$id'));
    _initPage();
  }

  /**
   * A page has both a container and jdom element
   * 
   * It is automatically added to the container
   */
  Page(this.container, this.jPage) {
    _initPage();
  }

  JPage jPage;

  void enhance() {
    //jPage.page();
    //jPageElement.enhanceWithin();
  }



  @override
  attached() {
    /*
    log.finest('JqmPage.attached $id');
    super.attached();


    if (id.isEmpty) {
      devError("id cannot be empty  ${outerHtml}");
    }
    //    // This is for javascript where pages are loaded later...
    //    on[JQM_WIDGET_ATTACHED_EVENT_TYPE].listen((CustomEvent e) {
    //      print(JQM_WIDGET_ATTACHED_EVENT_TYPE);
    //      print(e);
    //      print(e.detail);
    //      JqmWidget widget = e.detail;
    //      if (widget is JqmPageHeaderWidget) {
    //        widget.page();
    //
    //      }
    //    });

    // Wait for all the changes to be made
    Polymer.onReady.then((_) {
        //devPrint("JqmPage: ${innerHtml}");


 //     Element pageElement = this.querySelector('[data-role="page"]');

//      //
//      //JsObject jsObject = jq.jElement(firstChild as Element).jsObject;//jElement(querjq.queryElement($['simple']);
//      //    Element jqmPageElement = querySelector(".ui-page");
//      //String content = innerHtml;
//      //devPrint(innerHtml);
//      //  devPrint('### $jqmPageElement');
//      // detached content right away
      Element pageElement = shadowRoot.querySelector('[data-role="page"]');

      // if not found create it
      if (pageElement == null) {
        
        //
        // search in content also
        pageElement = this.querySelector('[data-role="page"]');
        if (pageElement == null) {
         
         
        }
      }
      if (pageElement != null) {
        devError('found date-role=page in ${outerHtml} - please remove');
      }
      
      
               pageElement = new DivElement()
                   ..attributes[ATTR_DATA_ROLE] = DATA_ROLE_PAGE
                   ..id = id;
               String theme = attributes[ATTR_DATA_THEME];
               if (theme != null) {
                 pageElement.attributes[ATTR_DATA_THEME] = theme;
               }
               pageElement.children.addAll(shadowRoot.children);
               
               replaceContent(pageElement, children);
             
      //devError("temp");
      //devPrint(pageElement.innerHtml);

//      // Find content
//      List<Element> contentElements = new List();
//      for (Element child in children) {
//        if (child.attributes[ATTR_DATA_ROLE] == 'page') {
//          break;
//        }
//        contentElements.add(child);
//      }
//      replaceContent(pageElement, contentElements);
//      pageElement.id = id;
//      // Also chage our own id
//      // Otherwise we have 2 items with the same id
//      // jqm 1.4.2 does not like that (jqm_page_test.html)
//      // if the content is a direct body child
//      if (parent == document.body) {
//        id = "jqm-page-$id";
//      }

      //devPrint(pageElement.innerHtml);
              // devPrint(pageElement.outerHtml);
      document.body.children.insert(0, pageElement);


      JPageElement jPage = new JPageElement(jElement(pageElement).jsObject);
      //jPage.element.attributes['data-url'] = '#id';
      jPageElement = jPage;

      if (jPageElement.isEnhanced) {
        devError("weird page is already enhanced... ${pageElement.innerHtml}");
      }
      enhance();

      // Import for js to add the page
      // This is done automatically for JqmPage object
      asyncFire(JQM_PAGE_ATTACHED_EVENT_TYPE, detail: this);
    });
    * */
  }

  Element find(String selector) {
    return jPage.element.querySelector(selector);
  }
  Element get(String id) {
    return find('#$id');
  }

  /**
   * Get by id
   */
  JListView getListView(String id) => new JListView.fromElement(get(id));
  JListView findListView(String selector) => new JListView.fromElement(find(selector));
}
