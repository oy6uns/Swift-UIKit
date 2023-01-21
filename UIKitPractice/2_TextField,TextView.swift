//
//  2_TextField,TextView.swift
//  UIKitPractice
//
//  Created by saint on 2023/01/20.
//

import UIKit
import SnapKit
import Then

class TextFieldView: UIViewController{
    
    // MARK: - Properties
    private let questionLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.text = "아래 빈칸을 채워주세요!"
    }
    
    private let titleletterNumLabel = UILabel().then {
        $0.text = "0/25"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .systemGray4
        $0.textAlignment = .right
    }
    
    private let titleTextField = UITextField().then{
        $0.borderStyle = .none
        $0.layer.borderColor = UIColor.clear.cgColor
        $0.layer.borderWidth = 1
        $0.backgroundColor = .clear
        $0.placeholder = "제목을 입력해주세요."
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .systemGray4
    }
    
    private let editImage = UIImageView().then {
        $0.image = UIImage(named: "editBtn")
        $0.contentMode = .scaleToFill
        $0.backgroundColor = .clear
    }
    
    private let titleUnderLine = UIView().then{
        $0.backgroundColor = .systemCyan
    }

    let placeholder = "내용을 적어주세요!"
    
    let infoTextView = UITextView().then {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .systemGray4
        $0.layer.cornerRadius = 12
        $0.layer.borderColor = UIColor.systemGreen.cgColor
        $0.layer.borderWidth = 1
        $0.backgroundColor = .clear
        $0.textContainerInset = UIEdgeInsets(top: 14.adjustedH, left: 12.adjustedW, bottom: 14.adjustedH, right: 12.adjustedW)
    }
    
    let detailletterNumLabel = UILabel().then {
        $0.text = "0/300"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .systemGray4
        $0.textAlignment = .right
    }
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setLayout()
        setupTextView()
        setupTextField()
        setKeyboardLocation()
    }
    
    // MARK: - Function
    private func setupTextView() {
        infoTextView.delegate = self
        infoTextView.returnKeyType = .done
        infoTextView.text = placeholder /// 초반 placeholder 생성
        infoTextView.textColor = .systemGray4 /// 초반 placeholder 색상 설정
    }
    
    private func setupTextField() {
        titleTextField.delegate = self
        titleTextField.returnKeyType = .done
    }
    
    private func setKeyboardLocation() {
        /// 등록
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShown(_:)),name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillBeHidden(_:)),name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    /// 키보드가 보일때 화면을 위로 100 만큼 올린다.
    @objc func keyboardWillShown(_ notificiation: NSNotification) {
      self.view.frame = CGRect(x: 0, y: -100, width: self.view.frame.size.width, height: self.view.frame.size.height)
    }
     
    /// 키보드가 사라질때 화면을 다시 원복한다.
    @objc func keyboardWillBeHidden(_ notification: NSNotification) {
      self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
    }
}


extension TextFieldView{
    
    // MARK: - Layout
    private func setLayout(){
        view.addSubViews([questionLabel, titleletterNumLabel, titleTextField, editImage, titleUnderLine,
                          infoTextView, detailletterNumLabel])
        view.backgroundColor = .white
        
        questionLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(140.adjustedH)
            $0.leading.equalToSuperview().offset(16.adjustedW)
        }
        
        /// 만약, leading으로 autolayout을 잡게 되면, ???/300에서 ???의 자릿수가 바뀔 때 글자수를 세는 text가 움직일 수 있기 때문에, trailing으로 잡아줍니다!
        titleletterNumLabel.snp.makeConstraints {
            $0.top.equalTo(titleUnderLine.snp.bottom).offset(3.adjustedH)
            $0.trailing.equalToSuperview().offset(-20.adjustedW)
        }
        
        titleTextField.snp.makeConstraints{
            $0.top.equalTo(questionLabel.snp.bottom).offset(34.adjustedH)
            $0.leading.equalToSuperview().offset(18.adjustedW)
            $0.trailing.equalToSuperview().offset(-40.adjustedW)
            $0.height.equalTo(32.adjustedH)
        }
        
        editImage.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-18.adjustedW)
            $0.centerY.equalTo(titleTextField)
            $0.width.equalTo(17.adjustedW)
            $0.height.equalTo(17.adjustedH)
        }
        
        titleUnderLine.snp.makeConstraints{
            $0.top.equalTo(titleTextField.snp.bottom).offset(5.adjustedH)
            $0.leading.equalToSuperview().offset(16.adjustedW)
            $0.trailing.equalToSuperview().offset(-16.adjustedW)
            $0.height.equalTo(1)
        }
        
        infoTextView.snp.makeConstraints{
            $0.top.equalTo(titleUnderLine.snp.bottom).offset(38.adjustedH)
            $0.leading.equalToSuperview().offset(16.adjustedW)
            $0.trailing.equalToSuperview().offset(-16.adjustedW)
            $0.height.equalTo(314.adjustedH)
        }
        
        /// 만약, leading으로 autolayout을 잡게 되면, ???/300에서 ???의 자릿수가 바뀔 때 글자수를 세는 text가 움직일 수 있기 때문에, trailing으로 잡아줍니다!
        detailletterNumLabel.snp.makeConstraints{
            $0.bottom.equalTo(infoTextView.snp.bottom).offset(-16.adjustedH)
            $0.trailing.equalTo(infoTextView.snp.trailing).offset(-16.adjustedW)
        }
    }
}

// MARK: - UITextFieldDelegate
extension TextFieldView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.becomeFirstResponder()
        return true
    }
    
    /// 글자수 25자 이하로 제한
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let char = string.cString(using: String.Encoding.utf8) {
            /// backSpace는 글자수 제한이 걸려도 눌릴 수 있게 해줌
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {
                return true
            }
        }
        guard textField.text!.count < 25 else { return false }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textField.text = nil
            textField.textColor = .systemCyan /// 텍스트 개수가 0일 경우에는 글자 수 표시 색상이 모두 gray 색이게 설정
       }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        /// 글자 수 부분 색상 변경 및 글자 수 표시
        let attributedString = NSMutableAttributedString(string: "\(titleTextField.text!.count)/25")
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemCyan, range: ("\(titleTextField.text!.count)/25" as NSString).range(of:"\(titleTextField.text!.count)"))
        titleletterNumLabel.attributedText = attributedString
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || textField.text == placeholder {
            titleletterNumLabel.textColor = .systemGray4 /// 텍스트 개수가 0일 경우에는 글자 수 표시 색상이 모두 gray 색이게 설정
            titleletterNumLabel.text = "0/25"
        }
    }
}

// MARK: - UITextViewDelegate
extension TextFieldView: UITextViewDelegate {

    func textViewDidBeginEditing(_ textView: UITextView) {
        /// 플레이스홀더
        if textView.text == placeholder {
            infoTextView.textColor = .systemGreen
            infoTextView.text = nil
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        /// 글자 수 제한
        if infoTextView.text.count > 300 {
            infoTextView.deleteBackward()
        }
        
        /// 아래 글자 수 표시되게 하기
        detailletterNumLabel.text = "\(infoTextView.text.count)/300"
        
        /// 글자 수 부분 색상 변경
        let attributedString = NSMutableAttributedString(string: "\(infoTextView.text.count)/300")
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemGreen, range: ("\(infoTextView.text.count)/300" as NSString).range(of:"\(infoTextView.text.count)"))
        detailletterNumLabel.attributedText = attributedString
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        /// 플레이스홀더
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            infoTextView.textColor = .systemGray4
            infoTextView.text = placeholder
            detailletterNumLabel.textColor = .systemGray4 /// 텍스트 개수가 0일 경우에는 글자 수 표시 색상이 모두 gray 색이게 설정
            detailletterNumLabel.text = "0/300"
        }
    }
}





