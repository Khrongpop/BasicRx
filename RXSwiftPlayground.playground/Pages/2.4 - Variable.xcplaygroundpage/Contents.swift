//: [Previous](@previous)

import Foundation
import RxSwift


let variableSubject = Variable<Int>(0)

variableSubject.asObservable()
    .subscribe(onNext: { (value) in
        print("variableSubject 1 onNext [\(value)]")
    })

variableSubject.value = 1

print("-------------- before Subscribe 2 ---------------")

variableSubject.asObservable()
    .subscribe(onNext: { (value) in
        print("variableSubject 2 onNext [\(value)]")
})

print("-------------- after Subscribe 2 ---------------")

variableSubject.value = 2
variableSubject.value = 3

print("value of variableSubject  [\(variableSubject.value)]")


/* -- Output --
 variableSubject 1 onNext [0]
 variableSubject 1 onNext [1]
 -------------- before Subscribe 2 ---------------
 variableSubject 2 onNext [1]
 -------------- after Subscribe 2 ---------------
 variableSubject 1 onNext [2]
 variableSubject 2 onNext [2]
 variableSubject 1 onNext [3]
 variableSubject 2 onNext [3]
 value of variableSubject  [3]
*/


//: [Next](@next)
