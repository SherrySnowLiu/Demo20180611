//
//  MyTableViewCell.swift
//  hangge_1591
//
//  Created by hangge on 2018/1/3.
//  Copyright © 2018年 hangge. All rights reserved.
//

import UIKit
import Kingfisher

class MyTableViewCell: UITableViewCell
{
    //单元格标题
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var topImageViewHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    @IBAction func clickB(_ sender: UIButton) {
        let currentController = MyTableViewCell.currentViewController()
        
        let bViewController = BViewController()
        currentController?.present(bViewController, animated: true, completion: nil)
    }
    
    @IBAction func clickA(_ sender: UIButton) {
        let currentController = getCurrentViewController()
        let aViewController = AViewController()
        currentController?.present(aViewController, animated: true, completion: nil)
    }
    
    class func currentViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return currentViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return currentViewController(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            return currentViewController(base: presented)
        }
        return base
    }
    
    func getCurrentViewController()-> UIViewController? {
        let window = UIApplication.shared.keyWindow
        let navigationController = window?.rootViewController
        if navigationController is UINavigationController {
            let navigation = navigationController as! UINavigationController
            return navigation.topViewController!
        }
        return nil
    }
    
    //加载数据
    func reloadData(title:String, images:String) {
        //设置标题
        self.titleLabel.text = title
        self.titleLabel.numberOfLines = 2

        self.topImageView.kf.setImage(with: URL(string: images))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
