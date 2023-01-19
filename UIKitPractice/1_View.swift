//
//  ViewController.swift
//  UIKitPractice
//
//  Created by saint on 2023/01/17.
//

import UIKit
import SnapKit
import Then

class View: UIViewController {
    
    // MARK: - Properties
    private let recView = UIView().then{
        $0.backgroundColor = .green
        $0.alpha = 1
        $0.clipsToBounds = true
    }
    
    private let recView2 = UIView().then{
        $0.backgroundColor = .blue
        $0.alpha = 0.5
    }
    
    private let button = UIButton().then{
        $0.backgroundColor = .white
        $0.setTitle("버튼입니다.", for: .normal)
        $0.setTitleColor(.red, for: .normal)
        $0.setTitleColor(.blue, for: .selected)
        //$0.tintColor = .yellow
    }
    
    private let titleLabel = UILabel().then{
        $0.text = "UIView입니다."
    }

    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        // Do any additional setup after loading the view.
    }
}

extension View{
    private func setLayout(){
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(recView)
        recView.addSubview(recView2)
        
        recView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(200)
            $0.leading.equalToSuperview().offset(100)
            $0.trailing.equalToSuperview().offset(-100)
            $0.bottom.equalToSuperview().offset(-200)
        }
        
        recView2.snp.makeConstraints{
            $0.top.equalToSuperview().offset(200)
            $0.leading.equalToSuperview().offset(100)
            $0.width.equalTo(300)
            $0.height.equalTo(400)
        }
        
        titleLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
}

