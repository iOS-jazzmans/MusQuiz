//
//  OptionTableViewCell.swift
//  MusQuiz
//
//  Created by Konstantin Grachev on 14.02.2023.
//

import UIKit

//protocol OptionTableViewCellDelegate: AnyObject {
//    func getOption(optionText: String) -> AnswerType?
//}

class OptionTableViewCell: UITableViewCell {

    static let cellId = "OptionTableViewCell"

//    weak var delegate: OptionTableViewCellDelegate?
    
    //MARK: - constants
    private enum Constants {
        static let sideIndentation: CGFloat = 20
        static let optionButtonSpacing: CGFloat = 5
        static let correctAnswerColor: UIColor = .systemGreen.withAlphaComponent(0.8)
        static let wrongAnswerColor: UIColor = .systemRed.withAlphaComponent(0.8)

    }
    
    //MARK: - UI
    
    private lazy var optionButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .buttonTitle()
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.backgroundColor = backgroundColorForButton
        button.layer.cornerRadius = cornerRadius
        button.addTarget(self, action: #selector(optionButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK: - properties
    private var cellOptionText: String?
    
    //MARK: - initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        optionButton.backgroundColor = backgroundColorForButton
    }
    
    func configure(optionText: String) {
        cellOptionText = optionText
        optionButton.setTitle(cellOptionText, for: .normal)
    }
    
    @objc private func optionButtonTapped() {
        print(#function)
//        guard let cellOptionText = cellOptionText else { return }
        
//        let answerType = delegate?.getOption(optionText: cellOptionText)
        
//        switch answerType {
//        case .correct:
//            optionButton.backgroundColor = Constants.correctAnswerColor
//        case .wrong:
//            optionButton.backgroundColor = Constants.wrongAnswerColor
//        case .none:
//              break
//        }
    }
    
    //MARK: - setup views
    
    private func setupCellView() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.addSubview(optionButton)
    }
    
    //MARK: - set constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            optionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.sideIndentation),
            optionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.sideIndentation),
            optionButton.topAnchor.constraint(equalTo: topAnchor, constant: Constants.optionButtonSpacing),
            optionButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.optionButtonSpacing)
        ])
    }
}
