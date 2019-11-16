//
//  tenyearViewController.swift
//  tenyears
//
//  Created by ChiuWanNuo on 2019/11/14.
//  Copyright © 2019 ChiuWanNuo. All rights reserved.
//

import UIKit
import AVFoundation
class tenyearViewController: UIViewController {        
        
        @IBOutlet weak var calendarImageView: UIImageView!
        @IBOutlet weak var datePicker: UIDatePicker!
        @IBOutlet weak var yearSilder: UISlider!
    
        //宣告常數
        let dateFormatter = DateFormatter()
        let image = ["201111","201171","201211","201271","201311","201371","201411","201471","201511","201571","201611","201671","201711","201771","201811","201871","201911","201971",]
    
        //宣告變數
        var dateString:String = ""
        var timer:Timer?
        var imageNumber = 0
        var sliderNumber = 0
    
        override func viewDidLoad() {
            super.viewDidLoad()
        //建立dateFormatter
            time()
            datePicker.locale=Locale(identifier: "zh_TW")
            dateFormatter.dateFormat = "yyyy/MM/dd"
            
        }
    
        //比對陣列內的圖片
        func compare(){
            if imageNumber >= image.count{
                imageNumber = 0
                choosePicture(number:imageNumber)
                calendarImageView.image = UIImage(named: image[imageNumber])
            }else {
                choosePicture(number:imageNumber)
                calendarImageView.image = UIImage(named: image[imageNumber])
            }
            //Slider跟著動
            yearSilder.value = Float(imageNumber)
            imageNumber += 1
        }
        //每一秒執行一次compare
        func time() {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){(timer) in self.compare()}
        }
        
    @IBAction func changeImageDatePicker(_ sender: UIDatePicker) {
        
        //利用datePicker使用年、月選擇照片
        let ImageDate = datePicker.date
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: ImageDate)
        let year = dateComponents.year!
        let month = dateComponents.month!
        let day = dateComponents.day!
        let name = "\(year)\(month)\(day)"
        
        calendarImageView.image = UIImage(named: name)
       
    }
    //Slider的Action
    @IBAction func yearChangeSlider(_ sender: UISlider) {
            sender.value.round()
            sliderNumber = Int(sender.value)
            calendarImageView.image = UIImage(named: image[sliderNumber])
            print(sliderNumber)
            choosePicture(number: sliderNumber)
        }
     
    //Switch的Action
    @IBAction func autoPlaySwitch(_ sender: UISwitch) {
            if sender.isOn {
                time()
                imageNumber = sliderNumber
                yearSilder.value = Float(imageNumber)
            }else {
                timer!.invalidate()
            }
        }
    
    //使用switch做選擇月曆圖片的連續數值判斷
        func choosePicture(number:Int) {
            switch number {
            case 0:
                dateString = "2011/01/01"
            case 1:
                dateString = "2011/07/01"
            case 2:
                dateString = "2012/01/01"
            case 3:
                dateString = "2012/07/01"
            case 4:
                dateString = "2013/01/01"
            case 5:
                dateString = "2013/07/01"
            case 6:
                dateString = "2014/01/01"
            case 7:
                dateString = "2014/07/01"
            case 8:
                dateString = "2015/01/01"
            case 9:
                dateString = "2015/07/01"
            case 10:
                dateString = "2016/01/01"
            case 11:
                dateString = "2016/07/01"
            case 12:
                dateString = "2017/01/01"
            case 13:
                dateString = "2017/07/01"
            case 14:
                dateString = "2018/01/01"
            case 15:
                dateString = "2018/07/01"
            case 16:
                dateString = "2019/01/01"
            default:
                dateString = "2019/07/01"
            }
            
            //修改datapicker顯示日期為dateString內字串的日期
            let date = dateFormatter.date(from: dateString)
            datePicker.date = date!
        }
        //關閉app畫面即停止timer，以防止在背景持續執行
        override func viewDidDisappear(_ animated: Bool) {
            timer?.invalidate()
        }

    }
