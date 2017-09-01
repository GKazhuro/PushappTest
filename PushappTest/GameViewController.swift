//
//  GameViewController.swift
//  PushappTest
//
//  Created by Георгий Кажуро on 31.08.17.
//  Copyright © 2017 Георгий Кажуро. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UIWebViewDelegate {
    
    var game: Game?
    @IBOutlet weak var webView: UIWebView! {
        didSet {
            webView.isHidden = true
        }
    }
    @IBOutlet weak var loadingLabel: UILabel! {
        didSet {
            loadingLabel.isHidden = false
        }
    }
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView! {
        didSet {
            loadingIndicator.startAnimating()
            loadingIndicator.isHidden = false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = game?.name
        
        webView.delegate = self
        self.webView.scrollView.isScrollEnabled = false
        
        /*
         
        При загрузке первой игры возникает проблема в случае если зайти в контроллер повторно:
        фрейм с игрой некорректно отображается. Если подозрение что проблема где-то в html,
        но если все-таки в контроллере или WebView, то хотелось бы узнать где :(
 
        */
        
        guard let path = Bundle.main.path(forResource: game?.indexLocation, ofType: "html") else { return }
        webView.loadRequest(URLRequest(url: URL(fileURLWithPath: path)))
    }
    
    // По завершению загрузки скрываем все ненужное
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        webView.isHidden = false
        loadingLabel.isHidden = true
        loadingIndicator.isHidden = true
    }

}
