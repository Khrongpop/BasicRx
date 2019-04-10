//: [Previous](@previous)

import Foundation
import RxSwift

let myStream = BehaviorSubject<String>(value: "Hello")

myStream
    .startWith("Start Subscribe ...")
    .subscribe(onNext: { (value) in
        print("On Next: [\(value)]")
    })

myStream.onNext("💛")
myStream.onNext("💚")

/* -- Output --
 On Next: [Start Subscribe ...]
 On Next: [Hello]
 On Next: [💛]
 On Next: [💚]
*/


//: [Next](@next)
