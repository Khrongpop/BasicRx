//: [Previous](@previous)

import Foundation
import RxSwift

let replaySubject = ReplaySubject<Int>.create(bufferSize: 3)

replaySubject.onNext(0)
replaySubject.onNext(1)
replaySubject.onNext(2)

replaySubject.subscribe(onNext: { (value) in
    print("replaySubject 1 onNext [\(value)]")
})

replaySubject.onNext(3)

print("-------------- before Subscribe 2 ---------------")

replaySubject.subscribe(onNext: { (value) in
    print("replaySubject 2 onNext [\(value)]")
})

print("-------------- after Subscribe 2 ---------------")

replaySubject.onNext(4)
replaySubject.onNext(5)

/* -- Output --
 replaySubject 1 onNext [0]
 replaySubject 1 onNext [1]
 replaySubject 1 onNext [2]
 replaySubject 1 onNext [3]
 -------------- before Subscribe 2 ---------------
 replaySubject 2 onNext [1]
 replaySubject 2 onNext [2]
 replaySubject 3 onNext [3]
 -------------- after Subscribe 2 ---------------
 replaySubject 1 onNext [4]
 replaySubject 2 onNext [4]
 replaySubject 1 onNext [5]
 replaySubject 2 onNext [5]
*/

//: [Next](@next)
