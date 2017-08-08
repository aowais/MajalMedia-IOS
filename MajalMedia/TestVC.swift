//
//  TestVC.swift
//  MajalMedia
//
//  Created by Ahmad Owais on 8/8/17.
//  Copyright © 2017 Ahmad Owais. All rights reserved.
//

import UIKit

class TestVC: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
    var pageController: UIPageViewController?
    var pageContent = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        createContentPages()
        pageController = UIPageViewController(
            transitionStyle: .pageCurl,
            navigationOrientation: .horizontal,
            options: nil)
        
        pageController?.delegate = self
        pageController?.dataSource = self
        
        let startingViewController: TestContentVC = viewControllerAtIndex(index: 0)!
        
        let viewControllers: NSArray = [startingViewController]
        pageController!.setViewControllers(viewControllers
            as? [UIViewController],
                                           direction: .forward,
                                           animated: false,
                                           completion: nil)
        
        self.addChildViewController(pageController!)
        self.view.addSubview(self.pageController!.view)
        
        let pageViewRect = self.view.bounds  
        pageController!.view.frame = pageViewRect    
        pageController!.didMove(toParentViewController: self)
    }
    
    func createContentPages() {
        
        var pageStrings = [String]()
        
        for i in 1...20
        {
//            let contentString = "<html><head></head><body><br><h1>Chapter \(i)</h1><p>This is the page \(i) of content displayed using UIPageViewController in iOS 9.</p></body></html>"
            let contentString = "Contrary to popular belief \(i) , Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit ametcomes from a line in section The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham. Contrary to popular belief \(i) , Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit ametcomes from a line in section The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham."
            pageStrings.append(contentString)
        }
        pageContent = pageStrings as NSArray
    }
    
    func viewControllerAtIndex(index: Int) -> TestContentVC? {
        
        if (pageContent.count == 0) ||
            (index >= pageContent.count) {
            return nil
        }
        
        let storyBoard = UIStoryboard(name: "Main",
                                      bundle: Bundle.main)
        let dataViewController = storyBoard.instantiateViewController(withIdentifier: "testcontent") as! TestContentVC
        
        dataViewController.dataObject = pageContent[index] as AnyObject
        return dataViewController
    }
    
    func indexOfViewController(viewController: TestContentVC) -> Int {
        
        if let dataObject: AnyObject = viewController.dataObject {
            return pageContent.index(of: dataObject)
        } else {
            return NSNotFound
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = indexOfViewController(viewController: viewController as! TestContentVC)
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return viewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = indexOfViewController(viewController: viewController as! TestContentVC)
        
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == pageContent.count {
            return nil
        }
        return viewControllerAtIndex(index: index)
    }

}
