import 'dart:html';
import 'dart:async';

import 'package:tekartik_jquery_mobile/jquery_mobile_app.dart' as jqm;
import 'package:tekartik_jquery_mobile/jquery_mobile.dart' as jqm;
import 'package:tekartik_jquery_mobile/jquery_mobile.dart';
import 'package:tekartik_jquery/jquery.dart';
import 'package:tekartik_common/js_utils.dart';


class TestDynamicPage extends jqm.Page with jqm.PageWithOnBeforeShow, jqm.PageWithOnBeforeTransition {
  jqm.DivPageContent content;
  TestDynamicPage.create(jqm.PageContainer container) : super.create(container, 'test_dynamic_page') {
    jqm.DivPageHeader header = new jqm.DivPageHeader.simple('One Page content fadeIn');
    content = new jqm.DivPageContent();

    ButtonElement button = new ButtonElement()..setInnerHtml('button');
    content.element.children.add(button);
    element.append(header.element);
    element.append(content.element);

    jqm.UListView listView = new jqm.UListView.create();
    listView.inset();


    // Simple list
    LIElement liElement = new LIElement()//..append(new AnchorElement(href: '#')
        ..innerHtml = "Test element";
    listView.element.append(liElement);

    listView.append(new LIElementItem.anchor("test", href: "#"));
    listView.append(new LIElementItem.anchor("Google", href: "http://www.google.com"));

    //content.element.append(listView.element);
    content.append(listView);
  }

  @override
  void onBeforeTransition() {
    print('TestDynamicPage.onBeforeTransition');
    print(jPageChangeOptions);
  }

  bool firstShow;
  @override
  void onBeforeShow() {
    print('TestDynamicPage.onBeforeShow');
    //content.element.style.visibility = 'hidden';
    //content.element.remove();
    if (firstShow != true) {
      new JObject(content.jDiv).fadeIn();
      firstShow = true;
    }
  }
}

jqm.PageContainer container;
jqm.PageContainer get _container => container;

//class PageFactory extends Object with jqm.ContainerPageFactory {
//
//  PageContainer get container => _container;
//  @override
//  jqm.Page createPage(String pageId) {
//    // TODO: implement createPage
//  }
//}

main() {
  jqm.JPageContainer pageContainer = jqm.pageContainer;
  container = new jqm.PageContainer(jqm.pageContainer);

  TestDynamicPage dynamicPage = new TestDynamicPage.create(container);
  // First dynamic page must have changeHash set to false
  container.navigate(dynamicPage.id, new PageChangeOptions(transition: Transition.NONE)); // jPageContainer.change(id: dynamicPage.id, transition: "fade", param: "Hello to dynamic", changeHash: false);
  //  container.onBeforeShow.listen((_) {
  //    print('onBeforeShow');
  //  });

}
