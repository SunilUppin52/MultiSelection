//
//  ViewController.swift
//  MultiSelect
//
//  Created by Rajesh Gaddam on 12/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var selectAllBtn: UIButton!
    @IBOutlet weak var tableview: UITableView!
    var arrData = [String]()
    var selectArr = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
        selectAllBtn.isSelected = true
        self.tableview.register(UINib(nibName: "SelectTableViewCell", bundle: nil), forCellReuseIdentifier: "SelectTableViewCell")
        tableview.delegate = self
        tableview.dataSource = self
        self.tableview.isEditing = true
        self.tableview.allowsMultipleSelectionDuringEditing = true
        // Do any additional setup after loading the view.
    }
     func getData()
    {
      arrData = ["Hello 1","Hello 2","Hello 3","Hello 4","Hello 5","Hello 6","Hello 7","Hello 8","Hello 9","Hello 10","Hello 1","Hello 2","Hello 3","Hello 4","Hello 5","Hello 6","Hello 7","Hello 8","Hello 9"]
    }

    @IBAction func onClickNext(_ sender: Any) {
        print(selectArr)
        
    }
    
    @IBAction func onClickSelectAll(_ sender: UIButton) {
        self.selectArr.removeAll()
        if sender.isSelected
        {
            for row in 0..<arrData.count
            {
                self.tableview.selectRow(at: IndexPath(row: row, section: 0), animated: false, scrollPosition: .none)
            }
            sender.isSelected = false
            sender.setImage(UIImage(named: "ios7-checkmark-outline"), for: .normal)
            selectArr = arrData
        }
        else
        {
            for row in 0..<arrData.count
            {
              //  self.tableview.deselectRow(at: IndexPath(row: row, section: 0), animated: false, scrollPosition: .none)
                self.tableview.deselectRow(at: IndexPath(row: row, section: 0), animated: false)
            }
            sender.isSelected = true
            sender.setImage(UIImage(named: "ios7-circle-outline"), for: .normal)
            selectArr = arrData
            self.selectArr.removeAll()
        }
    }
}
extension ViewController : UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectTableViewCell", for: indexPath) as! SelectTableViewCell
      //  cell.textLabel?.text = arrData[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectDeselectCell(tableview: tableView, indexpath: indexPath)
        print("select")
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.selectDeselectCell(tableview: tableView, indexpath: indexPath)
        print("Deselect")
    }
}
extension ViewController
{
    func selectDeselectCell(tableview: UITableView, indexpath : IndexPath)
    {
        selectArr.removeAll()
        if let arr = tableview.indexPathsForSelectedRows
        {
            for index in arr{
                selectArr.append(arrData[index.row])
            }
        }
        print(selectArr)
    }
}

