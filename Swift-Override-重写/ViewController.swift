//
//  ViewController.swift
//  Swift-Override-重写
//
//  Created by RN on 17/12/8.
//  Copyright © 2017年 YueKekui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let onePeople =  ChinesePeople.init()
        print( onePeople.des())
        let secondPeople = AmericanPeople.init()
        secondPeople.nationalityStr = "注意重写set get的返回"
        print(secondPeople.des())
        let thirdPeople = AustraliansPeople.init()
        thirdPeople.abilityInt = 5
        print(thirdPeople.des())
        
    }
    //MARK: 定义一个类
    class People
    {
        var nameStr: String
        var abilityInt: Int
        func des() -> String
        {
            return "\(nameStr)的能力值\(abilityInt)"
        }
        init() {
            nameStr    = "YueKekui"
            abilityInt = 0
        }
    }
    //MARK: 重写父类方法
    class ChinesePeople:People
    {
        var nationalityStr = "中国🇨🇳"
        override init()
        {
            super.init()
            nameStr    = "ChenJian"
            abilityInt = 666
            //self.nameStr = "LuGaygay"
            //self.abilityInt = 8888
            //继承了父类的属性，因此nameStr、 self.nameStr的属性
        }
        override func des()->String{
            return super.des() + "他是\(nationalityStr)人"
        }
    }
    //MARK: 重写属性 
    //子类并不知道继承来的属性是储值型还是算值型，它只知道继承来的属性有一个名字和类型，所以在重写属性时必须把它的名字和类型都写出来
    //储值属性可以重写为算值属性
    //只读可以重写为读写；读写不能重写为只读
    //不想重写getter，可以直接返回super.Someproperty
    class AmericanPeople: ChinesePeople {
       // override var nationalityStr = "美国🇺🇸"
    ////重写了父类的属性nationalityStr，因此self和super的nationalityStr是两个不同的属性
        override var nationalityStr:String {
            get {
                return super.nationalityStr
            }
            set {
                super.nationalityStr = "美国🇺🇸"
            }
        }
    }
    
    //MARK: 重写属性观察器 Australians
    //可以为继承来的变量储值属性添加属性观察器
    //可以值重写didSet或willSet
    class AustraliansPeople: People {
        var richInt = 1
        override var abilityInt: Int{
            didSet{
                richInt = Int(abilityInt*2)+2;
            }
        }
        //重写打印方法
        override func des() -> String {
            return super.des()+"财富指标\(richInt)"
        }
    }
    
    //防止重写
    //通过把方法、属性或下标标记为final来防止它们被重写
    //在扩展中，添加到类里的方法、属性或下标也可以在扩展的定义里标记为final
    //可以在class前添加final来将整个定义为不能重写，这样的类是不可继承的
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

