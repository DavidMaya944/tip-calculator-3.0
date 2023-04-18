//
//  CalculatorViewController.swift
//  tip-calculator-3.0
//
//  Created by David Jesús Maya Quirós on 18/04/2023.
//

import UIKit
import Combine
import CombineCocoa
import SnapKit

class CalculatorViewController: UIViewController {
   
    @IBOutlet var vStackView: UIStackView!
    
    private let logoViewController = LogoViewController()
//    private let resultViewController = ResultViewController()
//    private let billInputViewController = BillInputViewController()
//    private let tipInputViewController = TipInputViewController()
//    private let splitInputViewController = SplitInputViewController()
//    private let viewModel = CalculatorViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    private lazy var viewTapPublisher: AnyPublisher<Void, Never> = {
        let tapGesture = UITapGestureRecognizer(target: self, action: nil)
        view.addGestureRecognizer(tapGesture)
        return tapGesture.tapPublisher.flatMap { _ in
            Just(())
        }.eraseToAnyPublisher()
    }()
    
    private lazy var logoViewTapPublisher: AnyPublisher<Void, Never> = {
        let tapGesture = UITapGestureRecognizer(target: self, action: nil)
        tapGesture.numberOfTapsRequired = 2
        logoViewController.hStackView.gestureRecognizerShouldBegin(tapGesture)
        return tapGesture.tapPublisher.flatMap { _ in
            Just(())
        }.eraseToAnyPublisher()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        layout()
        observe()
    }
    
    private func observe() {
        viewTapPublisher.sink { [unowned self] value in
            view.endEditing(true)
        }.store(in: &cancellables)
    }
    
    private func layout() {
        view.backgroundColor = ThemeColor.bg
        view.addSubview(vStackView)
    }
    
    private func configureView() {
        vStackView = UIStackView(arrangedSubviews: [
            logoViewController.view
        ])
    }
}
