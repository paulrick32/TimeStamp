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
        label.text = "Go 4all"
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
    }
    
    @objc func buttonIsInAction(){
        timestamp = Date().timeIntervalSince1970
        defaults.set(timestamp, forKey: key)
        let lastTimeWhenButtonWasPressed = Date(timeIntervalSince1970: timestamp)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd. MMMM yyyy H:mm:ss"
        let stringFormatter = formatter.string(from: lastTimeWhenButtonWasPressed)
        
        switch stringFormatter.last! {
        case "1":
            self.view.backgroundColor = UIColor.yellow
        case "2":
            self.view.backgroundColor = UIColor.blue
        case "3":
            self.view.backgroundColor = UIColor.white
        case "4":
            self.view.backgroundColor = UIColor.red
        case "5":
            self.view.backgroundColor = UIColor.purple
        case "6":
            self.view.backgroundColor = UIColor.magenta
        case "7":
            self.view.backgroundColor = UIColor.black
        case "8":
            self.view.backgroundColor = UIColor.brown
        case "9":
            self.view.backgroundColor = UIColor.cyan
        default:
            self.view.backgroundColor = UIColor.orange
        }
        label.text = "Go 4all"
        
        
        
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }


}

