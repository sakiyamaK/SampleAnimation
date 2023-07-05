//
//  Animation2ViewController.swift
//  SampleAnimation
//
//  Created by sakiyamaK on 2020/08/01.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

class Animation2ViewController: UIViewController {
    @IBOutlet private var animView1: UIView! {
        didSet {
            let g = UITapGestureRecognizer(target: self, action: #selector(tapAnimView1))
            animView1.addGestureRecognizer(g)
        }
    }

    @IBOutlet private var animView2: UIView! {
        didSet {
            let g = UITapGestureRecognizer(target: self, action: #selector(tapAnimView2))
            animView2.addGestureRecognizer(g)
        }
    }

    @IBOutlet private var animView3: UIView! {
        didSet {
            let g = UITapGestureRecognizer(target: self, action: #selector(tapAnimView3))
            animView3.addGestureRecognizer(g)
        }
    }

    private var isBGAnimed: Bool = false
    @IBOutlet private var animBGView: UIView! {
        didSet {
            let g = UITapGestureRecognizer(target: self, action: #selector(tapAnimView4))
            animBGView.addGestureRecognizer(g)
        }
    }

    @IBOutlet private var bluePositionConst: NSLayoutConstraint!
    @IBOutlet private var greenPositionConst: NSLayoutConstraint!
    @IBOutlet private var orangePositionConst: NSLayoutConstraint!
}

extension Animation2ViewController {
    @objc func tapAnimView1() {
        UIView.animate(withDuration: 1.0, animations: {
            self.animView1.backgroundColor = .systemBlue
        }) { _ in
            UIView.animate(withDuration: 1.0, animations: {
                self.animView1.backgroundColor = .systemPink
            })
        }
    }

    @objc func tapAnimView2() {
        UIView.animate(withDuration: 1.0, animations: {
            self.animView2.layer.cornerRadius = self.animView2.frame.height / 2
        }) { _ in
            UIView.animate(withDuration: 1.0, animations: {
                self.animView2.layer.cornerRadius = 0
            })
        }
    }

    @objc func tapAnimView3() {
        UIView.animate(withDuration: 1.0, animations: {
            self.animView3.alpha = 0
        }) { _ in
            UIView.animate(withDuration: 1.0, animations: {
                self.animView3.alpha = 1
            })
        }
    }

    @objc func tapAnimView4() {
        isBGAnimed.toggle()
        if isBGAnimed {
            // 制約の値を変える
            bluePositionConst.constant = 0

            // 0.5アニメーション
            UIView.animate(withDuration: 0.5, animations: {
                // 制約に基づいて更新する
                self.view.layoutIfNeeded()
            }) { _ in // アニメーションが終わったcompletion

                // 制約の値を変える
                self.greenPositionConst.constant = 0
                UIView.animate(withDuration: 0.5, delay: 0.1, animations: {
                    // 制約に基づいて更新する
                    self.view.layoutIfNeeded()
                }) { _ in // アニメーションが終わったcompletion

                    // 制約に基づいて更新する
                    self.orangePositionConst.constant = 0
                    UIView.animate(withDuration: 0.5, delay: 0.2, animations: {
                        // 制約に基づいて更新する
                        self.view.layoutIfNeeded()
                    })
                }
            }
        } else {
            bluePositionConst.constant = 300
            greenPositionConst.constant = 300
            orangePositionConst.constant = 300

            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
}
