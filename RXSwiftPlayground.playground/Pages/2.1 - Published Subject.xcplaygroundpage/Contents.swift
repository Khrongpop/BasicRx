//: [Previous](@previous)

import Foundation
import RxSwift


let publishSubject = PublishSubject<Int>()

publishSubject.onNext(0)

publishSubject.asObserver()
    .subscribe(onNext: { (value) in
        print("publishSubject 1 onNext [\(value)]")
    })

publishSubject.onNext(1)

print("-------------- before Subscribe 2 ---------------")


publishSubject.asObserver()
    .subscribe(onNext: { (value) in
        print("publishSubject 2 onNext [\(value)]")
    })

print("-------------- after Subscribe 2 ---------------")

publishSubject.onNext(2)

/* -- Output --
 publishSubject 1 onNext [1]
 -------------- before Subscribe 2 ---------------
 -------------- after Subscribe 2 ---------------
 publishSubject 1 onNext [2]
 publishSubject 2 onNext [2]
*/



//: [Next](@next)
