//
//  ScrollViewController.swift
//  RxSwiftPattern
//
//  Created by Milton Palaguachi on 3/30/21.
//

import UIKit

class SingTextField: UITextField {
    
}

class ScrollViewController: UIViewController {
    
    @IBOutlet private var codeFiled: UITextField!
    @IBOutlet private var itemFiled: UITextField!
    @IBOutlet private var counterFiled: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Hello Scroll View controller"
        // Do any additional setup after loading the view.
    }
}
