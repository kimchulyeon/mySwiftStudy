# μ½λUI
---
### π₯ μμ

 (1) μμ μμ±
```
private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "μ λͺ©"
    label.font = UIFont(name: "Avenir-Light", size: 30)
    label.textColor = UIColor(white: 1, alpha: 0.8)
    return label
}

override func viewDidLoad ...
```

(2) μμ λ μ΄μμ μ‘κΈ°
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

### π₯ UIButton

```
private lazy var goToSignUpPageButton: UIButton = {
	// π λ²νΌ νμμ μ€μ ν΄μ μμ±
	let button = UIButton(type: .system)
	
	// π μμ± μ€μ   
	let attributedTitle = NSMutableAttributedString(string: "Don't have an account? ", attributes: [
		NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
		NSAttributedString.Key.foregroundColor: UIColor.lightgray
	])
	
	// π κΈ°μ‘΄ μμ±μ μ€μ  μΆκ°
	attributedTitle.append(NSAttributedString(string: " Sign up", attributes: [
		NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
		NSAttributedString.Key.foregroundColor: UIColor.gray
	]))
	
	// π λ²νΌ ν΄λ¦­ μ΄λ²€νΈ | λ°©μ μ€μ 
	button.addTarget(self, action: #selector(onShowSignupPage), for: .touchUpInside)
	// π λ²νΌμ μμ± μΆκ°
	button.setAttributedTitle(attributedTitle, for: .normal)
	return button
}
```

### π₯ μ»€μ€ν ν΄λμ€ λ²νΌ
```
// π μ»€μ€ν ν΄λμ€ λ²νΌ μμ±
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

// π μ»€μ€ν ν΄λμ€ λ²νΌ μ¬μ©
```
private lazy var loginButton: AuthButton = {
	let button = AuthButton(type: .system)
	button.setTitle("Log In", for: .normal)
	button.addTarget(self, action: #selector(onLogin), for: .touchUpInside)
	return button
}
```
