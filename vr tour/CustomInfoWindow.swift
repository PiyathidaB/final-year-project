//
//  CustomInfoWindow.swift
//  Omnivirt
//
//  Created by student on 12/7/2562 BE.
//  Copyright © 2562 student. All rights reserved.
//
import Foundation
import UIKit
import OmniVirtSDK

protocol CustomInfoWindowDelegate {
    func showButtonDidTouch()
    
}

class CustomInfoWindow: UIView {
    
    var delegate: CustomInfoWindowDelegate?
    @IBOutlet weak var customWindowLabel: UILabel!
    @IBOutlet weak var showButton: UIButton!
    
    var view: UIView!
    var watMahathatView: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func loadView() -> CustomInfoWindow{
        let customInfoWindow = Bundle.main.loadNibNamed("CustomInfoWindow", owner: self, options: nil)?[0] as! CustomInfoWindow
        return customInfoWindow
    }
    
    func setTitle(title: String) {
        customWindowLabel.text = title
    }
    
   @IBAction func show(_ sender: UIButton) {
        if (customWindowLabel.text == "Wat Mahathat"){
            print("mahathat")
            delegate?.showButtonDidTouch()
        }
        else{
            print("other wat")
            showButton!.isHidden = false
        }
    }
    
    
    
}
