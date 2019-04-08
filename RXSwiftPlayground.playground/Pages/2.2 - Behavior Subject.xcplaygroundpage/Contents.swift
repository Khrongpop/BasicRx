//: [Previous](@previous)

import Foundation
import RxSwift

let behaviorSubject = BehaviorSubject(value: 0)

behaviorSubject.subscribe(onNext: { (value) in
    print("behaviorSubject 1 onNext [\(value)]")
}, onError: { (error) in
    print("behaviorSubject 1 onError [\(error)]")
})

behaviorSubject.onNext(1)

print("-------------- before Subscribe 2 ---------------")

behaviorSubject.subscribe(onNext: { (value) in
    print("behaviorSubject 2 onNext [\(value)]")
}, onError: { (error) in
    print("behaviorSubject 2 onError [\(error)]")
})

print("-------------- after Subscribe 2 ---------------")

behaviorSubject.onNext(2)
behaviorSubject.onNext(3)

/* -- Output --
 behaviorSubject 1 onNext [0]
 behaviorSubject 1 onNext [1]
 -------------- before Subscribe 2 ---------------
 behaviorSubject 2 onNext [1]
 -------------- after Subscribe 2 ---------------
 behaviorSubject 1 onNext [2]
 behaviorSubject 2 onNext [2]
 behaviorSubject 1 onNext [3]
 behaviorSubject 2 onNext [3]
*/


//: [Next](@next)
