//: [Previous](@previous)

import Foundation
import RxSwift

let myStream = BehaviorSubject<Int>(value: 0)

myStream
    .map { (value) -> Bool  in
        return value > 5
    }
    .subscribe(onNext: { (value) in
        print("value > 5 : [ \(value) ]")
    })

myStream.onNext(5)
myStream.onNext(7)

/* -- Output --
 value > 5 : [ false ]
 value > 5 : [ false ]
 value > 5 : [ true ]
*/

//: [Next](@next)
