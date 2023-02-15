//
//  QuizView.swift
//  MusQuiz
//
//  Created by Konstantin Grachev on 14.02.2023.
//

import UIKit

final class QuizViewController: UIViewController {

    // MARK: - Internal properties
    var output: QuizViewOutput?
    
    //MARK: - constants
    
    private enum Constants {
        static let questionTextViewTopIndentation: CGFloat = 10
        static let questionTextViewSideIndentation: CGFloat = 20
        static let questionTextViewSideMultiplier: CGFloat = 0.8
        static let tableViewSideIndentation: CGFloat = 20
        static let heightForRowTableCell: CGFloat = 80
    }
    
    private let backgroundImageView = UIImageView(image: UIImage(named: backgroundImageViewName))
            
    private let questionTextView: VerticallyCenteredTextView = {
        let textView = VerticallyCenteredTextView()
        textView.backgroundColor = .clear
        textView.font = .primaryText()
        textView.textAlignment = .center
        return textView
    }()
    
    private let answersTableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let output = output else { return }
        setupUI()
        setDelegates()
        registerCell()
        output.viewDidLoad()
    }
    
    //MARK: - set delegates
    private func setDelegates() {
        answersTableView.delegate = self
        answersTableView.dataSource = self
    }
    
    //MARK: - register cell
    private func registerCell() {
        answersTableView.register(OptionTableViewCell.self, forCellReuseIdentifier: OptionTableViewCell.cellId)
    }
    
    //MARK: - SetupUI
    private func setupUI() {
        view.backgroundColor = .secondarySystemBackground
        let subviews = [backgroundImageView,
                        questionTextView,
                        answersTableView
        ]
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            questionTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.questionTextViewTopIndentation),
            questionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.questionTextViewSideIndentation),
            questionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.questionTextViewSideIndentation),
            questionTextView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.questionTextViewSideMultiplier)
        ])
        
        NSLayoutConstraint.activate([
            answersTableView.topAnchor.constraint(equalTo: questionTextView.bottomAnchor, constant: Constants.tableViewSideIndentation),
            answersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.tableViewSideIndentation),
            answersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.tableViewSideIndentation),
            answersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension QuizViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let answers = answers else { return 0 }
//        return answers.count
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = answersTableView.dequeueReusableCell(withIdentifier: OptionTableViewCell.cellId, for: indexPath) as? OptionTableViewCell else { return UITableViewCell() }
//              let answer = options?[indexPath.row]
        
        cell.configure(optionText: "answer")
        
//        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.heightForRowTableCell
    }
    
}

extension QuizViewController: QuizViewInput {
    func changeBackgroundColor(to color: UIColor) {
        view.backgroundColor = color
    }
}
