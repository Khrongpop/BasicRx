//: [Previous](@previous)

import Foundation
import RxSwift

let subject1 = BehaviorSubject<Int>(value: 0)
let subject2 = BehaviorSubject<Int>(value: 10)

Observable
    .merge([subject1, subject2])
    .subscribe(onNext: { (value) in
        print("value : \(value)")
    })

subject1.onNext(50)
subject1.onNext(40)
print("------------------------------------------------")
subject1.onNext(1)
subject2.onNext(10)
print("------------------------------------------------")
subject1.onNext(2)
subject2.onNext(20)
print("------------------------------------------------")
subject1.onNext(30)
subject2.onNext(40)
print("------------------------------------------------")
subject2.onNext(50)
subject2.onNext(40)

/* -- Output --
 value : 0
 value : 10
 value : 50
 value : 40
 ------------------------------------------------
 value : 1
 value : 10
 ------------------------------------------------
 value : 2
 value : 20
 ------------------------------------------------
 value : 30
 value : 40
 ------------------------------------------------
 value : 50
 value : 40
*/


//: [Next](@next)
