/**
📆 2022-12-01
    - 커스텀 프로토콜 선언
 */

import UIKit

protocol LabelInputConnectDelegate {
    // 델리게이트로 입력한 값을 전달
    func inputConnect(_ vc: UIViewController, didInput value: String?)
    
    // 값을 입력하지 않고 취소했을 때
    func inputConnectCancel(_ vc: UIViewController)
}
