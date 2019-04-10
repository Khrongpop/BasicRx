//: [Previous](@previous)

import Foundation
import RxSwift

let myStream = BehaviorSubject<Int>(value: 0)

myStream.scan(0) { lastCount, newValue  in
    return lastCount + 1
    }.subscribe(onNext: { (value) in
        print("count :  [ \(value) ]")
    })

myStream.scan("Hello") { lastStr, newValue  in
    return "\(lastStr) , \(newValue)"
    }.subscribe(onNext: { (value) in
        print("[ \(value) ]")
    })


myStream.onNext(10)
myStream.onNext(20)
myStream.onNext(30)



/* -- Output --
 count :  [ 1 ]
 [ Hello , 0 ]
 count :  [ 2 ]
 [ Hello , 0 , 10 ]
 count :  [ 3 ]
 [ Hello , 0 , 10 , 20 ]
 count :  [ 4 ]
 [ Hello , 0 , 10 , 20 , 30 ]
*/

//: [Next](@next)
