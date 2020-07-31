//
//  Animation2ViewController.swift
//  SampleAnimation
//
//  Created by sakiyamaK on 2020/08/01.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//


import UIKit

class Animation2ViewController: UIViewController {

  @IBOutlet weak var animView1: UIView! {
    didSet {
      let g = UITapGestureRecognizer.init(target: self, action: #selector(tapAnimView1))
      animView1.addGestureRecognizer(g)
    }
  }

  @IBOutlet weak var animView2: UIView! {
    didSet {
      let g = UITapGestureRecognizer.init(target: self, action: #selector(tapAnimView2))
      animView2.addGestureRecognizer(g)
    }
  }

  @IBOutlet weak var animView3: UIView! {
    didSet {
      let g = UITapGestureRecognizer.init(target: self, action: #selector(tapAnimView3))
      animView3.addGestureRecognizer(g)
    }
  }

  private var isBGAnimed: Bool = false
  @IBOutlet weak var animBGView: UIView! {
    didSet {
      let g = UITapGestureRecognizer.init(target: self, action: #selector(tapAnimView4))
      animBGView.addGestureRecognizer(g)
    }
  }

  @IBOutlet weak var blueShowConst: NSLayoutConstraint!
  @IBOutlet weak var greenShowConst: NSLayoutConstraint!
  @IBOutlet weak var orangeShowConst: NSLayoutConstraint!
}

extension Animation2ViewController {

  @objc func tapAnimView1() {
    UIView.animate(withDuration: 1.0, animations: {
      self.animView1.backgroundColor = .systemBlue
    }) { (_) in
      UIView.animate(withDuration: 1.0, animations: {
        self.animView1.backgroundColor = .systemPink
      })
    }
  }

  @objc func tapAnimView2() {
    UIView.animate(withDuration: 1.0, animations: {
      self.animView2.layer.cornerRadius = self.animView2.frame.height / 2
    }) { (_) in
      UIView.animate(withDuration: 1.0, animations: {
        self.animView2.layer.cornerRadius = 0
      })
    }
  }

  @objc func tapAnimView3() {
   UIView.animate(withDuration: 1.0, animations: {
      self.animView3.alpha = 0
    }) { (_) in
      UIView.animate(withDuration: 1.0, animations: {
        self.animView3.alpha = 1
      })
    }
  }

  @objc func tapAnimView4() {
    isBGAnimed.toggle()
    if isBGAnimed {

      self.blueShowConst.constant = 0

      UIView.animate(withDuration: 0.5, animations: {

        self.view.layoutIfNeeded()

        self.greenShowConst.constant = 0

        UIView.animate(withDuration: 0.5, delay: 0.1, animations: {

          self.view.layoutIfNeeded()

          self.orangeShowConst.constant = 0

          UIView.animate(withDuration: 0.5, delay: 0.2, animations: {
            self.view.layoutIfNeeded()
          })
        })
      })
    } else {
      self.blueShowConst.constant = 300
      self.greenShowConst.constant = 300
      self.orangeShowConst.constant = 300

      UIView.animate(withDuration: 0.5, animations: {
        self.view.layoutIfNeeded()
      })
    }
  }
}
