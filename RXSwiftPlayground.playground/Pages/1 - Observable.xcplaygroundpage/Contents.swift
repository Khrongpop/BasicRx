//: Playground - noun: a place where people can play

import Foundation
import RxSwift

let myStream = Observable<String>.from(["Hello","RxSwift"])

myStream
    .subscribe(onNext: { (value) in
        print("On next [\(value)]")
    }, onError: { (value) in
        print("On Error [\(value)]")
    }, onCompleted: {
         print("Completed !!!!")
    })

/* -- Output --
 On next [Hello]
 On next [RxSwift]
 Completed !!!!
*/
