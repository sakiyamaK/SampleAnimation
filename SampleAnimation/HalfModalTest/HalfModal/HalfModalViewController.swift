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

  //オマケ 一応見栄え良く角丸にしてるだけ
  @IBOutlet private weak var topBarView: UIView! {
    didSet {
      topBarView.layer.cornerRadius = topBarView.frame.size.height/2
      topBarView.clipsToBounds = true
    }
  }

  @IBOutlet private weak var slideView: UIView! {
    didSet {
      //全体をタッチしたらタップアクションを実行させる
      let t = UITapGestureRecognizer.init(target: self, action: #selector(tapSlideView))
      slideView.addGestureRecognizer(t)
    }
  }

  @IBOutlet private weak var halfMainViewHeightConstraint: NSLayoutConstraint!

  override func viewDidLoad() {
    super.viewDidLoad()
    self.setDefaultPosition()
  }

  func dismissModal(isAnimation: Bool = true) {
    //制約のconstantをviewの高さ分にして画面外に移動させる
    slideViewCenterXConstraint.constant = self.view.frame.height

    if isAnimation {
      //制約をアニメーションさせながら更新
      UIView.animate(withDuration: 0.2, animations: {
        self.view.layoutIfNeeded()
      }) { (_) in
        //アニメーションが終わったらこのview controller自体をdismiss
        self.dismiss(animated: true, completion: nil)
      }
    } else {
      //アニメーションがないのでそのまま、このview controller自体をdismiss
      self.dismiss(animated: true, completion: nil)
    }
  }

  //モーダルを出現させる
  func showModal(isAnimation: Bool = true) {
    //制約のconstantを0にして画面中央に移動させる
    slideViewCenterXConstraint.constant = 0
    if isAnimation {
      //制約をアニメーションさせながら更新
      UIView.animate(withDuration: 0.2) {
        self.view.layoutIfNeeded()
      }
    } else {
      //アニメーションがないのでそのまま制約を更新
      self.view.layoutIfNeeded()
    }
  }
}

private extension HalfModalViewController {
  @IBAction func tapChijime(_ sender: Any) {
    chijime()
  }

  @IBAction func tapNobiro(_ sender: Any) {
    nobiro()
  }

  @objc func tapSlideView() {
    self.dismissModal(isAnimation: true)
  }
}

private extension HalfModalViewController{
  func setDefaultPosition() {
    /*制約のconstantをデフォルトにする*/
    slideViewCenterXConstraint.constant = self.view.frame.height
    halfMainViewHeightConstraint.constant = 300
    self.view.layoutIfNeeded()
  }

  func nobiro() {
    //制約のconstantを画面の高さ*0.8にする
    halfMainViewHeightConstraint.constant = self.view.frame.height * 0.8
    //制約をアニメーションさせながら更新
    UIView.animate(withDuration: 0.2) {
      self.view.layoutIfNeeded()
    }
  }

  func chijime() {
    //制約のconstantを300にする
    halfMainViewHeightConstraint.constant = 300
    //制約をアニメーションさせながら更新
    UIView.animate(withDuration: 0.2) {
      self.view.layoutIfNeeded()
    }
  }

}
