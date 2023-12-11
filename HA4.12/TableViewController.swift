//
//  TableViewController.swift
//  HA4.12
//
//  Created by Maksat Edil on 10/12/23.
//

import UIKit

class TableViewController: UIViewController {

    private let settingsTableView = UITableView()
    
    private var settings = [
            Settings(title: "Темная тема", type: .configure),
            Settings(title: "Выбрать язык", type: .configure)
        ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Настройки"
        
        view.addSubview(settingsTableView)
        setupConstraintsForTableView()
    }

    private func setupConstraintsForTableView() {
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        settingsTableView.dataSource = self
        settingsTableView.delegate = self
    }

}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)

                let setting = settings[indexPath.row]
                cell.textLabel?.text = setting.title

                if setting.type == .configure {
                    let switchView = UISwitch()
                    switchView.isOn = false/* текущее состояние */
                    switchView.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
                    cell.accessoryType = .none
                    cell.accessoryView = switchView
                }

                return cell
    }
    
    @objc func switchChanged(_ sender: UISwitch) {
        if sender.isOn {
                    view.backgroundColor = .black
                    settingsTableView.backgroundColor = .black
                } else {
                    view.backgroundColor = .white
                    settingsTableView.backgroundColor = .white
                }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedSetting = settings[indexPath.row]

            if selectedSetting.type == .configure && selectedSetting.title == "Выбрать язык" {
                let vc = LanguageController()
                navigationController?.pushViewController(vc, animated: true)
            }

            tableView.deselectRow(at: indexPath, animated: true)
        }
}
