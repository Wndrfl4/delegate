//
//  ViewController.swift
//  delegate_2
//
//  Created by Aslan  on 01.04.2025.
//

import UIKit

protocol AddListProtocol {
    func addListArray(_ cellText: String)
}

class ViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var textField: UITextField!
    var delegate: AddListProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        backgroundView.layer.cornerRadius = 20
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: backgroundView))! {
            return false
        }
        return true
    }
    @IBAction func addButton(_ sender: Any) {
        
            delegate?.addListArray(textField.text!)
            dismissView()
    }
    
    @objc func dismissView() {
        dismiss(animated: true)
    }

}

