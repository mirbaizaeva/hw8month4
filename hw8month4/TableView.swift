//
//  TableView.swift
//  hw8month4
//
//  Created by Nurjamal Mirbaizaeva on 6/5/23.
//

import Foundation
import UIKit

class TableView: UIViewController{
 
    private lazy var titleTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var bodyTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    func details(title: String, body: String){
        titleTextField.text = title
        bodyTextField.text = body
    }
    
    func setupSubviews() {
        view.addSubview(titleTextField)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 30).isActive = true
        titleTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        view.addSubview(bodyTextField)
        bodyTextField.translatesAutoresizingMaskIntoConstraints = false
        bodyTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 40).isActive = true
        bodyTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bodyTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bodyTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 30).isActive = true
        bodyTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
}
