import { media } from "@kit.MediaKit"
import { SongItemType } from "../models/music"
import { AppStorageV2 } from "@kit.ArkUI"
import { GlobalMusic } from "../models/globalMusic"

class AvPlayerManager {
  // 属性 + 方法
  // 播放器
  player: media.AVPlayer | null = null
  //共享播放数据
  currentSong:GlobalMusic=AppStorageV2.connect(GlobalMusic,'SONG_KEY',()=>new GlobalMusic())!
  // 定义方法 创建播放器 + 监听播放器的状态
  async init() {
    if (!this.player) {
      this.player = await media.createAVPlayer()
    }

    this.player.on('stateChange', (state) => {
      if (state === 'initialized') {
        this.player?.prepare()
      } else if (state === 'prepared') {
        this.player?.play()
      }
    })
    // 时间变化
    this.player.on('durationUpdate', (duration) => {
      this.currentSong.duration = duration
    })
    this.player.on('timeUpdate',(time)=>{
      this.currentSong.time=time
    })
  }


   singPlay(song: SongItemType) {
     this.player!.url = song.url
     this.currentSong.img=song.img
   }

  seekPlay(value:number) {
    this.player?.seek(value)
  }
}
export const playerManager :AvPlayerManager=new AvPlayerManager()