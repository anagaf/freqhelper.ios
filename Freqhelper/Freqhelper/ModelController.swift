//
//  ModelController.swift
//  Freqhelper
//
//  Created by anagaf on 19/10/15.
//  Copyright © 2015 anagaf. All rights reserved.
//

import UIKit

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */


class ModelController: NSObject, UIPageViewControllerDataSource {

    let pageIds: [String] = ["Channels", "Ctcss"];
    var pages: [UIViewController?] = [nil, nil]

    func viewControllerAtIndex(index: Int, storyboard: UIStoryboard) -> UIViewController? {
        // Return the data view controller for the given index.
        if (self.pageIds.count == 0) || (index >= self.pageIds.count) {
            return nil
        }
        
        var page = pages[index]
        if page == nil {
            let pageId = pageIds[index]
            page = storyboard.instantiateViewControllerWithIdentifier(pageId) as UIViewController;
            self.pages[index] = page
        }
        return page;
    }

    func indexOfViewController(viewController: UIViewController) -> Int {
        let index = self.pages.indexOf({$0 === viewController});
        if (index == nil) {
            return NSNotFound;
        }
        return index!;
    }

    // MARK: - Page View Controller Data Source

    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index--
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController)
        if index == NSNotFound {
            return nil
        }
        
        index++
        if index == self.pageIds.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

}

