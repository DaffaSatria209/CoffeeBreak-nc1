//
//  MainViewController.swift
//  CoffeeBreak
//
//  Created by Daffa Satria on 03/05/21.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBgm(sound: "CoffeeBreakTheme", type: "mp3", loop: 10)
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var Logo: UILabel!
    @IBOutlet weak var PlayBtn: UIButton!
    @IBOutlet weak var bar: UIImageView!
    @IBOutlet weak var Vending: UIImageView!
    @IBOutlet weak var BuyBtn: UIButton!
    
    //MARK: Play Button
    @IBAction func PlayBtnOnTap(_ sender: UIButton) {
        UIView.animate(withDuration: 1, animations: {self.Vending.transform = CGAffineTransform (scaleX: 1.4, y: 1.4) }
        )
        UIView.animate(withDuration: 1, animations: {self.bar.transform = CGAffineTransform (scaleX: 1.4, y: 1.4
        )})
        UIView.animate(withDuration: 1, animations: {self.PlayBtn.transform = CGAffineTransform (translationX: 1, y: 500)}
        )
        UIView.animate(withDuration: 1, animations: {self.Logo.transform = CGAffineTransform (translationX: 1, y: -200)})
        self.BuyBtn.isHidden = false
        self.BuyBtn.alpha = 0
        
        UIView.animate(withDuration: 1,delay: 0.25, animations: {self.BuyBtn.alpha = 1})
        
        self.AdsAnimation.isHidden = false
        self.AdsAnimation.alpha = 0
        UIView.animate(withDuration: 1,delay: 0.5 ,animations: {self.AdsAnimation.alpha = 1})
        StartAdsAnimation()
        
    }
    
    //MARK: Buy Button
    @IBAction func BuyBtn(_ sender: UIButton) {
        self.PopUp_Menu.isHidden = false
        self.PopUp_Menu.alpha = 0
        UIView.animate(withDuration: 1, animations: {self.PopUp_Menu.alpha = 1})
        
        self.BlackBtn.isHidden = false
        self.CoffeeCreamBtn.isHidden = false
        self.LatteBtn.isHidden = false
        self.FlatWhiteBtn.isHidden = false
        
        self.BlackBtn.alpha = 0
        self.CoffeeCreamBtn.alpha = 0
        self.LatteBtn.alpha = 0
        self.FlatWhiteBtn.alpha = 0
        
        UIView.animate(withDuration: 1, animations: {self.BlackBtn.alpha = 1})
        UIView.animate(withDuration: 1, animations: {self.CoffeeCreamBtn.alpha = 1})
        UIView.animate(withDuration: 1, animations: {self.LatteBtn.alpha = 1})
        UIView.animate(withDuration: 1, animations: {self.FlatWhiteBtn.alpha = 1})
        
    }
    
    
    //MARK: Animation for Advertisement Screen
    
    
    @IBOutlet weak var AdsAnimation: UIImageView!
    
    func StartAdsAnimation(){
        AdsAnimation.animationImages = (1...27).map({index in return UIImage(named: "frame\(index)") ?? UIImage()
            
        })
        AdsAnimation.animationRepeatCount = 10
        AdsAnimation.animationDuration = 8
        AdsAnimation.startAnimating()
    }
    
    
    // MARK: Choosing Menu
    var coffeeChoosen: String = ""
    
    @IBOutlet weak var PopUp_Menu: UIImageView!
    @IBOutlet weak var LatteBtn: UIButton!

    @IBOutlet weak var CoffeeCreamBtn: UIButton!
    @IBOutlet weak var BlackBtn: UIButton!
    
    @IBOutlet weak var FlatWhiteBtn: UIButton!
    
    @IBOutlet weak var ContinueDidTapBtn: UIButton!
    @IBAction func CoffeeDidTap (_ sender: UIButton)
    {
        if sender == LatteBtn{
            hideChoosingMenu()
            animatePayment()
            ContinueDidTapBtn.isHidden = false
            coffeeChoosen = "Latte2D_"
            CoffeeFlavour = "LatteCoffee_Can"
            //animateCoffeeClaim
            
        }else if sender == CoffeeCreamBtn{
            hideChoosingMenu()
            animatePayment()
            ContinueDidTapBtn.isHidden = false
            coffeeChoosen = "CreamCoffee2D_"
            CoffeeFlavour = "CreamCoffee_Can"
            //animateCoffeeClaim
            
        }else if sender == BlackBtn{
            hideChoosingMenu()
            animatePayment()
            ContinueDidTapBtn.isHidden = false
            coffeeChoosen = "Ambil Minuman 2D_"
            CoffeeFlavour = "BlackCoffee_Can"
            //animateCoffeeClaim()
            
        }else if sender == FlatWhiteBtn{
            hideChoosingMenu()
            animatePayment()
            ContinueDidTapBtn.isHidden = false
            coffeeChoosen = "FlatWhiteCoffee2D_"
            CoffeeFlavour = "Flatwhite_Can"
            //animateCoffeeClaim()
        }
        
        
    }
    
    
    func hideChoosingMenu (){
        self.BlackBtn.isHidden = true
        self.CoffeeCreamBtn.isHidden = true
        self.LatteBtn.isHidden = true
        self.FlatWhiteBtn.isHidden = true
        self.PopUp_Menu.isHidden = true
        self.BuyBtn.isHidden = true
        
        UIView.animate(withDuration: 1, animations: {self.BlackBtn.alpha = 0})
        UIView.animate(withDuration: 1, animations: {self.CoffeeCreamBtn.alpha = 0})
        UIView.animate(withDuration: 1, animations: {self.LatteBtn.alpha = 0})
        UIView.animate(withDuration: 1, animations: {self.FlatWhiteBtn.alpha = 0})
        UIView.animate(withDuration: 1, animations: {self.PopUp_Menu.alpha = 0})
        
        UIView.animate(withDuration: 1, animations: {self.BuyBtn.alpha = 0
        })
        
    }
    
    //MARK: PaymentAnimation
    
    @IBOutlet weak var ContinuePaymentDidTap: UIButton!
    @IBOutlet weak var CoinPaymentAnimated: UIImageView!
    
    
    func animatePayment() {
        CoinPaymentAnimated.isHidden = false
        CoinPaymentAnimated.animationImages = (1...10).map({index in return UIImage(named: "CoinPaymentAnimated_\(index)") ?? UIImage()
            
        })
        CoinPaymentAnimated.animationDuration = 1
        CoinPaymentAnimated.animationRepeatCount = 1
        
        
    }
    
    
    
    //MARK: PaymentDidTap (Start Animation)
    
    @IBAction func ContinuePayDidTap(_ sender: UIButton) {
        CoinPaymentAnimated.startAnimating()

        UIView.animate(withDuration: 1, delay: 1, animations: {self.CoinPaymentAnimated.alpha = 0})
        
        ContinueDidTapBtn.isHidden = true
        UIView.animate(withDuration: 1, delay: 1 ,animations: {self.ContinueDidTapBtn.alpha = 0
        })
        
        CutsceneFrame.isHidden = false
        CutsceneFrame.alpha = 0
        ClaimDrink.isHidden = false
        ClaimDrink.alpha = 0
        
        UIView.animate(withDuration: 1,delay: 2, animations: {self.CutsceneFrame.alpha = 1})
        
        UIView.animate(withDuration: 1,delay: 2, animations: {self.ClaimDrink.alpha = 1}
                       
        
        )
        animateCoffeeClaim()
        GetDrink()
        
    }
    
   
    
    
    //MARK: CoffeeClaimAnimation
    @IBOutlet weak var CutsceneFrame: UIImageView!
    @IBOutlet weak var ClaimDrink: UIImageView!
    
    func animateCoffeeClaim() {
        ClaimDrink.animationImages = (1...8).map({index in
            print(coffeeChoosen)
            return UIImage(named: "\(coffeeChoosen)\(index)" ) ?? UIImage()
        })
        ClaimDrink.animationDuration = 2
        ClaimDrink.animationRepeatCount = 2
        ClaimDrink.startAnimating()
        
        
        //ifnya bedain pake nama file awalnya
        
    }
    
    //MARK: ShowCoffee
    var CoffeeFlavour = ""
    
    @IBOutlet weak var CoffeeCan: UIImageView!
    
    @IBOutlet weak var SupportiveWord: UILabel!
    
    @IBOutlet weak var TapToDrinkBtn: UIButton!
    
    func GetDrink(){
        UIView.animate(withDuration: 1, delay: 5,animations: {self.CutsceneFrame.transform = CGAffineTransform (scaleX: 1.5, y: 1.5)})
        
        CoffeeCan.alpha = 0
        CoffeeCan.isHidden = false
        CoffeeCan.image = UIImage(named: CoffeeFlavour)
        
        UIView.animate(withDuration: 1, delay: 6, animations: {self.CoffeeCan.alpha = 1})
        
        TapToDrinkBtn.alpha = 0
        TapToDrinkBtn.isHidden = false
        UIView.animate(withDuration: 1,delay: 6, animations: {self.TapToDrinkBtn.alpha = 1})
        
        
        }
    
    
    
    @IBAction func DrinkDidTap(_ sender: UIButton) {
        
        CoffeeCan.isHidden = false
        UIView.animate(withDuration: 1, animations: {self.CoffeeCan.alpha = 0})
        
        SupportiveWord.alpha = 0
        
        UIView.animate(withDuration: 1,delay: 4, animations: {self.SupportiveWord.alpha = 1})
        SupportiveWord.isHidden = false
        
        var SupportWords: [String] = ["You can do it!", "You can pull it trought!", "You are breathtaking!", "Coffee know you are doing your best~", "It's okay to celebrate everything including failures", "Don't let dream be a dream", "Just Do It!", "Good things take times", "You know oldman,said always look into the bright side", "Never Gonna Give You Up"]
        
        SupportWords.shuffle()
        
        self.SupportiveWord.text = SupportWords[0]
        
        TapToDrinkBtn.isHidden = true
        CutsceneFrame.transform.scaledBy(x: -1.5, y: -1.5)
        UIView.animate(withDuration: 1,delay: 5, animations: {self.CutsceneFrame.alpha = 0})
        UIView.animate(withDuration: 1,delay: 6, animations: {self.SupportiveWord.alpha = 0})
        
        BuyBtn.alpha = 0
        UIView.animate(withDuration: 2,delay: 6, animations: {self.BuyBtn.alpha = 1})
        BuyBtn.isHidden = false
    }
    
    
    //MARK: Background Music
    var audioPlayer: AVAudioPlayer?
    var audioPlayer2: AVAudioPlayer?
    
    func playBgm(sound:String, type: String, loop:Int){
        if let path = Bundle.main.path(forResource: sound, ofType: type){
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.numberOfLoops = loop
                audioPlayer?.play()
            }catch {print("Error: Couldn't find file and play sound file!")}
        }
    }
    
    /*func playSfx(sound:String, type: String, loop:Int,delay:Double){
        if let path = Bundle.main.path(forResource: sound, ofType: type){
            do{
                audioPlayer2 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer2?.play(atTime: delay)
                audioPlayer2?.numberOfLoops = loop
                audioPlayer2?.play()
            }catch {print("Error: Couldn't find file and play sound file!")}
        }
    }*/
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
