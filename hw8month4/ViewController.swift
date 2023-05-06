//
//  ViewController.swift
//  hw8month4
//
//  Created by Nurjamal Mirbaizaeva on 4/5/23.
//

import UIKit

class ViewController: UIViewController {

    private var titleText: String?
    private var bodyText: String?
    
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
    
    private lazy var postButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .blue
        view.addTarget(self, action: #selector(postButtonTap), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = titleText
        bodyTextField.text = bodyText
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        setupSubviews()
    }
    
    @objc func postButtonTap() {
//        postRequest(title: titleTextField.text!, body: bodyTextField.text!)
        //putRequest(title: titleTextField.text!, body: bodyTextField.text!)
       // deleteRequest()
       // getRequest(title: titleTextField.text!, body: bodyTextField.text!)
        let alert = UIAlertController(title: "Alert title", message: "Alert message", preferredStyle: .alert)
        let action2 = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(action2)
        
        let action3 = UIAlertAction(title: "Хотите перейти", style: .destructive) { [self] result in
            let vc = TableView()
            vc.details(title: titleText!, body: bodyText!)
            self.present(vc, animated: true)
        }
        alert.addAction(action3)
        self.present(alert, animated: true)
    }
    
    func postRequest(title: String, body: String) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        
        let body = [
            "title": title,
            "body": body
        ]
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        let jsonData = try! JSONSerialization.data(withJSONObject: body)
        request.httpBody = jsonData
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if error != nil  && data != nil {
                
                let responseCode = response as! HTTPURLResponse
                print(responseCode.statusCode)
                
            do {
                let result = try JSONSerialization.jsonObject(with: data!)
                print(result)
            }catch {
              print(error)
            }
              
            }
        //}
        task.resume()
    }
    
    func putRequest(title: String, body: String) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/10")
        
        let body = [
            "title": title,
            "body": body
        ]
        
        var request = URLRequest(url: url!)
        request.httpMethod = "PUT"
        
        let jsonData = try! JSONSerialization.data(withJSONObject: body)
        request.httpBody = jsonData
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if error != nil  && data != nil {
                
                let responseCode = response as! HTTPURLResponse
                print(responseCode.statusCode)
                
            do {
                let result = try JSONSerialization.jsonObject(with: data!)
                print(result)
            }catch {
              print(error)
            }
              
//            }
        }
        task.resume()
        
    }
    
    func deleteRequest() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/50")

        var request = URLRequest(url: url!)
        request.httpMethod = "DELETE"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if error != nil  && data != nil {

                let responseCode = response as! HTTPURLResponse
                print(responseCode.statusCode)

            do {
                let result = try JSONSerialization.jsonObject(with: data!)
                print(result)
            }catch {
              print(error)
            }

//            }
        }
        task.resume()
    }

    func getRequest(title: String, body: String) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        
        let body = [
            "title": title,
            "body": body
        ]
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let jsonData = try! JSONSerialization.data(withJSONObject: body)
        request.httpBody = jsonData
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if error != nil  && data != nil {
                
                let responseCode = response as! HTTPURLResponse
                print(responseCode.statusCode)
                
            do {
                let result = try JSONSerialization.jsonObject(with: data!)
                print(result)
            }catch {
              print(error)
            }
              
            }
        //}
        task.resume()
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
        
        view.addSubview(postButton)
        postButton.translatesAutoresizingMaskIntoConstraints = false
        postButton.topAnchor.constraint(equalTo: bodyTextField.bottomAnchor, constant: 40).isActive = true
        postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        postButton.widthAnchor.constraint(equalToConstant: view.frame.width - 30).isActive = true
        postButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
}


