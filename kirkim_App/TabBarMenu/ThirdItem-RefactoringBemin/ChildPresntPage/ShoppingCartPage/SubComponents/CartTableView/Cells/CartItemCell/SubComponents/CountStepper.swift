//
//  CountStepper.swift
//  kirkim_App
//
//  Created by 김기림 on 2022/05/10.
//

import UIKit
import RxSwift
import RxCocoa

class CountStepper: UIView {
    private let minusButton = UIButton()
    private let plusButton = UIButton()
    private let countLabel = UILabel()
    private let disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        attribute()
        layout()

    }
    
    func bind(_ viewModel: CountStepperViewModel) {
        self.plusButton.rx.tap
            .map { 1 }
            .bind(to: viewModel.buttonClicked)
            .disposed(by: disposeBag)
        
        self.minusButton.rx.tap
            .map { -1 }
            .bind(to: viewModel.buttonClicked)
            .disposed(by: disposeBag)
        
        viewModel.totalCount
            .bind { value in
                self.countLabel.text = "\(value)"
            }
            .disposed(by: disposeBag)
    }
    
    private func attribute() {
        self.minusButton.setImage(UIImage(systemName: "minus"), for: .normal)
        self.minusButton.tintColor = .black
        self.plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        self.plusButton.tintColor = .black
        self.countLabel.text = "1"
        self.countLabel.textAlignment = .center
        
    }
    
    private func layout() {
        [minusButton, countLabel, plusButton].forEach {
            self.addSubview($0)
        }
        
        minusButton.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.3)
        }
        
        countLabel.snp.makeConstraints {
            $0.leading.equalTo(minusButton.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.4)
        }
        
        plusButton.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.3)
        }
    }
}
