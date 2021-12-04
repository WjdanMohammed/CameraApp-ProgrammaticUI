//
//  LaunchScreen.swift
//  CameraApp
//
//  Created by WjdanMo on 04/12/2021.
//

import Foundation
import UIKit
import Lottie

class LaunchScreen : UIViewController{
    
    var animationview : AnimationView?
    
    override func viewDidLoad() {

        view.backgroundColor = #colorLiteral(red: 0.2056434453, green: 0.5644673109, blue: 0.8626580834, alpha: 1)
        
        animationview = .init(name: "camShot")
        animationview?.frame = view.bounds
        animationview?.loopMode = .loop
        animationview?.animationSpeed = 1

        animationview?.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        animationview?.center = self.view.center

        view.addSubview(animationview!)
        animationview?.play()
        
    }
}
