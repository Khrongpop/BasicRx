//: [Previous](@previous)

import Foundation
import RxSwift

let subject1 = BehaviorSubject<Int>(value: 0)
let subject2 = BehaviorSubject<Int>(value: 10)


Observable
    .zip(subject1, subject2)
    .subscribe(onNext: { (value1,value2) in
        print("subject1 : \(value1), subject2 : \(value2)")
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
 subject1 : 0, subject2 : 10
 ------------------------------------------------
 subject1 : 50, subject2 : 10
 ------------------------------------------------
 subject1 : 40, subject2 : 20
 ------------------------------------------------
 subject1 : 1, subject2 : 40
 ------------------------------------------------
 subject1 : 2, subject2 : 50
 subject1 : 30, subject2 : 40
*/

//: [Next](@next)
