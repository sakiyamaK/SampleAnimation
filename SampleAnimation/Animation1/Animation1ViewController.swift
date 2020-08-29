//
//  Animation1ViewController.swift
//  SampleAnimation
//
//  Created by sakiyamaK on 2020/03/20.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

class Animation1ViewController: UIViewController {

  @IBOutlet weak var animView1: UIView! {
    didSet {
      let g = UITapGestureRecognizer.init(target: self, action: #selector(tapAnimView1))
      animView1.addGestureRecognizer(g)
    }
  }

  private var isRotated: Bool = false
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
  @IBOutlet weak var blueDismissConst: NSLayoutConstraint!

  @IBOutlet weak var greenDismissConst: NSLayoutConstraint!
  @IBOutlet weak var greenShowConst: NSLayoutConstraint!

  @IBOutlet weak var orangeDismissConst: NSLayoutConstraint!
  @IBOutlet weak var orangeShowConst: NSLayoutConstraint!

}

extension Animation1ViewController {

  @objc func tapAnimView1() {
    //0.1sec アニメーション
    UIView.animate(withDuration: 0.1, animations: {
      self.animView1.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
    }) { (_) in //アニメーションが終わったcompletion
      //0.1sec アニメーション
      UIView.animate(withDuration: 0.1, animations: {
        self.animView1.transform = CGAffineTransform.init(scaleX: 1.1, y: 1.1)
      }) { (_) in //アニメーションが終わったcompletion
        //0.1sec アニメーション
        UIView.animate(withDuration: 0.1, animations: {
          self.animView1.transform = .identity
        })
      }
    }
  }

  @objc func tapAnimView2() {
    let angle = isRotated ? 0.0 : CGFloat(45.0 / 180 * Double.pi)
    isRotated.toggle()
    //0.1sec アニメーション
    UIView.animate(withDuration: 0.1, animations: {
      self.animView2.transform = CGAffineTransform.init(rotationAngle: angle)
    })
  }

  @objc func tapAnimView3() {
    UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
      self.animView3.transform = CGAffineTransform.init(translationX: 0, y: 100)
    }){ (_) in //アニメーションが終わったcompletion
      UIView.animate(withDuration: 0.2, animations: {
        self.animView3.transform = .identity
      })
    }
  }

  @objc func tapAnimView4() {
    isBGAnimed.toggle()
    if isBGAnimed {
      //制約のactiveを切り替える
      self.blueDismissConst.isActive = false
      self.blueShowConst.isActive = true
      //0.5sec アニメーション
      UIView.animate(withDuration: 0.5, animations: {
        //制約に基づいて更新する
        self.view.layoutIfNeeded()
      }) { (_) in //アニメーションが終わったcompletion

        self.greenDismissConst.isActive = false
        self.greenShowConst.isActive = true

        //0.5sec アニメーション
        UIView.animate(withDuration: 0.5, delay: 0.1, animations: {
          //制約に基づいて更新する
          self.view.layoutIfNeeded()
        }) { (_) in //アニメーションが終わったcompletion
          self.orangeDismissConst.isActive = false
          self.orangeShowConst.isActive = true
          //0.5sec アニメーション
          UIView.animate(withDuration: 0.5, delay: 0.2, animations: {
            //制約に基づいて更新する
            self.view.layoutIfNeeded()
          })
        }
      }
    } else {
      //制約のactiveを切り替える
      self.blueShowConst.isActive = false
      self.blueDismissConst.isActive = true

      self.greenShowConst.isActive = false
      self.greenDismissConst.isActive = true

      self.orangeShowConst.isActive = false
      self.orangeDismissConst.isActive = true

      //0.5sec アニメーション
      UIView.animate(withDuration: 0.5, animations: {
        //制約に基づいて更新する
        self.view.layoutIfNeeded()
      })
    }
  }
}
