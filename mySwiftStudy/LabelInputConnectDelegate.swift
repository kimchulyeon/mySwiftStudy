/**
π 2022-12-01
    - μ»€μ€ν νλ‘ν μ½ μ μΈ
 */

import UIKit

protocol LabelInputConnectDelegate {
    // λΈλ¦¬κ²μ΄νΈλ‘ μλ ₯ν κ°μ μ λ¬
    func inputConnect(_ vc: UIViewController, didInput value: String?)
    
    // κ°μ μλ ₯νμ§ μκ³  μ·¨μνμ λ
    func inputConnectCancel(_ vc: UIViewController)
}
