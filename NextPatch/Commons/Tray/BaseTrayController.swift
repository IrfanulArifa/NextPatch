//
//  BaseTrayController.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 05/08/25.
//

import UIKit

protocol BaseTrayDelegate: AnyObject {
    var containerView: UIView! { get set }
    var backgroundView: UIView! { get set }
}

class BaseTrayViewController: UIViewController {
    
    weak var trayDelegate: BaseTrayDelegate?
    public var onTapBackgroundView: (() -> Void)? = nil
    public var onSwipeDown: (() -> Void)? = nil

    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.modalPresentationStyle = .overCurrentContext
        prepareSetupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareSetupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard trayDelegate != nil else { return }
        
        UIView.animate(withDuration: 0.25) { [weak self] in
            self?.trayDelegate?.backgroundView.layer.backgroundColor = UIColor.black.withAlphaComponent(0.6).cgColor
            self?.trayDelegate?.containerView.transform = CGAffineTransform(translationX: 0, y: 0)
            self?.trayDelegate?.containerView.alpha = 1
        }
    }
}

extension BaseTrayViewController {
    func prepareSetupUI() {
        guard let trayDelegate = trayDelegate else { return }
        let height = trayDelegate.containerView.frame.height
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissPage))
        trayDelegate.backgroundView.addGestureRecognizer(tap)
        
        trayDelegate.backgroundView.layer.backgroundColor = UIColor.black.withAlphaComponent(0).cgColor
        trayDelegate.containerView.transform = CGAffineTransform(translationX: 0, y: height)
        trayDelegate.containerView.alpha = 0
    }
    
    @objc
    func dismissPage() {
        guard let trayDelegate = trayDelegate else { return }
        let height = trayDelegate.containerView.frame.height
        UIView.animate(withDuration: 0.25) { [weak self] in
            self?.trayDelegate?.backgroundView.layer.backgroundColor = UIColor.black.withAlphaComponent(0).cgColor
            self?.trayDelegate?.containerView.transform = CGAffineTransform(translationX: 0, y: height)
            self?.trayDelegate?.containerView.alpha = 0
        } completion: { [weak self] _ in
            self?.dismiss(animated: false) {
                self?.onTapBackgroundView?()
            }
        }
    }
}
