//
//  ViewController.swift
//  CameraApp
//
//  Created by WjdanMo on 04/12/2021.
//

import UIKit

class LoginVC: UIViewController {
    
    let welcomeMsg = UILabel()
    let name = UITextField()
    let password = UITextField()
    let loginStatus = UILabel()
    let loginButton = UIButton()
    let signUpLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupObjects()
        
    }
    
    
    func setupObjects(){
        
        welcomeMsg.textColor = .black
        welcomeMsg.textAlignment = .center
        welcomeMsg.text = "Welcome to your Camera App"
        welcomeMsg.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        welcomeMsg.numberOfLines = 2
        welcomeMsg.frame = CGRect(x: 36, y: 150, width: 300, height: 80)
        view.addSubview(welcomeMsg)
        
        signUpLabel.text = "You don't have an account? SignUp"
        signUpLabel.textColor = .black
        signUpLabel.textAlignment = .center
        signUpLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        signUpLabel.frame = CGRect(x: 38, y: 460, width: 300, height: 30)
        view.addSubview(signUpLabel)
        
        loginStatus.textColor = .black
        loginStatus.frame = CGRect(x: 80, y: 380, width: 300, height: 30)
        view.addSubview(loginStatus)
        
        
        name.attributedPlaceholder = NSAttributedString(
            string : "Enter your name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        name.textColor = .black
        name.borderStyle = .roundedRect
        name.backgroundColor = #colorLiteral(red: 0.9555889964, green: 0.9499081969, blue: 0.9599556327, alpha: 1)
        name.frame = CGRect(x: 40, y: 300, width: 300, height: 30)
        view.addSubview(name)
        
        
        password.attributedPlaceholder = NSAttributedString(
            string : "Enter your password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        password.textColor = .black
        password.borderStyle = .roundedRect
        password.backgroundColor = #colorLiteral(red: 0.9555889964, green: 0.9499081969, blue: 0.9599556327, alpha: 1)
        password.frame = CGRect(x: 40, y: 340, width: 300, height: 30)
        password.isSecureTextEntry = true
        view.addSubview(password)
        
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        loginButton.backgroundColor = #colorLiteral(red: 0.2056434453, green: 0.5644673109, blue: 0.8626580834, alpha: 1)
        loginButton.frame = CGRect(x: 125, y: 395, width: 120, height: 40)
        loginButton.layer.cornerRadius = 20
        view.addSubview(loginButton)
        
    }
    
    
    @objc func loginButtonClicked(){
        //        if name.text == "Aaa" && password.text == "123"{
        let vc = PhotoVC(name: name.text!)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        //        }
        //        else{
        //            loginStatus.text = "Worng password or username"
        //            name.clear()
        //            password.clear()
        //        }
    }
}

extension UITextField {
    func clear(){
        self.text = ""
    }
}


