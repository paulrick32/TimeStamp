//
//  ViewController.swift
//  TimeStamp
//
//  Created by Paulinho on 21/07/19.
//  Copyright © 2019 Paulinho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timestamp:Double!
    let defaults = UserDefaults.standard
    let key = "Botão Clicado"
    var button:UIButton!
    var label:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label = UILabel()
        label.frame = CGRect(x: 0, y: 45, width: self.view.frame.width, height: 150)
        label.text = "Texto Padrão"
        label.textAlignment = .center
        label.textColor = UIColor.green
        label.backgroundColor = UIColor.gray
        label.numberOfLines = 2
        label.font = UIFont(name: "Copperplate", size: 32)
        
        self.view.addSubview(label)
        
        button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 160, height: 160)
        button.center = self.view.center
        button.setTitle("Clicar", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.backgroundColor = UIColor.gray
        button.titleLabel?.font = UIFont(name: "Copperplate", size: 24)
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 80
        
        button.addTarget(self, action: #selector(buttonIsInAction), for: UIControl.Event.touchUpInside)
        
        
        self.view.addSubview(button)
        
        timestamp = defaults.double(forKey: key)
        
        if timestamp == 0{
            label.text = "Botão não foi clicado ainda"
        }else{
            let lastTimeWhenButtonWasPressed = Date(timeIntervalSince1970: timestamp)
            let formatter = DateFormatter()
            formatter.dateFormat = "dd. MMMM yyyy H:mm:ss"
            label.text = formatter.string(from: lastTimeWhenButtonWasPressed)
        }
        // Do any additional setup after loading the view.
    }
    
    @objc func buttonIsInAction(){
        timestamp = Date().timeIntervalSince1970
        defaults.set(timestamp, forKey: key)
        let lastTimeWhenButtonWasPressed2 = Date(timeIntervalSince1970: timestamp)
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "dd. MMMM yyyy H:mm:ss"
        let stringFormatter = formatter2.string(from: lastTimeWhenButtonWasPressed2)
        if stringFormatter.last! == "0" {
            label.textColor = UIColor.blue
        }
        label.text = stringFormatter
        
        
        
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }


}

