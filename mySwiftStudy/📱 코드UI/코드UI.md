# 코드UI
---
목차

[1. 기본 순서](#🥑-순서)

[2. UIButton](#🥑-uibutton)

[3. 커스텀 클래스 버튼](#🥑-커스텀-클래스-버튼)


#### 🥑 순서

 (1) 요소 생성
```
private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "제목"
    label.font = UIFont(name: "Avenir-Light", size: 30)
    label.textColor = UIColor(white: 1, alpha: 0.8)
    return label
}

override func viewDidLoad ...
```

(2) 요소 레이아웃 잡기
```
override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubView(titleLabel)
    titleLabel.traslatesAutoresizingMaskIntoConstraints = false
    titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constraint: 10).isActive = true
    titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
}
```
---

#### 🥑 UIButton

```
private lazy var goToSignUpPageButton: UIButton = {
	// 📌 버튼 타입을 설정해서 생성
	let button = UIButton(type: .system)
	
	// 📌 속성 설정  
	let attributedTitle = NSMutableAttributedString(string: "Don't have an account? ", attributes: [
		NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
		NSAttributedString.Key.foregroundColor: UIColor.lightgray
	])
	
	// 📌 기존 속성에 설정 추가
	attributedTitle.append(NSAttributedString(string: " Sign up", attributes: [
		NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
		NSAttributedString.Key.foregroundColor: UIColor.gray
	]))
	
	// 📌 버튼 클릭 이벤트 | 방식 설정
	button.addTarget(self, action: #selector(onShowSignupPage), for: .touchUpInside)
	// 📌 버튼에 속성 추가
	button.setAttributedTitle(attributedTitle, for: .normal)
	return button
}
```

#### 🥑 커스텀 클래스 버튼
```
// 📌 커스텀 클래스 버튼 생성
import UIKit

class AuthButton: UIButton {
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
		backgroundColor = UIColor.lightgray
		layer.cornerRadius = 5
		titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
```

// 📌 커스텀 클래스 버튼 사용
```
private lazy var loginButton: AuthButton = {
	let button = AuthButton(type: .system)
	button.setTitle("Log In", for: .normal)
	button.addTarget(self, action: #selector(onLogin), for: .touchUpInside)
	return button
}
```
