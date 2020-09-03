//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD


class RegisterViewController: UIViewController, UITextFieldDelegate
{
  //Pre-linked IBOutlets
  @IBOutlet var emailTextfield: UITextField!
  @IBOutlet var passwordTextfield: UITextField!


  override func viewDidLoad()
  {
    super.viewDidLoad()
    passwordTextfield.delegate = self
  }

  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool
  {
    if (textField == passwordTextfield)
    {
      textField.resignFirstResponder()
      registerPressed(self)
    }
    return true
  }

  @IBAction func registerPressed(_ sender: AnyObject)
  {
    SVProgressHUD.show()

    //TODO: Set up a new user on our Firebase database
    Auth.auth().createUser(withEmail: emailTextfield.text!,
                           password: passwordTextfield.text!)
    { (user, error) in
      if error != nil
      {
        ShowErrorPopup(title: "Error registering", message: error?.localizedDescription, sender: self)
      }
      else
      {
        SVProgressHUD.dismiss()
        self.performSegue(withIdentifier: "goToChat", sender: self)
      }
    }
  }
}
