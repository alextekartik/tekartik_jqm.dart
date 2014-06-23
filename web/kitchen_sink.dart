library index;

import 'package:tekartik_jquery/jquery.dart';
import 'package:tekartik_jqm/jquerymobile.dart';
import 'package:tekartik_jqm/jquerymobile_controller.dart';
import 'package:tekartik_jqm/jquerymobile_loader.dart';
import 'package:tekartik_utils/test_utils_browser.dart';
import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/log_utils.dart';

import 'dart:html';

const String MAIN_PAGE_ID = "main";
const String LISTVIEWS_MENU_PAGE_ID = "listviews_menu";
const String FOOTERS_MENU_PAGE_ID = "footers_menu";
const String NAVBARS_MENU_PAGE_ID = "navbars_menu";

const String TEST_2_PAGE_ID = "test_dynamic_2";
const String TEST_1_PAGE_ID = "test_dynamic_1";

class TestPageContainer extends PageContainer with ContainerPageFactory {
  TestPageContainer(JPageContainer jPageContainer) : super(jPageContainer) {
    container = this;
  }

  @override
  Page createPage(String pageId) {
    switch (pageId) {
      case MAIN_PAGE_ID:
        return new MainPage(this, pageId);
      case TEST_2_PAGE_ID:
        return new TestDynamic2Page.create(this, pageId);
      case TEST_1_PAGE_ID:
        return new TestDynamicPage.create(this, pageId);
      case FOOTERS_MENU_PAGE_ID:
        return new FootersMenuPage(container, pageId);
    }
    return null;
  }

}

class MainPage extends Page /*with jqm.PageWithOnBeforeShow, jqm.PageWithOnBeforeTransition */ {
  MainPage(PageContainer container, String id) : //
      super.created(container, id) {

    UListElement ul = get('menu');
    ul.append(jListNewItemElement(title: "Popup with code", href: '#')..onClick.listen((e) {
          new JPopup.fromElement(get('test_popup')).open();
        }));
    ul.append(jListNewItemElement(title: "Footers", href: '#${FOOTERS_MENU_PAGE_ID}'));
    ul.append(jListNewItemElement(title: "Navbars", href: '#${NAVBARS_MENU_PAGE_ID}'));
    ul.append(jListNewItemElement(title: "Listviews", href: '#${LISTVIEWS_MENU_PAGE_ID}'));


    new JListView.fromElement(ul).refresh();
  }
}


class FootersMenuPage extends Page /*with jqm.PageWithOnBeforeShow, jqm.PageWithOnBeforeTransition */ {
  FootersMenuPage(PageContainer container, String pageId) : //
      super.create(container, pageId) {

    UListElement ul = jListNewViewElement();
    DivElement header = jNewPageHeaderElement(title: 'Footers menu header title');
    //    ul.append(jListNewItemElement(title: "Footer", href: '')..onClick.listen((e) {
    //          new JPopup.fromElement(get('test_popup')).open();
    //        }));
    //
    //    new JListView.fromElement(ul).refresh();
    DivElement footer = jNewPageFooterElement(title: 'Footers menu title', fixed: true);
    children.addAll([header, footer]);
  }
}

class NavBarsMenuPage extends Page {
  @override
  onBeforeCreate() {
    UListElement ul = jListNewViewElement();
    DivElement header = jNewPageHeaderElement(title: 'Navbars menu header title');
    DivElement content = jNewPageContentElement();

    DivElement navbar = jNewNavBarElement();
    content.append(navbar);
    JNavBar jNavBar = new JNavBar.fromElement(navbar);
    jNavBar.listElement.append(jListNewItemElement(title: 'title'));
    jNavBar.listElement.append(jListNewItemElement(title: 'title', href: '#', icon: Icon.PLUS));

    //    content.append(ul);
    //        ul.append(jListNewItemElement(title: "Footer", href: '')..onClick.listen((e) {
    //              new JPopup.fromElement(get('test_popup')).open();
    //            }));
    //
    //    new JListView.fromElement(ul).refresh();
    DivElement footer = jNewPageFooterElement(fixed: true);
    DivElement footerNavbar = jNewNavBarElement(iconPos: IconPos.BOTTOM);
    jNavBar = new JNavBar.fromElement(footerNavbar);
    jNavBar.listElement.append(jListNewItemElement(title: 'title'));
    jNavBar.listElement.append(jListNewItemElement(title: 'title', href: '#', icon: Icon.PLUS));

    footer.append(footerNavbar);
    children.addAll([header//                     , content
      , footer]);

  }

}

class ListViewsMenuPage extends Page {
  @override
  onBeforeCreate() {
    DivElement header = jNewPageHeaderElement(title: 'Listviews menu header title');
    DivElement content = jNewPageContentElement();

    content.append(new ParagraphElement()..innerHtml = "normal");
    UListElement ul = jListNewViewElement();
    ul.append(jListNewItemElement(title: "Popup with code", href: '#')..onClick.listen((e) {
          new JPopup.fromElement(get('test_popup')).open();
        }));
    ul.append(jListNewItemElement(title: "Footers", href: '#${FOOTERS_MENU_PAGE_ID}'));
    ul.append(jListNewItemElement(title: "Navbars", href: '#${NAVBARS_MENU_PAGE_ID}'));
    ul.append(jListNewItemElement(title: 'title', href: '#', icon: Icon.PLUS));
    content.append(ul);

    content.append(new ParagraphElement()..innerHtml = "inset: true");
    ul = jListNewViewElement(inset: true);
    ul.append(jListNewItemElement(title: "Popup with code", href: '#')..onClick.listen((e) {
          new JPopup.fromElement(get('test_popup')).open();
        }));
    ul.append(jListNewItemElement(title: "Footers", href: '#${FOOTERS_MENU_PAGE_ID}'));
    ul.append(jListNewItemElement(title: "Navbars", href: '#${NAVBARS_MENU_PAGE_ID}'));
    ul.append(jListNewItemElement(title: 'title', href: '#', icon: Icon.PLUS));
    content.append(ul);


    children.addAll([header, content]);

  }

}

LIElement jListNewPageIdItemElement(String id) {
  return jListNewItemElement(title: id, //
  href: '#$id', //
  external: true);
}

class TestDynamicPage extends Page /*with jqm.PageWithOnBeforeShow, jqm.PageWithOnBeforeTransition */ {
  TestDynamicPage.create(PageContainer container, String id) : //
      super.create(container, id) {
    DivElement header = jNewPageHeaderElement(title: 'Dynamic page 1');
    //
    //    jqm.DivPageContent content = new jqm.DivPageContent();
    //
    //    ButtonElement button = new ButtonElement()..setInnerHtml('button');
    //    content.element.children.add(button);
    //    element.append(header.element);
    //    element.append(content.element);
    //
    UListElement ul = jListNewViewElement(inset: true);
    DivElement content = jNewPageContentElement();
    JListView listView = new JListView.fromElement(ul);
    ul.children.addAll([jListNewItemElement(title: "Just a title"), //
      jListNewPageIdItemElement(TEST_1_PAGE_ID), //
      jListNewPageIdItemElement(TEST_2_PAGE_ID), //
      jListNewPageIdItemElement('static')]);
    content.children.add(ul);
    //
    //
    //    // Simple list
    //    LIElement liElement = new LIElement()//..append(new AnchorElement(href: '#')
    //        ..innerHtml = "Test element";
    //    listView.element.append(liElement);
    //
    //    listView..append(new LIElementItem.anchor("back", href: "#")..element.onClick.listen((e) {
    //              window.history.back();
    //              e.preventDefault();
    //            }));
    //
    //    listView..append(new LIElementItem.anchor("#${TEST_1_PAGE_ID}", href: "#${TEST_1_PAGE_ID}"));
    //    listView..append(new LIElementItem.anchor("#${TEST_2_PAGE_ID}", href: "#${TEST_2_PAGE_ID}"));
    //
    //    listView..append(new LIElementItem.anchor("page 2 #", href: "#")..element.onClick.listen((e) {
    //              container.navigate(TEST_2_PAGE_ID);
    //              e.preventDefault();
    //            }));
    //    listView..append(new LIElementItem.anchor("page 2 slide", href: "#")..element.onClick.listen((e) {
    //                 container.navigate(TEST_2_PAGE_ID, new PageChangeOptions(transition:Transition.SLIDE));
    //                 e.preventDefault();
    //               }));
    //    listView..append(new LIElementItem.anchor("page 2 google", href: "http://www.google.com")..element.onClick.listen((e) {
    //              container.navigate(TEST_2_PAGE_ID);
    //              e.preventDefault();
    //            }));
    //    //content.element.append(listView.element);
    //    content.append(listView);
    children.addAll([header, content]);
  }
}

class TestDynamic2Page extends Page with PageHandleOnBeforeShow { //, PageWithOnBeforeTransition {

  TestDynamic2Page.create(PageContainer container, String id) : //
      super.create(container, id) {
    DivElement header = jNewPageHeaderElement(title: 'Dynamic page 2');
    //    jqm.DivPageHeader header = new jqm.DivPageHeader.simple('Page 2');
    //    jqm.DivPageContent content = new jqm.DivPageContent();
    //
    //    ButtonElement button = new ButtonElement()..setInnerHtml('button');
    //    content.element.children.add(button);
    //    element.append(header.element);
    //    element.append(content.element);
    //
    //    jqm.UListView listView = new jqm.UListView.create();
    //    listView.inset();
    //
    //
    //    // Simple list
    //    LIElement liElement = new LIElement()//..append(new AnchorElement(href: '#')
    //        ..innerHtml = "Test element";
    //    listView.element.append(liElement);
    //
    //
    //    listView..append(new LIElementItem.anchor("back", href: "#")..element.onClick.listen((e) {
    //              window.history.back();
    //              e.preventDefault();
    //            }));
    //    listView..append(new LIElementItem.anchor("home fade", href: "#")..element.onClick.listen((e) {
    //                 container.navigate(container.rootPageId, new PageChangeOptions(transition:Transition.FADE, reverse: true));
    //                 e.preventDefault();
    //               }));
    //    listView..append(new LIElementItem.anchor("home slide", href: "#")..element.onClick.listen((e) {
    //                    container.navigate(container.rootPageId, new PageChangeOptions(transition:Transition.SLIDE, reverse: true));
    //                    e.preventDefault();
    //                  }));
    //
    //    listView..append(new LIElementItem.anchor("#${TEST_1_PAGE_ID}", href: "#${TEST_1_PAGE_ID}"));
    //    listView..append(new LIElementItem.anchor("#${TEST_2_PAGE_ID}", href: "#${TEST_2_PAGE_ID}"));
    //
    //    listView..append(new LIElementItem.anchor("page 2 #", href: "#")..element.onClick.listen((e) {
    //              container.navigate(TEST_2_PAGE_ID);
    //              e.preventDefault();
    //            }));
    //    listView..append(new LIElementItem.anchor("page 2 google", href: "http://www.google.com")..element.onClick.listen((e) {
    //              container.navigate(TEST_2_PAGE_ID);
    //              e.preventDefault();
    //            }));
    //
    //    //content.element.append(listView.element);
    //    content.append(listView);
    children.addAll([header]);
  }

  //  @override
  //  void onBeforeTransition() {
  //    print('TestDynamic2Page.onBeforeTransition $jPageChangeOptions');
  //  }

  @override
  void onBeforeShow() {
    print('TestDynamicPage.onBeforeShow');
  }
}

void main() {

  debugQuickLogging(Level.FINE);
  loadJQueryMobile().then((jqm) {
    PageContainer pageContainer = new TestPageContainer(jQueryMobilePageContainer);
    //    JPage jPage = new JPage.fromElement(jNewPageElement('home'));
    //    Page page = new Page(pageContainer, jPage);
    //    pageContainer.jPageContainer.element.children.add(jPage.element);
    //    jPage.element.children.add(jNewPageHeaderElement(title: "dynamic basic page"));
    pageContainer.register(NAVBARS_MENU_PAGE_ID, new NavBarsMenuPage());
    pageContainer.register(LISTVIEWS_MENU_PAGE_ID, new ListViewsMenuPage());
    pageContainer.navigate(MAIN_PAGE_ID);
    //pageContainer.navigate(LISTVIEWS_MENU_PAGE_ID);
    //pageContainer.navigate(NAVBARS_MENU_PAGE_ID);
  });



}
