//
//  InsertDeleteRowInTableView.swift
//  AutoImageSliderScroller
//
//  Created by Dheeraj Arora on 17/09/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit

class InsertDeleteRowInTableView: UIViewController {
    
    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var myTableView: UITableView!
    var strArr = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func onClickAddAction(_ sender: Any) {
        if let txt = txtInput.text, !txt.isEmpty{
            strArr.insert(txt, at: 0)
            myTableView.beginUpdates()
            myTableView.insertRows(at: [IndexPath(row: 0, section: 0	)], with: .right)
            myTableView.endUpdates()
            txtInput.text = nil
        }
    }
   
    @IBAction func btnDeleteAction(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: myTableView)
        guard let indexPath = myTableView.indexPathForRow(at: point) else { return }
        strArr.remove(at: indexPath.row)
        myTableView.beginUpdates()
        myTableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .left)
        myTableView.endUpdates()
    }
}
extension InsertDeleteRowInTableView: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.lblName.text = strArr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
