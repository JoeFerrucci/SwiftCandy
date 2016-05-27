//
//  ViewController.swift
//  SwiftCandy
//
//  Created by Joe Ferrucci on 05/24/2016.
//  Copyright (c) 2016 Joe Ferrucci. All rights reserved.
//

import UIKit
import SwiftCandy

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let redBackground = TextStyles.textBackground(.redColor())
        let whiteText = TextStyles.textColor(.whiteColor())
        let whiteOnRed = redBackground >>> whiteText
        let label = UILabel(frame: view.bounds)
        view.addSubview(label)
        label.attributedText = whiteOnRed("Swift Candy".mutableAttributedString)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

