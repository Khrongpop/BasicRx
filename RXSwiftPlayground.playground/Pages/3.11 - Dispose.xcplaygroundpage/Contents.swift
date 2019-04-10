//: [Previous](@previous)

import Foundation
import RxSwift

let myStream = BehaviorSubject(value: 0)

let mySubscribe =  myStream.subscribe(onNext: { (value) in
    print("onNext:  [ \(value) ]")
                    })
        
myStream.onNext(1)
myStream.onNext(2)
myStream.onNext(3)

mySubscribe.dispose()

myStream.onNext(5)
myStream.onNext(6)
myStream.onNext(7)
myStream.onNext(8)

/* -- Output --
 onNext:  [ 0 ]
 onNext:  [ 1 ]
 onNext:  [ 2 ]
 onNext:  [ 3 ]
*/


//: [Next](@next)
