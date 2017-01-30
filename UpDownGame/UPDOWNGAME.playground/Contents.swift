//: Playground - noun: a place where people can play

import UIKit
//게임생성 시드값에 의해서 난수로 정답 생성 -> O
//게임 생성 시드값은 100까지로.

//개임을 담당하는 타입(클래스, 구조체) 생성
//게임을생성하면서시드값입력
//게임이 생성되면 정답 맞추기 시도
//정답 결과 반환: up, down, gameOver, right
//게임 생성을 클로저로 만들 것.
//

struct UpDownGame{
    var max: Int
    var ans: Int
    var trial: Int
    
    init(maxValue max: Int){
        self.max = max
        self.ans = Int(arc4random_uniform(UInt32(max)))
        self.trial = ans < 10 ? 5 : ans < 50 ? 10 : 20
    }
    
    mutating func reGame(maxValue max: Int){
        self.max = max
        self.ans = Int(arc4random_uniform(UInt32(max)))
        self.trial = ans < 10 ? 5 : ans < 50 ? 10 : 20
    }
    
    mutating func isIt(compare: Int){
        if trial > 0 {
            trial -= 1
            if compare > ans{
                print("down")
            }else if compare < ans{
                print("up")
            }else{
                print("right")
                print("맞았습니다.")
                return
            }
            print("\(trial)번 남았습니다.")
            return
        }else{
            print("시도 횟수 다 사용했습니다.")
        }
    }
}

var game = UpDownGame(maxValue: 50)
game.isIt(compare: 10)
game.isIt(compare: 3)
