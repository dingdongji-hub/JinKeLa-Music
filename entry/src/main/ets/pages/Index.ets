import {AppStorageV2}from '@kit.ArkUI';
@Entry
@Component
struct SystemRoutingTable {
  // pageStack : NavPathStack = new NavPathStack();
  PathStack: NavPathStack = AppStorageV2.connect(NavPathStack, 'navStack', () => new NavPathStack())!
  build() {
    Navigation(this.PathStack){
    }.onAppear(() => {
      this.PathStack.pushPathByName('Start', null, false);
    })
    .hideNavBar(true)
  }
}