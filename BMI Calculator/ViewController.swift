//
//  ViewController.swift
//  BMI Calculator
//
//  Created by 최서경 on 1/3/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var labels: [UILabel]!
    @IBOutlet var personImageView: UIImageView!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var randomCalculateButton: UIButton!
    @IBOutlet var resultButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelDesign(labels)
        imageViewDesign()
        textFieldDesign(heightTextField)
        textFieldDesign(weightTextField)
    }
    
    func textFieldDesign(_ textfield: UITextField) {
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.black.cgColor
        textfield.font = .systemFont(ofSize: 15)
        textfield.keyboardType = .numberPad
        textfield.layer.cornerRadius = 15
    
    }
    
    func buttonDesign(_ button: UIButton) {
        switch button.tag{
        case 0:
            button.backgroundColor = .white
            button.titleLabel = "랜덤으로 BMI 계산하기"
            button.setTitleColor(UIColor.red, for: .normal)
            
        }
        
    }
    
    func imageViewDesign() {
        personImageView.image = UIImage(named: "image")
        personImageView.contentMode = .scaleAspectFit
    }
    
    func labelDesign(_ labels: [UILabel]) {
        for label in labels {
            label.font = .systemFont(ofSize: 14)
            label.sizeToFit()
            switch label.tag {
            case 0:
                label.text = "BMI Calculator"
                label.font = .boldSystemFont(ofSize: 30)
            case 1:
                label.text = "당신의 BMI 지수를 \n알려드릴게요."
                label.numberOfLines = 2
            case 2:
                label.text = "키가 어떻게 되시나요?"
            case 3:
                label.text = "몸무게는 어떻게 되시나요?"
            default: 
                break
            }
        }
    }
}

