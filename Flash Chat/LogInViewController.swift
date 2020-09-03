//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import Firebase
import SVProgressHUD


class LogInViewController: UIViewController, UITextFieldDelegate
{
  //Textfields pre-linked with IBOutlets
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
      logInPressed(self)
    }
    return true
  }

  @IBAction func logInPressed(_ sender: AnyObject)
  {
    SVProgressHUD.show()

    //TODO: Log in the user
    Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!)
    {
      (user, error) in
      if error != nil
      {
        ShowErrorPopup(title: "Error logging", message: error?.localizedDescription, sender: self)
      }
      else
      {
        SVProgressHUD.dismiss()
        self.performSegue(withIdentifier: "goToChat", sender: self)
      }
    }
  }
}
