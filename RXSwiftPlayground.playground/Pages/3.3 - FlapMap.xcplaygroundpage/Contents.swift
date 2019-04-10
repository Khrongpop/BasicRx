//: [Previous](@previous)

import Foundation
import RxSwift


struct Player {
    var level: Variable<Int>
}

let myStream = PublishSubject<Player>()

myStream
    .flatMap { (value) in
        return value.level.asObservable()
    }
    .subscribe(onNext: { (value) in
        print("Player level : [ \(value) ]")
    })

myStream.onNext( Player(level: Variable(50)))
myStream.onNext( Player(level: Variable(100)))

/* -- Output --
 Player level : [ 50 ]
 Player level : [ 100 ]
 */

//: [Next](@next)
