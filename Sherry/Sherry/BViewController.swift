import UIKit

class BViewController: UIViewController {
    
    var count = 0
    //声明导航条
    var navigationBar:UINavigationBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        //实例化导航条
        navigationBar = UINavigationBar(frame: CGRect(x:0, y:20, width:500, height:44))
        self.view.addSubview(navigationBar!)
        onAdd()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    //增加导航项函数
    @objc func onAdd(){
        count = count + 1
        //给导航条增加导航项
        navigationBar?.pushItem(onMakeNavitem(), animated: true)
    }
    
    //删除导航项函数
    @objc func onBack(){
        dismiss(animated: true, completion: nil) 
    }
    
    //创建一个导航项
    func onMakeNavitem()->UINavigationItem{
        let navigationItem = UINavigationItem()
        let leftBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel,
                                       target: self, action: #selector(onBack))
        //设置导航栏标题
        navigationItem.title = "BViewController"

        navigationItem.setLeftBarButton(leftBtn, animated: true)
        return navigationItem
    }
}
