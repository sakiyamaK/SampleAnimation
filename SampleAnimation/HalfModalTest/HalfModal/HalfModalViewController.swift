//
//  Animation2ViewController.swift
//  SampleAnimation
//
//  Created by sakiyamaK on 2020/07/31.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class HalfModalViewController: UIViewController {

  @IBOutlet private weak var slideViewCenterXConstraint: NSLayoutConstraint!

  override func viewDidLoad() {
    super.viewDidLoad()
    dismissModal(isAnimation: false)
  }

  func dismissModal(isAnimation: Bool = true) {
    slideViewCenterXConstraint.constant = self.view.frame.height

    if isAnimation {
      UIView.animate(withDuration: 0.2) {
        self.view.layoutIfNeeded()
      }
    } else {
      self.view.layoutIfNeeded()
    }
  }

  func showModal(isAnimation: Bool = true) {
    slideViewCenterXConstraint.constant = 0
    if isAnimation {
      UIView.animate(withDuration: 0.2) {
        self.view.layoutIfNeeded()
      }
    } else {
      self.view.layoutIfNeeded()
    }
  }
}
