//
//  ViewController.swift
//  K A S Leitan-COBSCCOMP191P-042
//
//  Created by Prasad Gunasekara on 9/14/20.
//  Copyright © 2020 Ayodhya Leitan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    MARK - Properties
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "NIBM COVID19"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = UIColor(white: 1, alpha: 0.8)
         return label
    }()

//    MARK - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    }


}

