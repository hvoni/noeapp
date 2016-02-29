//
//  NoiteViewController.swift
//  noeAPP
//
//  Created by Henrique on 24/02/16.
//  Copyright © 2016 Henrique. All rights reserved.
//

import UIKit
import CoreData

class NoiteViewController: UIViewController {
    
    var managedObjectContext: NSManagedObjectContext!
    var anottations: [Anottation] = []
    var selectedDate = NSDate()
    let dateFormatter = NSDateFormatter()
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.setValue(UIColor.whiteColor(), forKey: "textColor")
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        managedObjectContext = appDelegate.managedObjectContext
        anottations = Anottation.findAllInContext(managedObjectContext)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changedDate(sender: UIDatePicker) {
        let ti = NSTimeZone.localTimeZone()
        let segundos = ti.secondsFromGMTForDate(sender.date)
        selectedDate = NSDate(timeInterval: NSTimeInterval(segundos), sinceDate: sender.date)
        print(selectedDate)
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
         let datePassing = dateFormatter.stringFromDate(selectedDate)
        // TODO: Predicate next view if date already saved
        let fetchRequest = NSFetchRequest(entityName: "Anottation")
        let predicate = NSPredicate(format: "date == %@", datePassing)
        fetchRequest.predicate = predicate
        
        let fetchedResult = try! managedObjectContext.executeFetchRequest(fetchRequest)
        let anottation = fetchedResult.first
        
        if let fetchedDate = anottation?.valueForKey("date"){
            print(fetchedDate)
        }
       
        let noiteAnnotationViewController = segue.destinationViewController as! NoiteAnnotationViewController
        noiteAnnotationViewController.text = datePassing
        noiteAnnotationViewController.managedObjectContext = managedObjectContext
    }

    
}
