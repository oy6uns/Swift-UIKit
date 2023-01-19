//
//  KeyboardAction.swift
//  UIKitPractice
//
//  Created by saint on 2023/01/20.
//

//import Foundation
//
//private func setKeyboardLocation() {
//    /// 등록
//    NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShown(_:)),name: UIResponder.keyboardWillShowNotification, object: nil)
//    NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillBeHidden(_:)),name: UIResponder.keyboardWillHideNotification, object: nil)
//}
//
///// 키보드가 보일때 화면을 위로 100 만큼 올린다.
//@objc func keyboardWillShown(_ notificiation: NSNotification) {
//  self.view.frame = CGRect(x: 0, y: -100, width: self.view.frame.size.width, height: self.view.frame.size.height)
//}
// 
///// 키보드가 사라질때 화면을 다시 원복한다.
//@objc func keyboardWillBeHidden(_ notification: NSNotification) {
//  self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
//}
