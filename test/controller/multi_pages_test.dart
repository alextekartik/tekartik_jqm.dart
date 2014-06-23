library index;

import 'package:tekartik_jquery/jquery.dart';
import 'package:tekartik_jqm/jquerymobile.dart';
import 'package:tekartik_jqm/jquerymobile_controller.dart';
import 'package:tekartik_jqm/jquerymobile_loader.dart';
import 'package:tekartik_utils/test_utils_browser.dart';
import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/log_utils.dart';

import 'dart:html';

const String TEST_2_PAGE_ID = "test_dynamic_2";
const String TEST_1_PAGE_ID = "test_dynamic_1";

class TestPageContainer extends PageContainer with ContainerPageFactory {
  TestPageContainer(JPageContainer jPageContainer) : super(jPageContainer) {
    //container = this;
  }

  @override
  Page createPage(String pageId) {
    switch (pageId) {
      case TEST_2_PAGE_ID:
        return new TestDynamic2Page.create(this, pageId);
      case TEST_1_PAGE_ID:
        return new TestDynamicPage.create(this, pageId);
    }
    return null;
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
    JPage jPage = new JPage.fromElement(jNewPageElement('home'));
    Page page = new Page(pageContainer, jPage);
    pageContainer.jPageContainer.element.children.add(jPage.element);
    jPage.element.children.add(jNewPageHeaderElement(title: "dynamic basic page"));
    pageContainer.navigate(TEST_1_PAGE_ID);
  });



}
