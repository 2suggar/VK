//
//  ViewController.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 28.07.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
        
        // default
        loginInput.text = "admin"
        passwordInput.text = "123456"
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let login = loginInput.text!
        let password = passwordInput.text!
        
        if login == "admin" && password == "123456" {
//            let loadingVC = LoadingViewController()
//            self.present(loadingVC, animated: true, completion: .none)
            return true
        } else {
            showAlert()
            return false
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

