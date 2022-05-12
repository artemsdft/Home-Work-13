//
//  ViewController.swift
//  Home Work 13
//
//  Created by Артем Дербин on 04.05.2022.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private lazy var tableView: UITableView = {
        var tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: indentifire)
        return tableView
    }()
    
    
    
    private var indentifire = "cell"
    private var secondaryText = "Apple ID, ICloud, контент и покупки"
    
    private var names = [
        ["Артем Дербин"],
        ["Авиарежим", "WI-FI", "Bluetooth", "Сотовая связь", "Режим модема", "VPN"],
        ["Уведомления", "Звуки, тактильные сигналы", "Фокусирование", "Экранное время"],
        ["Основные", "Пункт управления", "Экран и яркость", "Экран Домой", "Универсальный доступ"]
    ]
    
    private var images = [
        ["avatar"],
        ["airPlane", "wi-fi", "bluetooth", "cell","modem", "vpn"],
        ["bell", "pod", "moon", "watch"],
        ["setting", "switch", "display", "displayHome", "universalAccess"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHierarchy()
        
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setUpHierarchy() {
        view.addSubview(tableView)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 6
        case 2:
            return 4
        case 3:
            return 5
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifire, for: indexPath)
        let switchView = UISwitch()
        if indexPath.section == 1 && indexPath.row == 0 {
            cell.accessoryView = switchView
        } else {
            cell.accessoryType = .disclosureIndicator
        }
        
        var content = cell.defaultContentConfiguration()
        content.text = names[indexPath.section][indexPath.row]
        
        content.image = UIImage(named: images[indexPath.section][indexPath.row])
        if indexPath.row == 0 && indexPath.section == 0 {
            content.imageProperties.cornerRadius = 55
            content.secondaryText = secondaryText
        }
        
        cell.contentConfiguration = content
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 && indexPath.section == 0 {
           return 80
        }
        return 45
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let info = names[indexPath.section][indexPath.row]
        print("Нажата ячейка \(info)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

