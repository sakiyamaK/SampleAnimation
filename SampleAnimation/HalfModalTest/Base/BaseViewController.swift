//
//  BaseViewController.swift
//  SampleAnimation
//
//  Created by sakiyamaK on 2020/07/31.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class BaseViewController: UIViewController {

  @IBAction func showHalfModal(_ sender: Any) {
    guard let halfMoldaVC = UIStoryboard.init(name: "HalfModal", bundle: nil).instantiateInitialViewController() as? HalfModalViewController else {
      return
    }
    //viewControllerを透過させる
    halfMoldaVC.modalPresentationStyle = .overCurrentContext
    //じんわり出てくるアニメーション
    halfMoldaVC.modalTransitionStyle = .crossDissolve
    //viewController自体をアニメーションなしで出現させて
    //viewControllerが出終わったらshowModalを実行する
    self.present(halfMoldaVC, animated: false, completion: {
      halfMoldaVC.showModal(isAnimation: true)
    })
  }
}
