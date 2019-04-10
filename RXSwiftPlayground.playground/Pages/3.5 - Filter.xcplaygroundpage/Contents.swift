//: [Previous](@previous)

import Foundation
import RxSwift

let myStream = BehaviorSubject<Int>(value: 0)

myStream
    .filter { (value) -> Bool in
        return value > 5
    }
    .subscribe(onNext: { (value) in
        print("\(value) > 5")
    })

myStream.onNext(1)
myStream.onNext(3)
myStream.onNext(5)
myStream.onNext(7)
myStream.onNext(10)

/* -- Output --
 7 > 5
 10 > 5
*/

//: [Next](@next)
