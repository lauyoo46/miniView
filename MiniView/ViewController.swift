//
//  ViewController.swift
//  MiniView
//
//  Created by Laurentiu Ile on 03/12/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var miniView: UIView!
    var globalStackView = UIStackView()
    var topStackView    = UIStackView()
    var midStackView    = UIStackView()
    var bottomStackView = UIStackView()
    var headLabel       = UILabel()
    var subheadLabel    = UILabel()
    var returnButton    = UIButton()
    var signButton      = UIButton()
    var midLabels       = ["the discharge date is empty", "the discharge diagnosis is empty",
                           "the selected visit date is more than 14 days later than the discharge date",
                           "the admission date is later than the discharge date"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMiniView()
        configureTopLabels()
        configureTopStackView()
        configureMidLabels()
        configureMidStackView()
        configureBottomButtons()
        configureBottomStackView()
        configureGlobalStackView()
    }
    
    func configureMiniView() {
        miniView.layer.cornerRadius = 10
        miniView.clipsToBounds      = true
    }
    
    func configureTopLabels() {
        headLabel.text              = "WARNING"
        headLabel.font              = UIFont(name: "Avenir Medium", size: 15)
        
        subheadLabel.text           = "Before signing the note, you might want to address some of the following:"
        subheadLabel.numberOfLines  = 2
        subheadLabel.font           = UIFont(name: "Avenir Medium", size: 15)

        topStackView.addArrangedSubview(headLabel)
        topStackView.addArrangedSubview(subheadLabel)
    }

    func configureTopStackView() {
        topStackView.axis            = .vertical
        topStackView.spacing         = 10
        topStackView.alignment       = .center
        
        globalStackView.addArrangedSubview(topStackView)
    }

    func configureMidLabels() {
        for midLabel in midLabels {
            let lineLabel           = UILabel()
            let textLabel           = UILabel()
            lineLabel.text          = "-"
            textLabel.text          = midLabel
            textLabel.numberOfLines = 2
            textLabel.font          = UIFont(name: "Avenir Medium", size: 15)
            
            let midHorizStackView   = UIStackView()
            midHorizStackView.axis  = .horizontal
            
            midHorizStackView.addArrangedSubview(lineLabel)
            midHorizStackView.addArrangedSubview(textLabel)
            
            midStackView.addArrangedSubview(midHorizStackView)
            
            lineLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                lineLabel.widthAnchor.constraint(equalToConstant: 10),
            ])
        }
    }
    
    func configureMidStackView() {
        midStackView.axis            = .vertical
        midStackView.spacing         = 5
        
        globalStackView.addArrangedSubview(midStackView)
    }
    
    func configureBottomButtons() {
        returnButton.setTitle("Return to note", for: .normal)
        returnButton.backgroundColor    = .blue
        returnButton.tintColor          = .white
        returnButton.titleLabel?.font   = UIFont(name: "Avenir Next Bold", size: 15)
        returnButton.layer.cornerRadius = 5
        returnButton.clipsToBounds      = true
        
        signButton.setTitle("Sign anyway", for: .normal)
        signButton.backgroundColor      = .blue
        signButton.tintColor            = .white
        signButton.titleLabel?.font     = UIFont(name: "Avenir Next Bold", size: 15)
        signButton.layer.cornerRadius   = 5
        signButton.clipsToBounds        = true
        
        bottomStackView.addArrangedSubview(returnButton)
        bottomStackView.addArrangedSubview(signButton)
    }
    
    func configureBottomStackView() {
        bottomStackView.axis            = .horizontal
        bottomStackView.spacing         = 10
        bottomStackView.alignment       = .center
        bottomStackView.distribution    = .fillEqually
        
        globalStackView.addArrangedSubview(bottomStackView)
    }

    func configureGlobalStackView() {
        globalStackView.axis            = .vertical
        globalStackView.distribution    = .equalSpacing
        globalStackView.backgroundColor = .white

        view.addSubview(globalStackView)
        globalStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            globalStackView.topAnchor.constraint(equalTo: miniView.topAnchor, constant: 15),
            globalStackView.leadingAnchor.constraint(equalTo: miniView.leadingAnchor, constant: 15),
            globalStackView.trailingAnchor.constraint(equalTo: miniView.trailingAnchor, constant: -15),
            globalStackView.bottomAnchor.constraint(equalTo: miniView.bottomAnchor, constant: -15)
        ])
    }

}

