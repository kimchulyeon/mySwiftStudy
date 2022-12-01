/**
    📆 2022-12-01
        - 커맨드 + 쉬프트 + L 로 객체 생성 (storyboard reference | viewController)
        - Main.storyboard에 ViewController 여러개 추가 :  ViewController에서 Custom Class 랑 Module 연결
        - Storyboard Reference를 사용해서 스토리보드를 분리
        - 스트로보드로 delegate 설정 방법 : 객체를 생성하면 오른쪽 클릭을 해보자 : delegate....
        - 코드로 delegate 설정 방법 : viewDidLoad 안에 해당객체.delegate = self
 */

import UIKit

class UITextInputViewController: UIViewController {

    @IBOutlet weak var inputField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delegate 설정
        inputField.delegate = self
        
    }
}


// DELEGATE
extension UITextInputViewController: UITextFieldDelegate {

    // 텍스트를 편집할 때마다 실행 : shouldChangeCharactersIn
    // return true : 반영
    // return false : 반영 ❌
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(#function)
        return true
    }
    
    // 리턴키를 눌렀을 때
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // 키보드 사라지게
        return true
    }
    
    
}
