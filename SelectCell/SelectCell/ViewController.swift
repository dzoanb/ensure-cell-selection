//
//  ViewController.swift
//  SelectCell
//
//  Created by Joanna Bednarz on 06/04/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    var data = [String]()
    @IBOutlet weak var tableView: UITableView!

    // MARK: UIView life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        for counter in 1...32 {
            data.append("Row No. \(counter)")
        }
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.cellIdentifier, for: indexPath)
        guard let myCell = cell as? MyTableViewCell  else {
            return cell
        }

        myCell.titleLabel.text = data[indexPath.row]
        myCell.setSelected(true, animated: false)
        return myCell
    }
}
