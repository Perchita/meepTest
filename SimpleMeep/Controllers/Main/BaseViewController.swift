//
//  BaseViewController.swift
//  SimpleMeep
//
//  Created by Jose on 22/07/2020.
//  Copyright © 2020 Jose. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.confiureView()
    }
    
    //MARK: Private Methods
    
    private func confiureView() {
        //Add colors, texts, size, etc.
        self.titleLabel.text = "SIMPLE MEEP TEST"
    }

}
