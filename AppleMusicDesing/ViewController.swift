//
//  ViewController.swift
//  AppleMusicDesing
//
//  Created by Beyza Sude Erol on 10.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        customNibs()
    }
    
    func customNibs() {
        let customCellNib: UINib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(customCellNib, forCellReuseIdentifier: "tableViewCell")
        
        let secondCustomCellNib: UINib = UINib(nibName: "SecondTableViewCell", bundle: nil)
        tableView.register(secondCustomCellNib, forCellReuseIdentifier: "secondTableViewCell")
        
        let thirdCustomCellNib: UINib = UINib(nibName: "ThirdTableViewCell", bundle: nil)
        tableView.register(thirdCustomCellNib, forCellReuseIdentifier: "thirdTableViewCell")
        
        let fourthCustomCellNib: UINib = UINib(nibName: "FourthTableViewCell", bundle: nil)
        tableView.register(fourthCustomCellNib, forCellReuseIdentifier: "fourthTableViewCell")
        
        let fifthCustomCellNib: UINib = UINib(nibName: "FifthTableViewCell", bundle: nil)
        tableView.register(fifthCustomCellNib, forCellReuseIdentifier: "fifthTableViewCell")
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? TableViewCell {
                return cell
            }
        }else if indexPath.section == 1 {
            if let cell2 = tableView.dequeueReusableCell(withIdentifier: "secondTableViewCell", for: indexPath) as? SecondTableViewCell {
                cell2.sectionHeaderLabel.text = "Şimdi Uzamsal Ses'te"
                return cell2
            }
        }else if indexPath.section == 2 {
            if let cell3 = tableView.dequeueReusableCell(withIdentifier: "thirdTableViewCell", for: indexPath) as? ThirdTableViewCell {
                cell3.sectionHeaderLabel.text = "Her Zaman Yanında"
                return cell3
            }
        }else if indexPath.section == 3 {
            if let cell4 = tableView.dequeueReusableCell(withIdentifier: "fourthTableViewCell", for: indexPath) as? FourthTableViewCell {
                return cell4
            }
        }
        else if indexPath.section == 4 {
            if let cell5 = tableView.dequeueReusableCell(withIdentifier: "fifthTableViewCell", for: indexPath) as? FifthTableViewCell {
                cell5.sectionHeaderLabel.text = "Her Zaman Yanında"
                return cell5
            }
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
}
