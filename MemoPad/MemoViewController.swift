//
//  MemoViewController.swift
//  MemoPad
//
//  Created by あらいゆめ on 2023/02/10.
//

import UIKit

class MemoViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var titleTextField:UITextField!
    @IBOutlet weak var contentTextView:UITextView!
    
    var saveDate: UserDefaults = UserDefaults.standard
    
    
    var titles: [String] = []
    var contents: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveDate.register(defaults: ["titles": [], "contents": [] ])
        
        titles = saveDate.object(forKey: "titles") as! [String]
        contents = saveDate.object(forKey: "contents") as! [String]
        
        
        print(titles)
        print(contents)
        
        titleTextField.delegate = self
        
        
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func saveMemo(_ sender: Any){
        let title = titleTextField.text!
        let content = contentTextView.text!
        
        titles.append(title)
        contents.append(content)
        
        saveDate.set(titles, forKey: "titles")
        saveDate.set(contents, forKey: "contents")

        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(title: "OK",
                          style: .default,
                          handler: { action in
                              self.navigationController?.popViewController(animated: true)
                          })
                              
                        )
        
        present(alert,animated:true,completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
