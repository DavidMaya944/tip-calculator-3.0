//
//  LogoViewController.swift
//  tip-calculator-3.0
//
//  Created by David Jesús Maya Quirós on 18/04/2023.
//

import UIKit

class LogoViewController: UIViewController {
    @IBOutlet var logoView: UIView!
    @IBOutlet var hStackView: UIStackView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var vStackView: UIStackView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func configureView() {
        hStackView = UIStackView(arrangedSubviews: [
            imageView,
            vStackView
        ])
        configureLabels()
        imageView = UIImageView(image: .init(named: "icCalculatorBw"))
        logoView?.addSubview(hStackView)
    }
    
    func configureLabels() {
        let textTopLabel = NSMutableAttributedString(
            string: LogoViewConstants().topLabel,
            attributes: [.font: ThemeFont.demibold(ofSize: 16)])
        textTopLabel.addAttributes([.font: ThemeFont.bold(ofSize: 24)], range: NSMakeRange(3, 3))
        topLabel.attributedText = textTopLabel
        
        bottomLabel = LabelFactory.build(text: LogoViewConstants().bottomLabel, font: ThemeFont.demibold(ofSize: 20), textAlignment: .left)
    }

}
