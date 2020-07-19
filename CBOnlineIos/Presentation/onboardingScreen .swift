//
//  onboardingScreen .swift
//  CBOnlineIos
//
//  Created by Vaibhav Bisht on 10/06/20.
//  Copyright © 2020 Coding Blocks. All rights reserved.
//

import UIKit
class onboardingScreen: UIViewController,UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var browseCourse: UIButton!
    @IBOutlet weak var login: UIButton!
    
    var scrollWidth: CGFloat! = 0.0
    var scrollHeight: CGFloat! = 0.0
    
    override open var shouldAutorotate: Bool {
        return false
    }
    //MARK: data for the slides
    var titles = ["Learn from the best in the industry","Learn on the go anytime, anywhere","Resolve all your doubts with TA's & Mentors"]
    var descs = ["Experienced, engaging instructors take you through course material, step by step, in our high-quality video lessons.","You can learn anytime anywhere with our all new iOS app. Download and save video offline.","Get exclusive access to Live Webinars where you interact with mentors for important course topics & can solve all your doubts."]
    var imgs = ["intro1","intro2","intro3"]
    
    //get dynamic width and height of scrollview and save it
    override func viewDidLayoutSubviews() {
        scrollWidth = scrollView.frame.size.width
        scrollHeight = scrollView.frame.size.height
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        self.scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = true
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        for index in 0..<titles.count {
            frame.origin.x = scrollWidth * CGFloat(index)
            frame.size = CGSize(width: scrollWidth, height: scrollHeight)
            
            let slide = UIView(frame: frame)
            
            //subviews
            
            let txt1 = UILabel.init(frame: CGRect(x:32,y:32,width:scrollWidth-64,height:60))
            txt1.textAlignment = .center
            txt1.numberOfLines = 2
            txt1.font = UIFont.boldSystemFont(ofSize: 22.0)
            txt1.text = titles[index]
            
            let imageView = UIImageView.init(image: UIImage.init(named: imgs[index]))
            imageView.frame = CGRect(x:0,y:txt1.frame.maxY+50,width:scrollWidth-50,height:300)
            imageView.contentMode = .scaleAspectFit
                          imageView.center = CGPoint(x:scrollWidth/2,y:txt1.frame.maxY+200 )
            imageView.contentMode = UIView.ContentMode.scaleAspectFit
            
            
            
            
            let txt2 = UILabel.init(frame: CGRect(x:32,y:imageView.frame.maxY+20,width:scrollWidth-64,height:100))
            txt2.textAlignment = .center
            txt2.numberOfLines = 5
            txt2.font = UIFont.systemFont(ofSize: 18.0, weight: .thin)
            txt2.text = descs[index]
            
            
            slide.addSubview(imageView)
            slide.addSubview(txt1)
            slide.addSubview(txt2)
            scrollView.addSubview(slide)
            
        }
        
        //set width of scrollview to accomodate all the slides
        scrollView.contentSize = CGSize(width: scrollWidth * CGFloat(titles.count), height: scrollHeight)
        
        
        //initial state
        pageControl.numberOfPages = titles.count
        pageControl.currentPage = 0
        
    }
    
    //indicator
    @IBAction func pageChanged(_ sender: Any) {
        scrollView!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat ((pageControl?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setIndiactorForCurrentPage()
    }
    
    func setIndiactorForCurrentPage()  {
        let page = (scrollView?.contentOffset.x)!/scrollWidth
        pageControl?.currentPage = Int(page)
    }
}
