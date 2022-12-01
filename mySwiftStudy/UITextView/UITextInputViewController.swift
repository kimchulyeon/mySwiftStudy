/**
    📆 2022-12-01
        - 커맨드 + 쉬프트 + L 로 객체 생성 (storyboard reference | viewController)
        - Main.storyboard에 ViewController 여러개 추가 :  ViewController에서 Custom Class 랑 Module 연결
        - Storyboard Reference를 사용해서 스토리보드를 분리
 */

import UIKit

class UITextInputViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("연결 성공")
    }
}
