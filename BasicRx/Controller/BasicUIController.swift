//
//  BasicUIController.swift
//  BasicRx
//
//  Created by Khrongpop on 11/4/2562 BE.
//  Copyright © 2562 Khrongpop. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BasicUIController: UIViewController {
    
    
    @IBOutlet weak var subscribeTextField: UITextField!
    
    @IBOutlet weak var bindTextField: UITextField!
    @IBOutlet weak var bindLabel: UILabel!
    
    @IBOutlet weak var countButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        checkButton.isEnabled = false
        initRx()
    }
    
    func initRx()  {
        RXsubscribe()
        RXbind()
        RXscan()
        RXcombineLatest()
        
    }
    
    func RXsubscribe() {
        subscribeTextField
            .rx
            .text
            .orEmpty
            .subscribe(onNext: { (str) in
                print(str)
            })
            .disposed(by: disposeBag)
    }
    
    func RXbind() {
        bindTextField
            .rx
            .text
            .orEmpty
            .bind(to: bindLabel.rx.text)
            .disposed(by: disposeBag)
        
    }
    func RXscan() {
        
        //        countButton
        //            .rx
        //            .tap
        //            .scan(0) { (count, _) -> Int in
        //                count + 1
        //            }.map({ (count) -> String in
        //                "Count : \(count)"
        //            })
        //            .bind(to: countButton.rx.title())
        //            .disposed(by: disposeBag)
        
        let countTap = countButton
            .rx
            .tap
            .scan(0) { (count, _) -> Int in
                count + 1
        }
        
        countTap.map { (count) -> String in
            "Count : \(count)"
            }
            .bind(to: countButton.rx.title())
            .disposed(by: disposeBag)
        
        countTap.map { (count) -> Bool in
            count > 5
            }
            .bind(to: checkButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
    }
    
    func RXcombineLatest() {
        let username = usernameTextField
            .rx
            .text
            .orEmpty
            .map({ (text) -> Bool in
                text.count > 5
            })
        
        
        let password = passwordTextField
            .rx
            .text
            .orEmpty
            .map({ (text) -> Bool in
                text.count > 5
            })
        
        Observable.combineLatest(username, password) { (username, password)  in
            username && password
            }.bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }

}
