//
//  CityViewController.swift
//  AboutUserDeafaults
//
//  Created by 최대성 on 5/31/24.
//

import UIKit
import Kingfisher

class CityViewController: UIViewController {

    @IBOutlet var mainTableView: UITableView!
    @IBOutlet var bookmarkButton : UIButton!
    
    var list = CityInfo().city
    var mainList = CityInfo().city
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.rowHeight = 200
        
        let xib = UINib(nibName: CityTableViewCell.identifier, bundle: nil)
        mainTableView.register(xib, forCellReuseIdentifier: CityTableViewCell.identifier)
        
        for i in 0...list.count-1 {
            list[i].like = UserDefaults.standard.bool(forKey: "\(list[i].city_name)")
        }
    }
    
    
    @objc func likeButtonTapped(sender: UIButton) {
        list[sender.tag].like.toggle()
        UserDefaults.standard.setValue(list[sender.tag].like, forKey: "\(list[sender.tag].city_name)")
        print("\(list[sender.tag].city_name), \(list[sender.tag].like)")
        mainTableView.reloadData()
    }
    

    @IBAction func segmentedControll(_ sender: UISegmentedControl) {
        var basketList: [City] = []
        list = mainList
        
        for i in 0...list.count-1 {
            list[i].like = UserDefaults.standard.bool(forKey: "\(list[i].city_name)")
        }
        
        switch sender.selectedSegmentIndex {
        case 0:
            basketList = list
        case 1:
            for item in list {
               if item.domestic_travel  {
                    basketList.append(item)
                }
            }
        case 2:
            for item in list {
                if item.domestic_travel == false {
                    basketList.append(item)
                }
            }
        default:
            break
        }
        
        list = basketList
        mainTableView.reloadData()
    }
    
    
    @IBAction func savedButtonTapped(_ sender: UIButton) {
        var basketList2: [City] = []
        list = mainList
        for i in 0...list.count-1 {
            list[i].like = UserDefaults.standard.bool(forKey: "\(list[i].city_name)")
        }
        
        for item in list {
            if item.like {
                basketList2.append(item)
            }
        }
        
        list = basketList2
        mainTableView.reloadData()
        
    }
}

extension CityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier, for: indexPath) as? CityTableViewCell else { return CityTableViewCell() }
        
        let data = list[indexPath.row]
        
        
        cell.configureCell(data: data)
        
        
        UserDefaults.standard.setValue(data.like, forKey: "\(data.city_name)")
        
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        
        return cell
    }
    
    
    
    
    
    
}
