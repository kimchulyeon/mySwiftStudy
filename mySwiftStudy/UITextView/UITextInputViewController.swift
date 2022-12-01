/**
    📆 2022-12-01
        - 커맨드 + 쉬프트 + L 로 객체 생성 (storyboard reference | viewController)
        - 1️⃣ Main.storyboard에 ViewController 여러개 추가 :  ViewController에서 Custom Class 랑 Module 연결
        - 2️⃣ Storyboard Reference를 사용해서 스토리보드를 분리
        
        - 1️⃣ 스토리보드로 delegate 설정 방법 : 객체를 생성하면 오른쪽 클릭을 해보자 : delegate....
        - 2️⃣ 코드로 delegate 설정 방법 : viewDidLoad 안에 해당객체.delegate = self
 
        - 다른씬에 있는 라벨을 inputField 값으로 변경
            - 위임하는 주체에 delegate 추가
 */

import UIKit

class UITextInputViewController: UIViewController {
    
    // 커스텀 프로토콜
    var delegate: LabelInputConnectDelegate?

    @IBOutlet weak var labelChangeButton: UIButton!
    @IBOutlet weak var inputField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delegate 설정
        inputField.delegate = self
        
    }
    
    // 라벨 변경 버튼 클릭
    @IBAction func onClickLabelChangeButton(_ sender: Any) {
        delegate?.inputConnect(self, didInput: inputField.text)
        dismiss(animated: true, completion: nil)
    }
    
    // 취소 버튼 클릭
    @IBAction func onClickCancelButton(_ sender: Any) {
        print("취소 클릭#######")
        delegate?.inputConnectCancel(self) // DelegatePatternViewController.swift에 LabelInputConnectDelegate에 inputConnectCancel 함수 실행
        dismiss(animated: true, completion: nil)
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
