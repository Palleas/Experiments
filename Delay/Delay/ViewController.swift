//
//  ViewController.swift
//  Delay
//
//  Created by Romain Pouclet on 2016-01-18.
//  Copyright © 2016 Perfectly-Cooked. All rights reserved.
//

import UIKit
import ReactiveCocoa

func sayHi() -> SignalProducer<String, NoError> {
    return SignalProducer(value: "Hi! 👋🏻")
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer(1, onScheduler: QueueScheduler())
            .zipWith(sayHi())
            .startWithNext({ print($1) })
        
    }
}

