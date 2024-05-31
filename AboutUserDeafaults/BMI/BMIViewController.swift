//
//  BMIViewController.swift
//  AboutUserDeafaults
//
//  Created by 최대성 on 5/31/24.
//

import UIKit




class BMIViewController: UIViewController {
    
    
    
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    
    var result = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightTextField.becomeFirstResponder()
        heightTextField.delegate = self
        weightTextField.delegate = self
        configureTextField()
    }
    
    func configureTextField() {
        
        var height = UserDefaults.standard.string(forKey: "height")
        var weight = UserDefaults.standard.string(forKey: "weight")
        
        
        
        if height == nil && weight == nil {
            heightTextField.placeholder = "키를 입력하세요!"
            weightTextField.placeholder = "몸무게를 입력하세요"
        } else {
            heightTextField.text = height
            weightTextField.text = weight
        }
        heightTextField.keyboardType = .numberPad
        weightTextField.keyboardType = .numberPad
        
    }
    
    // 몸무게/(키)^2
    @IBAction func resultButtonTapped(_ sender: UIButton) {
        
        guard let height = Double(heightTextField.text ?? "1"),
              let weight = Double(weightTextField.text ?? "0") else { return }
        
        
        let bmi = weight / (height*height) * 10000
        
        UserDefaults.standard.setValue(height, forKey: "height")
        UserDefaults.standard.setValue(weight, forKey: "weight")
        
        
        switch bmi {
        case 0..<18.5:
            result = "저체중"
        case 18.5..<24:
            result = "정상"
        case 24...:
            result = "다이어트 ㄱㄱ"
        default:
            break
        }
        
        checkResult()
    }
    
    
    func checkResult() {
        let alert = UIAlertController(title: "BMI결과", message: "결과를 확인하세요.", preferredStyle: .actionSheet)
        // 2. 버튼 만들기
        let resultButton = UIAlertAction(title: result, style: .default)
        let deleteButton = UIAlertAction(title: "확인했어요", style: .destructive)
      
        // 3. 버튼 붙여주기 > 1번에다가 2번을 촥
        alert.addAction(resultButton)
        alert.addAction(deleteButton)
        // 4. 보여줘
        present(alert, animated: true)
    }
    
    
    
    
    
    
    
    
    
    
    @IBAction func keyboardDismiss(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
}



extension BMIViewController: UITextFieldDelegate {
    
    // 글자입력 불가
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //백스페이스 가능
        if let back = string.cString(using: String.Encoding.utf8) {
                let isBackSpace = strcmp(back, "\\b")
                if (isBackSpace == -92) {
                    return true
                }
            }
           // 숫자만 && 글자수 제한
        guard Int(string) != nil || string == "" else { return false }
        guard textField.text!.count < 3 else { return false }
               
           return true
       }

    
}
