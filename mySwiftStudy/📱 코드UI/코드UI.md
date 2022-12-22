# 코드UI


🥑 순서

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

