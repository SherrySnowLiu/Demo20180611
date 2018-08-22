//
//  ViewController.swift
//  hangge_1591
//
//  Created by hangge on 2018/1/3.
//  Copyright © 2018年 hangge. All rights reserved.
//

import UIKit

struct BookPreview {
    var title:String
    var images:String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var ctrlnames:[AnyObject] = []

    
    //显示内容的tableView
    @IBOutlet weak var tableView: UITableView!
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        self.tableView.backgroundColor = UIColor.gray
        
        //设置tableView代理
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        
        //去除单元格分隔线
        self.tableView!.separatorStyle = .none
        
        //创建一个重用的单元格
        self.tableView!.register(UINib(nibName:"MyTableViewCell", bundle:nil),
                                 forCellReuseIdentifier:"myCell")
        
        //设置estimatedRowHeight属性默认值
        self.tableView!.estimatedRowHeight = 44.0
        //rowHeight属性设置为UITableViewAutomaticDimension
        self.tableView!.rowHeight = UITableViewAutomaticDimension
        
        
        //创建URL对象
        let urlString = "http://static.youshikoudai.com/mockapi/data"
        let url = URL(string:urlString)!
        //创建请求对象
        let request = URLRequest(url: url)
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request,
                                        completionHandler: {(data, response, error) -> Void in
                                            if error != nil{
                                                print(error?.localizedDescription)
                                            }else{
                                                self.ctrlnames = try! JSONSerialization.jsonObject(with: data!,
                                                                                                   options: JSONSerialization.ReadingOptions.mutableContainers)
                                                    as! [AnyObject]
                                                
                                                DispatchQueue.main.async{
                                                    self.tableView?.reloadData()
                                                }
                                            }
        })
        
        //使用resume方法启动任务
        dataTask.resume()
    }
    
    //在本例中，只有一个分区
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    //返回表格行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ctrlnames.count
    }
    
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MyTableViewCell
            
            let item = self.ctrlnames[indexPath.row]
            let image = item.object(forKey: "image") as! String
            let text = item.object(forKey: "text") as? String
            //重新加载单元格数据
            cell.reloadData(title:text!, images: image)
            
            return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
