//
//  NoiteAnnotationViewController.swift
//  noeAPP
//
//  Created by Henrique on 24/02/16.
//  Copyright © 2016 Henrique. All rights reserved.
//

import UIKit
import CoreData

class NoiteAnnotationViewController: UIViewController {
 
    @IBOutlet weak var dateLabel: UILabel!
    
    var text = String()
    var managedObjectContext: NSManagedObjectContext!
    
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var ponderationsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = text
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func saveAnnotation(sender: UIButton) {
        
        // TODO: Predicate before saving
        
        if let author = authorTextField.text, subject = subjectTextField.text, ponderations = ponderationsTextView.text{
            let anottation = Anottation(managedObjectContext: managedObjectContext)
            anottation.author = author
            anottation.date = dateLabel.text
            anottation.ponderation = ponderations
            anottation.subject = subject
            
            try! anottation.save(managedObjectContext)
            print(anottation.author, anottation.date, anottation.subject)
            
            let alert = UIAlertController(title: "Noite Familiar", message: "Anotação Salva com Sucesso.", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            alert.addAction(okAction)
            presentViewController(alert, animated: true, completion: nil)
        }
        
        
    }

}
