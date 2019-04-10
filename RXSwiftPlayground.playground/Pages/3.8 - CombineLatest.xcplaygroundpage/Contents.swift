//: [Previous](@previous)

import Foundation
import RxSwift

let subject1 = BehaviorSubject<Int>(value: 0)
let subject2 = BehaviorSubject<String>(value: "Hello")

Observable
    .combineLatest(subject1,subject2)
    .subscribe(onNext: { (value1,value2) in
        print("subject1 : \(value1), subject2 : \(value2)")
    })


subject2.onNext("💛")
subject2.onNext("💚")
subject1.onNext(1)
subject2.onNext("CombineLatest")
subject1.onNext(2)

/* -- Output --
 subject1 : 0, subject2 : Hello
 subject1 : 0, subject2 : 💛
 subject1 : 0, subject2 : 💚
 subject1 : 1, subject2 : 💚
 subject1 : 1, subject2 : CombineLatest
 subject1 : 2, subject2 : CombineLatest
*/

//: [Next](@next)
