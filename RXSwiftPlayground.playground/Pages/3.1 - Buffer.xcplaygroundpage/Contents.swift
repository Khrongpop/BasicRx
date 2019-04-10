//: [Previous](@previous)

import Foundation
import RxSwift

let myStream = BehaviorSubject<Int>(value: 0)

myStream
    .buffer(timeSpan: 150, count: 1, scheduler: MainScheduler.instance)
    .subscribe(onNext: { (value) in
        print("subscribe 1  [ \(value) ]")
    })


myStream
    .buffer(timeSpan: 150, count: 2, scheduler: MainScheduler.instance)
    .subscribe(onNext: { (value) in
        print("subscribe 2  [ \(value) ]")
    })

myStream.onNext(1)
myStream.onNext(2)
myStream.onNext(3)
myStream.onNext(4)
myStream.onNext(5)
myStream.onNext(6)

/* -- Output --
 subscribe 1  [ [0] ]
 subscribe 1  [ [1] ]
 subscribe 2  [ [0, 1] ]
 subscribe 1  [ [2] ]
 subscribe 1  [ [3] ]
 subscribe 2  [ [2, 3] ]
 subscribe 1  [ [4] ]
 subscribe 1  [ [5] ]
 subscribe 2  [ [4, 5] ]
 subscribe 1  [ [6] ]
*/



//: [Next](@next)
