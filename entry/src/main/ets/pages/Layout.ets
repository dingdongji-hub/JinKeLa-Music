import { Find } from "./find";
import { Mind } from "./mind";
import { Moment } from "./moment";
import { Recommend } from "./recommend";

// 定义TabClass类型（需补充，用于约束tabData数据结构）
interface TabClass {
  text: string;
  icon: ResourceStr;
}
@Builder
export function LayoutBuilder(){
  Layout()
}
@ComponentV2
struct Layout{
  @Local currentIndex:number=0
  pathStack:NavPathStack=new NavPathStack()

  tabData: TabClass[] = [
    {text: '推荐', icon: $r('app.media.ic_recommend')},
    {text: '发现', icon: $r('app.media.ic_find')},
    {text: '动态', icon: $r('app.media.ic_moment')},
    {text: '我的', icon: $r('app.media.ic_mine')}
  ]

  @Builder tabBuilder(item: TabClass,index:number) {
    Column({ space: 5 }) {
      Image(item.icon)
        .width(24)
        .fillColor(this.currentIndex===index?'#E85A88':'#63AAAA')
      Text(item.text)
        .fontSize(14)
        .fontColor(this.currentIndex===index?'#E85A88':'#63AAAA')
    }
  }

  build() {
    NavDestination() {
      Tabs({ barPosition: BarPosition.End }) {
        ForEach(this.tabData, (item: TabClass, index: number) => {
          TabContent() {
            if (this.currentIndex === 0) {
              Recommend()
            } else if (this.currentIndex === 1) {
              Find()
            } else if (this.currentIndex === 2) {
              Moment()
            } else if (this.currentIndex === 3) {
              Mind()
            }
          }
          .tabBar(this.tabBuilder(item,index)) // 自定义导航栏 → @Builder
          .backgroundColor('#131215')
          .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
        })
      }
      .onChange((index:number)=>{
        this.currentIndex=index
      })
      .backgroundColor('#3B3F42')
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
    }

    // .title('布局页')
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
  }
}