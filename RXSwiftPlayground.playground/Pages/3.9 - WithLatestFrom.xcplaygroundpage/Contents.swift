//: [Previous](@previous)

import Foundation
import RxSwift

let subject1 = BehaviorSubject<Int>(value: 0)
let subject2 = BehaviorSubject<String>(value: "Hello")
subject1.withLatestFrom(subject2)
    .subscribe(onNext: { (value) in
        print("value : [\(value)]")
    })

subject2.onNext("💛")
subject2.onNext("💚")
subject1.onNext(1)
subject2.onNext("withLatestFrom")
subject1.onNext(2)

/* -- Output --
 subject2.onNext("💛")
 subject2.onNext("💚")
 subject1.onNext(1)
 subject2.onNext("withLatestFrom")
 subject1.onNext(2)
*/

//: [Next](@next)
