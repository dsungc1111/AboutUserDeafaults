//
//  EmotionViewController.swift
//  AboutUserDeafaults
//
//  Created by 최대성 on 5/31/24.
//

import UIKit

class EmotionViewController: UIViewController {

    

    
    
    @IBOutlet var buttonList: [UIButton] = []
    @IBOutlet var labelList: [UILabel] = []
    
    
    
    
    var emotionImages: [UIImage] = [.slime1, .slime2, .slime3, .slime4, .slime5, .slime6, .slime7, .slime8, .slime9]
    var count: [Int] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        configureButton()
        configureLabel()
    }
    
    func configureButton() {
        for i in 0...buttonList.count-1 {
            buttonList[i].setImage(emotionImages[i], for: .normal)
            buttonList[i].contentMode = .scaleAspectFill
            buttonList[i].tag = i
            count.append(0)
        }
        
    }
    
    func configureLabel() {
        
        for i in 0...labelList.count-1 {
            count[i] = UserDefaults.standard.integer(forKey: "\(i)")
            labelList[i].text = "\(i+1)번 \(count[i])회 클릭"
        }
    }
    
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        count[sender.tag] += 1
        UserDefaults.standard.setValue(count[sender.tag], forKey: "\(sender.tag)")
        labelList[sender.tag].text = "\(sender.tag+1)번 \(count[sender.tag])회 클릭"
        print(sender.tag)
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        for i in 0...buttonList.count-1 {
            UserDefaults.standard.setValue(0, forKey: "\(i)")
            count[i] = UserDefaults.standard.integer(forKey: "\(i)")
            labelList[i].text = "\(i+1)번 \(count[i])번 클릭"
        }
        
    }
    
  

}
