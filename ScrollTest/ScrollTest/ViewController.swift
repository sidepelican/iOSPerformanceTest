//
//  ViewController.swift
//  ScrollTest
//
//  Created by kenta on 2020/07/04.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setViewControllers([
            TestViewController<MyCellA>(),
            TestViewController<MyCellB>(),
        ], animated: false)
    }
}

