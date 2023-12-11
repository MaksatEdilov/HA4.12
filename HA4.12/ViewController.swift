//
//  ViewController.swift
//  HA4.12
//
//  Created by Maksat Edil on 10/12/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let settingsBtn = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(settingBtnTapped))
        navigationItem.rightBarButtonItem = settingsBtn
    }
    
   
    
    @objc private func settingBtnTapped(_ sender: UIButton ) {
        let vc = TableViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

