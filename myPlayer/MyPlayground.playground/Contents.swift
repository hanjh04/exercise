//: Playground - noun: a place where people can play

import UIKit

class MyMusic: Player {

    internal var idx: Int = -1
    internal var playOrder: [Int] = []
    internal var shuffledOrder: [Int] = []
    
    var newOrder: [Int] = []
    var musicList: [Song] = [Song]()
    var index: Int = 0

    
    internal func play(shuffle: Bool = false, albulm: String? = nil) {
        if albulm != nil{
            for tmp in playOrder{
                if musicList[tmp].albulm == albulm{
                    newOrder.append(tmp)
                }
            }
        }else{
            newOrder = playOrder
        }
        
        if shuffle{
            shuffledOrder = newOrder.shuffled()
        }else{
            shuffledOrder = newOrder
        }

        for tmp in shuffledOrder{
            let nowPlayingSong = musicList[tmp]
            let printSinger = nowPlayingSong.singer != nil ? nowPlayingSong.singer:"가수정보없음"
            let printAlbulm = nowPlayingSong.albulm != nil ? nowPlayingSong.albulm:"엘범 정보 없음"
            print("재생중--------->")
            print("제목 : \(nowPlayingSong.title)  \n 가수 : \(printSinger!)  \n 앨범 : \(printAlbulm!)")
            sleep(UInt32(nowPlayingSong.playTime))
            print("다음곡 재생합니다.\n")
            sleep(UInt32(1))
        }
    }
    
    func addList(singer: String? = nil, title: String, albulm: String? = nil, playTime: Float = 3.0){
        let tmp: Song = Song(singer: singer, title: title, albulm: albulm, playTime: playTime, cnt: 0)
        musicList.append(tmp)
        idx = idx+1
        playOrder.append(idx)
    }
    
    func delMusic(title: String){
        for tmp in playOrder{
            if musicList[tmp].title == title{
                print("\(title)을 지웁니다.")
                musicList.remove(at: tmp)
                return
            }
        }
        print("\(title)이 없습니다.")
    }
    
    func findMusic(title: String){
        for tmp in playOrder{
            if musicList[tmp].title == title{
                let p = tmp+1
                print("\(p)번째 있습니다.")
                return
            }
        }
        print("\(title)이 없습니다.")
        
    }
    
}

protocol Player{
    var playOrder: [Int] {get}
    var shuffledOrder: [Int] {get}
    var idx: Int {get}
    
    func play(shuffle: Bool, albulm: String?)
}


struct Song{
    var singer: String?
    var title: String
    var albulm: String?
    var playTime: Float
    var cnt: Int
}

extension Array {
    func shuffled() -> [Element] {
        var results = [Element]()
        var indexes = (0 ..< count).map { $0 }
        while indexes.count > 0 {
            let indexOfIndexes = Int(arc4random_uniform(UInt32(indexes.count)))
            let index = indexes[indexOfIndexes]
            results.append(self[index])
            indexes.remove(at: indexOfIndexes)
        }
        return results
    }
}

let myMusic: MyMusic = MyMusic()
myMusic.addList(title: "안녕?!")
myMusic.addList(singer: "에릴리", title: "첫눈처럼 너에게 가겠다", albulm: "도깨비OST")
myMusic.addList(singer: "수지", title: "행복한 척", albulm:"행복한 척")
myMusic.addList(singer: "IOI", title: "소나기", albulm:"디지털 싱글")
myMusic.addList(singer: "악동뮤지션", title: "오랜 날 오랜 밤", albulm:"사춘기 하")
myMusic.addList(singer: "크러쉬", title: "Beautiful", albulm:"도깨비OST")
myMusic.addList(singer: "신현희와김루트", title: "오빠야", albulm:"미니")

myMusic.findMusic(title: "소나기")
myMusic.delMusic(title: "beautiful")
print(myMusic.play(albulm: "미니"))

print(myMusic.play(shuffle: true))
