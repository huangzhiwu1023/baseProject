//
//  YFRootVC.swift
//  jsyf_user
//
//  Created by 黄志武 on 2017/11/1.
//  Copyright © 2017年 YF. All rights reserved.
//
/**
 
 */

import UIKit

class YFRootVC:  UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confignSubViewControllers()
     
      
    }
    func confignSubViewControllers() {
        
        let One: UINavigationController = {
            let vc = YFOneVC()
            let navigationController = UINavigationController.init(rootViewController: vc)
            navigationController.tabBarItem.title = "首页"
            navigationController.tabBarItem.image = UIImage(named: "1主页")?.withRenderingMode(.alwaysOriginal)
            navigationController.tabBarItem.selectedImage = UIImage(named: "1主页选中")?.withRenderingMode(.alwaysOriginal)
            return navigationController
        }()
        
        let Two: UINavigationController = {
            let vc = YFTwoVC()
            
            let navigationController = UINavigationController.init(rootViewController: vc)
            navigationController.tabBarItem.title = "新机"
            navigationController.tabBarItem.image = UIImage(named: "2新机")?.withRenderingMode(.alwaysOriginal)
            navigationController.tabBarItem.selectedImage = UIImage(named: "2新机选中")?.withRenderingMode(.alwaysOriginal)
            return navigationController
        }()
        
        let Thr: UINavigationController = {
            let vc = YFThrVC()
            
            let navigationController = UINavigationController.init(rootViewController: vc)
            navigationController.tabBarItem.title = "资讯"
            navigationController.tabBarItem.image = UIImage(named: "3咨询")?.withRenderingMode(.alwaysOriginal)
            navigationController.tabBarItem.selectedImage = UIImage(named: "3咨询选中")?.withRenderingMode(.alwaysOriginal)
            return navigationController
        }()
        
        let Four: UINavigationController = {
            let vc = YFFourVC()
            
            let navigationController = UINavigationController.init(rootViewController: vc)
            navigationController.tabBarItem.title = "个人中心"
            navigationController.tabBarItem.image = UIImage(named: "4个人")?.withRenderingMode(.alwaysOriginal)
            navigationController.tabBarItem.selectedImage = UIImage(named: "4个人选中")?.withRenderingMode(.alwaysOriginal)
            
            return navigationController
        }()
        
        
        viewControllers = [One,Two,Thr,Four]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
