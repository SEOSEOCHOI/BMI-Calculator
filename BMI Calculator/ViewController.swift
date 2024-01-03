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
    @IBOutlet var randomCalculateButton: UIButton!
    @IBOutlet var resultButton: UIButton!
    @IBOutlet var inputTextField: [UITextField]!
    
    var BMI: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelDesign(labels)
        imageViewDesign()
        textFieldDesign(inputTextField)
        buttonDesign(randomCalculateButton)
        buttonDesign(resultButton)
    }
    /* 질문사항
     1. textField에서의 Outlet Action은 중복 연결이 안 되는지
     2. 중복 연결 이후 기존 이벤트가 Did End로 변경되는 이유
     3. 탭 제스쳐 이후 텍스트필드 2개의 조건 한번에 비교하기
     */
    
    
    @IBAction func randomButtonClicked(_ sender: UIButton) {
        let randomHeight: Int = .random(in: 130...200)
        let randomWeight: Int = .random(in: 35...180)
        
        inputTextField[0].text = "\(randomHeight)"
        inputTextField[1].text = "\(randomWeight)"
    }
    
    @IBAction func resultButtonClicked(_ sender: UIButton) {
        
        worngInput()

        guard let heightText = inputTextField[0].text else { return }
        guard let weightText = inputTextField[1].text else { return }
        
        guard let height = Int(heightText) else { return }
        guard let weight = Int(weightText) else { return }
                
        if standardInput(cm: height, kg: weight) == true {
            let heightMeter: Double = (Double(height) * 0.01)
            
            BMI = Double(Double(weight) / (heightMeter * heightMeter))
            
            calculateBMI(BMI)
        }
    }

    
    func worngInput() {
        for count in 0 ... 1 {
            if let text = inputTextField[count].text {
                if text == ""{
                    bmiWaringAlert(message: "빈칸을 채워 주세요.")
                }
                
                if let intText = Int(text) { } else {
                    bmiWaringAlert(message: "숫자를 입력해 주세요.")
                }
            }
        }
    }

    func standardInput(cm height: Int, kg weight: Int) -> Bool {
        if height < 100 {
            bmiWaringAlert(message: "키를 다시 입력해 주세요.")
            return false
        }
        if weight > 150 {
            bmiWaringAlert(message: "몸무게를 다시 입력해 주세요.")
            return false
        }
        if height - weight > 130 || height - weight < 10 {
            bmiWaringAlert(message: "허용 범위 내에서 입력해 주세요.")
            return false
        }
        return true
    }
    
    func calculateBMI(_ bmi: Double) {
        switch bmi {
        case 0 ..< 18.5:
            bmiResultAlert("저체중")
        case 18.5 ..< 23:
            bmiResultAlert("정상")
        case 23 ..< 25:
            bmiResultAlert("과체중")
        case 25 ..< 30:
            bmiResultAlert("비만")
        default:
            bmiResultAlert("고도비만")
        }
    }
    
    func bmiWaringAlert(message warning: String) {
        let alert = UIAlertController(title: "오류 발생", message: "\(warning)", preferredStyle: .alert)
        let checkButton = UIAlertAction(title: "확인", style: .destructive)
        alert.addAction(checkButton)
        present(alert, animated: true)
    }
    
    func bmiResultAlert(_ bmiResult: String) {
        let alert = UIAlertController(title: "BMI", message: "\(bmiResult)입니다.", preferredStyle: .alert)
        let checkButton = UIAlertAction(title: "확인", style: .default)
        alert.addAction(checkButton)
        present(alert, animated: true)
    }


    func textFieldDesign(_ textFields: [UITextField]) {
        for textField in textFields {
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.black.cgColor
            textField.layer.cornerRadius = 15
            textField.font = .systemFont(ofSize: 15)
            textField.keyboardType = .numberPad
        }
    }
    
    func buttonDesign(_ button: UIButton) {
        switch button.tag{
        case 0:
            button.backgroundColor = .white
            button.setTitle("랜덤으로 BMI 계산하기", for: .normal)
            button.setTitleColor(UIColor.red, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        case 1:
            button.backgroundColor = .purple
            button.setTitle("결과 확인", for: .normal)
            button.setTitleColor(UIColor.white, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            button.layer.cornerRadius = 15
        default:
            break
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
            case 4:
                label.text = ""
                label.textAlignment = .center
                label.textColor = .red
            default:
                break
            }
        }
    }
}

