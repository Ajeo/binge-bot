//
//  ViewController.swift
//  BingeBot
//
//  Created by Jorge Soto on 2/4/19.
//  Copyright © 2019 Jorge Soto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showsLabel: UILabel!
    @IBOutlet weak var randomShowLabel: UILabel!
    @IBOutlet weak var bingebotSpokenLabel: UILabel!
    @IBOutlet weak var addShowTextField: UITextField!
    @IBOutlet weak var addShowBtn: UIButton!
    @IBOutlet weak var randomShowStackView: UIStackView!
    @IBOutlet weak var addShowStackView: UIStackView!
    @IBOutlet weak var showsStackView: UIStackView!
    
    var shows: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showsStackView.isHidden = true
        randomShowStackView.isHidden = true
        bingebotSpokenLabel.isHidden = true
        randomShowLabel.isHidden = true
    }
    
    func updateShowsLabel() {
        showsLabel.text = shows.joined(separator: ", ")
    }

    @IBAction func randomBingeBtnWasPressed(_ sender: Any) {
        randomShowLabel.text = shows.randomElement()
        bingebotSpokenLabel.isHidden = false
        randomShowLabel.isHidden = false
        self.view.endEditing(true)
    }

    @IBAction func addShowBtnWasPressed(_ sender: Any) {
        guard let showName = addShowTextField.text else { return }
        
        if showName.count == 0 {
            return
        }
        
        shows.append(showName)
        updateShowsLabel()
        addShowTextField.text = ""
        showsStackView.isHidden = false
        
        if shows.count > 1 {
            randomShowStackView.isHidden = false
        }
    }
    
}

