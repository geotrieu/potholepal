//
//  TapView.swift
//  PotholePal
//
//  Created by Thayallan Srinathan on 2019-01-20.
//  Copyright © 2019 Thayallan Srinathan. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

protocol TapViewDelegate: class {
    func didTapView()
}


class TapView: UIView {
    weak var delegate: TapViewDelegate?
    
    private let contentView = UIView()
    let captureButton = UIButton().then {
        $0.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }
    
    @objc func handleButtonTap() {
        delegate?.didTapView()
    }
    
    init() {
        super.init(frame: .zero)
        
        
        contentView.backgroundColor = UI.Colors.purple
        
        addSubview(contentView)
        contentView.easy.layout(Edges())
        
        addSubview(captureButton)
        captureButton.easy.layout(Edges())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
