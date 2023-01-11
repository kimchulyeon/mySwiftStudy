# 📱 UIKit 공부

<< 목차 >>

- [SWIFT 문법](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-swift)
  - [클로져](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-클로져)
  - [Struct](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-struct)
    - [keyPath](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-keypath)
    - [method](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-method)
    - [mutationg method](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-mutating-method)
    - [init](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-init)
    - [getter setter](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-getter-setter)
    - [didSet willSet](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-didset-willset)
    - [static](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-static)
    - [제네릭 struct](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-제네릭-struct)
  - [프로토콜](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-프로토콜)
    - [제네릭 프로토콜](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-제네릭-프로토콜)
  - [이것저것](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-이것저것-기초)
  ---
  UIKit
  - [UIView](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-uiview)
  - [UIControl](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-uicontrol)
  - [@IBInspectable](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-ibinspectable)
  - [그림자](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-그림자)
  - [스택뷰](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-스택뷰)
  - [스택뷰활용](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-스택뷰-활용)
  - [커스텀뷰](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-커스텀뷰)
  - [스크롤뷰](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-스크롤뷰)
  - [제스쳐](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-제스쳐)
  - [그라데이션](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-그라데이션)
  - [UIAlertController](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-uialertcontroller)
  - [UIImageView](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-uiimageview)
  - [MapKit](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-mapkit)
    - [검색으로 핀 지정](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#4-mklocalsearch)
    - [테이블뷰 띄우기](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#5-검색-즉시-테이블뷰-띄우기)
    - [셀 생성](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#6-테이블뷰에-검색된-장소-데이터-넘겨주고-셀-생성)
  - [Daytour 하면서 배운 것들](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-daytour)
  - [TODO 하면서 배운 것들](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-todo)
  - [ETC](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-etc)

<br/>

## 🤖 UIView

### 1. superview > subview

subview들은 **배열**의 형태로 관리된다 : [subview]\()

### 2. frame - CGRect - CGPoint(x, y) : 위치 - CGSize(width, hegith) : 크기

**frame과 bounds의 차이**는 bounds는 CGSize만 다룬다 CGPoint의 값은 (0, 0)

### 3. view tagging

뷰의 tag 속성값으로 IBOutlet대신 해당 뷰에 접근할 수 있다.

```
@IBAction func changeColor(_ sender: Any) {
  if let v = view.viewWithTag(0) {
    v.backgroundColor = .black
  }
}
```

### 4. touch event

interaction

- user interaction enabled
- multiple touch

### 5. etc

alpha : 투명도

hidden: 숨기기

clipsToBounds | masksToBounds : 뷰 프레임을 벗어난 부분

opaque : 겹치는 부분을 계산 (최적화)

clears graphics context : 이전 내용을 완전히 지워주는 작업 (최적화)

<br/>

## 🤖 UIControl

UIControl.state (normal, highlighted, dsabled, selected, focused, ...)

target-action 패턴 : **addTarget(self, action:, for:)**

```
loginButton.addTarget(self, action: #selctor(loginHandler), for: .touchUpInside)
```

많이 쓰이는 .touchUpInside --- .valueChanged

<br/>

### 1. Button

#### 타입 : .system | .detailDisclosure | .infoLight | .infoDark | .addContact | .close | .custom

#### 상태 : .normal | .disabled | .focused | .highlighted | .selected

```
// 상태에 따라 라벨 텍스트 변경
@IBAction func report(_ sender: UIButton) {
  DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    self.titleLabel.text = sender.state.debugString // 📌 읽기 전용 state
  }
}

extension UIButton.State {
  var debugging: String {
    var list = [String]()
    if contains(.normal) {
      list.append("Normal")
    }
    if contains(.highlighted) {
      list.append("Highlighted")
    }
    ...
    return list.joined(", ")
  }
}


// 클릭된 segmented index에 따라 버튼 상태 변경
@IBAction func changeState(_ sender: UISegmentedControl) {
  switch sender.selectedSegmentIndex {
    case 0:
      button.isEnabled = true
      button.isHighlighted = false
      button.isSelected = false

    case 1:
      button.isEnabled.toggle()

    case 2:
      button.isHighlighed.toggle()

    case 3:
      button.isSelected = true

    default:
      break
  }

  return report(button)  // ⭐️⭐️⭐️ 위의 액션함수를 실행시켜서 라벨 텍스트 변경
}
```

#### 타이틀 : 다섯가지 상태에 따라 버튼의 타이틀을 설정해줄 수 있다

```
button.setTitle("노말", for: .normal)
button.setTitleColor(.systemBlue, for: .noraml)

button.setTitle("하이라이트", for: .highlighted)
button.setTitleColor(.systemYellow, for: .highlighted)
```

#### 버튼 이미지 : 이미지 위치 조정이 까다로워 스택뷰와 이미지, 라벨 위에 버튼을 사용하는게 좋다

```
button.setImage(UIImage(named: "plus-normal"), for: .normal)
```

#### 배경 이미지 : content mode가 조정되지 않으므로 버튼 이미지와 같은 방법으로 생성하는게 좋다

```
button.setBackgroundImage(UIImage(named: "plus-normal"), for: .normal)
```

<br/>

### 2. Switch

<br/>

### 3. Slider

#### 값의 범위 : value | minimum | maximum

#### 커스터마이징

```
let slider = UISlider()
let img = UImage(systemName: "lightbulb")

slider.setThumbImage(img, for .normal)
slider.minimumTrackTintColor = UIColor.systemRed
sldier.maximumTrackTinkColor = UIColor.black

slider.setMinimumTrackImage(image: for:)
slider.setMaximumTrackImage(image: for:)

slider.isContinuous = false // 손을 떼면 값을 변경
```

<br/>

### 4. Page Control

```
let pc = UIPageControl()

// 점 개수
pc.numberOfPages = 데이터배열.count
pc.currentPage = 0
pc.pageIndicatorTintColor = UIColor.systemGray3
pc.currentPageIndicatorTintColor = UIColor.systemBlue
```

#### 📌 [1] collection view와 page control을 연결 : scrollView 스크롤 액션으로

```
// collection view에서 scroll을 했을 때 Delegate
extension ViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let width = scrollView.bounds.size.width
    let x = scrollView.contentOffset.x + (width / 2.0)
    let newPage = Int(x / width)

    if pc.currentPage !== newPage {
      pc.currentPage = newPage // 스크롤할 때마다 page control의 페이지 업데이트
    }
  }
}
```

#### 📌 [2] collection view와 page control을 연결 : pageControl 클릭 액션으로

```
let pc = UIPageControl()
pc.addTarget(self, action: onChangePage, for: .valueChanged)

@objc func onChangePage() {
  let indexPath = IndexPath(row: pc.currentPage, section: 0)
  collectionView.scrollToItem(at: indexPath, at: .centerHorizontally, anmated: true)
}
```

<br/>

### 5. Picker View | Date Picker

<br/>

#### picker view

```
let pv = UIPickerView()

pv.datasource = self
pv.delegate = self

/**
  ====[DataSource]====
  func numberOfComponents : 스피닝메뉴 개수
  func numberOfRowsInComponent : 메뉴 속 아이템 개수
 */

/**
   ====[Delegate]====
   func titleForRow || viewForRow
   func didSelectRow : 특정 시점에서 선택한 값을 가져오려면 버튼과 함께 사용해야한다
 */
 @IBAction func report(_ sender: Any) {
    guard let itemIndex = pv.selectedRow(component: 0) else {
      print("Not Fount")
      return
    }

    print(데이터배열[itemIndex])
 }
```

```
let pk = UIPickerView()

override func viewDidLoad() {
  super.viewDidLoad()

  pk.reloadAllComponents()
  shuffle()
}

func shuffle() {
  let randomIndex = Int.random(in: 0 ..< image.length) + image.length
  pk.selectRow(randomIndex, incomponent: 0, animated: true)
}
```

### 6. Segmented Control

### 7. Stepper

<br />

## 🤖 @IBInspectable

인터페이스 빌더에 설정 추가하기

```
// [1]
@IBInspectable
var borderWidth: CGFloat = 0 {
  didSet {
    self.layer.borderWidth = borderWidth
  }
}

// [2]
@IBInspectable
var makeItCircle: Bool = false {
  didSet {
    if isSquare && makeItCircle {
      self.layer.cornerRadius = self.layer.frame.width / 2
    }
  }
}

var isSquare: Bool {
  get {
    return self.layer.width == self.layer.height
  }
}
```

<br />

## 🤖 그림자

그림자 생성 로직을 CALayer객체에 extension

```
// CALayer+Extension
extension CALayer(
  func makeShadow {
    color: UIColor = black,
    alpha: Float = 0.5,
    x: CGFloat = 0,
    y: CGFloat = 2,
    blur: CGFloat = 4,
    spread: CGFloat = 0
  ) {
    masksToBounds = false
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: x, height: y)
    shadowRadius = blur / 2.0
    if spread == 0 {
      shadowPath == nil
    } else {
      let dx = -spread
      let rect = bounds.insetBy(dx: dx, dy, dy)
      shadowPath = UIBezierPath(rect: rect).cgPath
    }
  }
}


@IBInspectable
var hasShadow: Bool = false {
  didSet {
    if hasShadow {
      layer.makeShadow()
    }
  }
}
```

<br />

## 🤖 스택뷰

```
let cardStackView = {
  let stack = UIStackView()
  stack.translatesAutoresizingMaskIntoConstraints = false
  stack.spacing = 10
  stack.alignment = .center
  stack.axios = .horizontal
  stack.distribution = .fillEqually
  st
  return stack
}()
let card1 = {...}()
let card2 = {...}()
let card3 = {...}()


view.addSubview(cardStackView)
NSLayoutContraint.activate([
  ...위치잡기
])

// 1.
cardStackView.addArrangedSubview(card1)
cardStackView.addArrangedSubview(card2)
cardStackView.addArrangedSubview(card3)

// 2. UIStackView(arrangedSubview: [card1, card2, card3])
```

<br />

## 🤖 스택뷰 활용

스택뷰를 뷰에 embed 시킨다. (이거 보다 isLayoutMarginsRelativeArragement를 쓰자)

```
let leadingImgView = UIImageView()
leadingImgView.image = UIImage(systemName: "pencil.circle.fill")
leadingImgView.translateAutoresizingMaskIntoConstraints = false

let centerLabel = UILabel()
centerLabel.text = "스택뷰활용"
centerLabel.translateAutoresizingMaskIntoConstraints = false

let trailingImgView = UIImageView(image: UIImage(systemName: "perncil.circle.fill"))
trailingImgView.translateAutoreszingMaskIntoConstraints = false

// 📌
let stackView: UIStackView = {
  let stack = UIStackView(arrangedSubviews: [leadingImgView, centerLabel, trailingImgView])
  stack.translatesAutoresizingMaskIntoConstraints = false
  stack.spacing = 0
  stack.alignment = .center
  stack.axios = .horizontal
  stack.distribution = .equalCentering
  return stack
}()

view.addSubview(stackView)
NSLayoutConstraint.activate([
  stackView...,
  // 📌📌📌 스택뷰 패딩 주기
  stackView.isLayoutMarginsRelativeArrangement = true,
  stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10,leading: 10,botton: 10,trailing: 10),
  stackView.layer.borderColor = UIColor.systemBlue.cgColor,
  stackView.layer.borderWidth = 2,
  stackView.layer.cornerRadius = 10,
  stackView.clipsToBounds = true
])
```

<br />

## 🤖 커스텀뷰

```
// MyCardView.swift

import UIKit

class MyCardView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)

    configureView()
    ...
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }


  func configureView() {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.backgroundColor = .blue
  }
}

// 📌 static function은 인스턴스를 메모리에 올리지 않고 실행된다.
extension MyCardView {
  static func generateMyCardView() -> MyCardView {
    let cardView = MyCardView()
    cardView.translatesAutorezsizingMaskIntoConstraints = false
    ...
    return cardView
  }
}

// ⭐️ 사용법1
cardStackView.addArrangedSubview(MyCardView.generateMyCardView)

// ⭐️ 사용법2
func generateCardView() {
  let card = MyCardView()
  ...
  return card
}
cardStackView.addArrangedSubview(generateCardView())
```

<br />

## 🤖 스크롤뷰

전체를 감싸는 컨테이너 뷰를 스크롤뷰에 넣으면 된다.

```
private let containerView: UIView = {
	let view = UIView()
	view.translatesAutoresizingMaskIntoConstraints = false
	return view
}()
private let containerScrollView: UIScrollView = {
  let sv = UIScrollView()
  sv.translatesAutoresizingMaskIntoConstraints = false
  sv.alwaysBounceVertical = true
  sv.isUserInteractionEnabled = true
  return sv
}()

view.addSubview(containerScrollView)
  NSLayoutConstraint.activate([
    containerScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
    containerScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    containerScrollView.topAnchor.constraint(equalTo: view.topAnchor),
    containerScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
  ])

containerScrollView.addSubview(containerView)
NSLayoutConstraint.activate([
  containerView.leadingAnchor.constraint(equalTo: containerScrollView.contentLayoutGuide.leadingAnchor),
  containerView.trailingAnchor.constraint(equalTo: containerScrollView.contentLayoutGuide.trailingAnchor),
  containerView.topAnchor.constraint(equalTo: containerScrollView.contentLayoutGuide.topAnchor),
  containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
  // 📌 containerView.bottomAnchor.constraint(equalTo: containerScrollView.contentLayoutGuide.bottomAnchor)

  containerView.widthAnchor.constraint(equalTo: containerScrollView.frameLayoutGuide.widthAnchor)
])
```

<br />

## 🤖 제스쳐

### 1. Tap 제스쳐

```
let tap = UITapGestureRecignizer(target: self, action: #selector(handleTapGesture))
addGestureRecognizer(tap)
```

### 2. Pan 제스쳐

```
let pan = UIPanGestureRecignizer(target: self, action: #selector(handlePanGesture))
addGestureRecognizer(pan)

@objc func handlePanGesture(sender: UITapGestureRecognizer) {
  switch sender.state {
  case .began:
    superview?.subviews.forEach({ $0.layer.removeAllAnimations() })
  case .changed:
    panCard(sender: sender)
  case .ended:
    resetCardPosition(sender: sender)
  default:
    break
  }
}

func resetCardPosition(sender: UIPanGestureRecognizer) {
		let direction: SwipeDirection = sender.translation(in: nil).x > 100 ? .right : .left
		let shouldDismissCard = abs(sender.translation(in: nil).x) > 100

		UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
			if shouldDismissCard {
				let xTranslation = CGFloat(direction.rawValue) * 1000
				let offScreenTransform = self.transform.translatedBy(x: xTranslation, y: 0)
				self.transform = offScreenTransform
			} else {
				self.transform = .identity
			}
		}) { _ in
			if shouldDismissCard {
				self.removeFromSuperview()
			}
		}
	}
	func panCard(sender: UIPanGestureRecognizer) {
		let translation = sender.translation(in: nil)

		let degrees: CGFloat = translation.x / 20
		let angle = degrees * .pi / 180 // 📌 각도로 변환
		let rotationalTransform = CGAffineTransform(rotationAngle: angle)

		self.transform = rotationalTransform.translatedBy(x: translation.x, y: translation.y)
	}
```

<br />

## 🤖 그라데이션

```
private let gradient = CAGradientLayer()

gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
gradient.locations = [0.5, 1, 1] // startPoint, endPoint, frame
layer.addSublayer(gradient)
```

<br />

## 🤖 UIAlertController

### 1. 형태 

3개 이상의 action이 추가되면 수직 정렬로 바뀐다.

preferredAction으로 버튼을 강조하고 우선순위를 높게 설정할 수 있다.

preferredAction은 addAction을 하고 설정해줘야한다.

preferredAction은 .alert에서만 사용가능하고 .actionSheet에서는 사용할 수 없다.
```
let controller = UIAlertController(title: "Hello", message: nil, preferredStyle: .alert)
let okAction = UIAlertAction(title: "Ok", style: .default) { action in
  print(action.title)
}

controller.addAction(okAction)

controller.preferredAction = okAction

present(controller, animated: true, completion: nil)
```

<br />

### 2. UIAlertController + textfield

preferredStyle이 .alert일 경우에만 텍스트필드를 넣을 수 있다.

```
@IBAction func clickButton(_ sender: Any) {
  idTextField.text = nil
  passwordTextField.text = nil
  
  let alert = UIAlertController(title: "Hello", message: nil, preferredStyle: .alert)
  
  alert.addTextField { idTextField in
    idTextField.attributedPlaceholder = NSAttributedString(string: "ID", attributes: [.foregroundColor: UIColor.red])
  }
  alert.addTextField { passwordTextField in
    passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [.foregroundColor: UIColor.green])
    passwordTextField.isSecureTextEntry = true
  }

  let okAction = UIAlertAction(title: "Ok", style: .default, handler: { [weak self] _ in
    if let fieldList = alert.textFields {
      self?.idTextField.text = fieldList[0].text ?? ""
      self?.passwordTextField.text = fieldList[1].text ?? ""
    }
  })
  let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)

  alert.addAction(okAction)
  alert.addAction(cancelAction)
  cancelAction.setValue(UIColor.red, forKey: "titleTextColor")

  present(alert, animated: true)
}
```

<br />

### 3. actionSheet
ipad에서 actionSheet는 팝업으로 뜨기 때문에 위치 설정을 해줘야 한다.
```
let alert = UIAlertController(title: "Hello", message: nil, preferredStyle: .actionSheet)

// 📌 IPad actionSheet
if let pc = controller.popoverPresentationController {
  pc.sourceRect = sender.frame
  pc.sourceView = view
}
```

<br />

## 🤖 ImageView
이미지를 설정해주었을 때 디폴트로 이미지의 크기를 갖는다.

### 1. 이미지 애니메이션
```
let images = [
  UIImage(systemName: "speaker1"),
  UIImage(systemName: "speaker2"),
  UIImage(systemName: "speaker3")
]

override func viewDidLoad() {
  super.viewDidLoad()

  imageView.animationImages = images
}

@IBOulet weak var imageView: UIImageView!

@IBAction func clickStartButton(_ sender: Any) {
  imageView.startAnimating()
}

@IBAction func clickStopButton(_ sender: Any) {
  if imageView.isAnimation {
    imageView.stopAnimating()
  }
}
```

<br />

## 🤖 MapKit

### 1. 형태

```
import MapKit

private let mapView: MKMapView = {
  let map = MKMapView()
  map.translatesAutoresizingMaskIntoConstraints = false
  map.userTrackingMode = .follow
  map.showsUserLocation = true
  return map
}()
```

### 2. 위치 정보 권한 요청

info.plist에서 "Privacy - Location When In Use Usage Description" 와 값 설정

<img width="909" alt="image" src="https://user-images.githubusercontent.com/86825214/210207712-5aaa7735-5ec0-4ef9-b859-ee9a19b63bc2.png">

```
var locationManager: CLLocationManager?

override func viewDidLoad() {
  super.viewDidLoad()

  locationManager = CLLocationManager()
  locationManager?.delegate = self
  locationManager?.requestWhenInUseAuthorization()
  locationManager?.requestAlwaysAuthorization()
  locationManager?.requestLocation()
}
```

### 3. CLLocationManagerDelegate

- CLLocationManager.authorizationStatus
- MKCoordinateRegion(center:latitudinalMeters:longitudinalMeters:)
- MKMapView.setRegion

```
extension 뷰컨트롤러: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { ... }

  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    guard let locationManager = locationManager, let location = locationManager.location else { return }

    switch locationManager.authorizationStatus {
    case .notDetermined, .restricted:
      print("not")
    case .denied:
      print("denied")

    // 📌 항상 허용이거나 사용중에 허용일 때 줌인
    case .authorizedAlways, .authorizedWhenInUse:
      let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 750, longitudinalMeters: 750)
      mapView.setRegion(region, animated: true)
		default:
			break
    }
  }

  func locationManager(_ manager: CLLocationManager, didFailWithError: error: Error) { ... }
}
```

### 4. MKLocalSearch

```
func findNearbyPlaces(by searchInputText: String) {
  mapView.removeAnnotations(mapView.annotations) // 📌 저장된 핀 제거

  let request = MKLocalSearch.Request()
  request.naturalLanguageQuery = searchInputText // 📌 검색 텍스트
  request.region = mapView.region // 📌 setRegion을 해줌으로써 mapView.region값을 가지고 있다

  search.start { [weak self] res, err in
    guard let res = res, err == nil else { return }
    let places = res.mapItems
    places.forEach { place in
      let annotation = MKPointAnnotation() // 📌 annotation 생성
      annotation.coordinate = place.placemark.coordinate
      annotation.title = place.name
      annotation.subtitle = place.phoneNumber
      self?.mapView.addAnnotation(annotation) // 📌 맵뷰에 annotation 추가
    }
  }
}
```

### 5. 검색 즉시 테이블뷰 띄우기

```
...
search.start { [weak self] res, err in
  guard let res = res, err == nil else { return }
  let places = res.mapItems
  places.forEach { place in
    let annotation = MKPointAnnotation() // 📌 annotation 생성
    annotation.coordinate = place.placemark.coordinate
    annotation.title = place.name
    annotation.subtitle = place.phoneNumber
    self?.mapView.addAnnotation(annotation) // 📌 맵뷰에 annotation 추가
  }

  // ✅
  self?.presentPlacesTable()
}

// 📌
func presentPlacesTable() {
  let placeTVC = PlacesTableViewController()
  placeTVC.modalPresentationStyle = .pageSheet

  if let sheet = placeTVC.sheetPresentationController {
    sheet.preferGrabberVisible = true
    sheet.detents = [.medium(), .large()]

    present(placeTVC, animated: true)
  }
}
```

### 6. 테이블뷰에 검색된 장소 데이터 넘겨주고 셀 생성

```
// 📌 매개변수로 장소 데이터 넘겨주기
func presentPlacesTable(places: [PlaceAnnotations]) {
  guard let locationManager = locationManager, let userLocation = locationManager.location else { return }

  // 📌 테이블뷰컨트롤러에 사용자위치와 검색된 장소들을 넘겨준다.
  let placeTVC = PlacesTableViewController(userLocation: userLocation, places: places)
  placeTVC.modalPresentationStyle = .pageSheet

  if let sheet = placeTVC.sheetPresentationController {
    sheet.preferGrabberVisible = true
    sheet.detents = [.medium(), .large()]

    present(placeTVC, animated: true)
  }
}


// ✅ PlaceTableViewController 내부 | 셀 생성
import UIKit
import MapKit

class PlacesTableViewController: UITableViewController {
	//MARK: - Properties
	var userLocation: CLLocation
	let places: [PlaceAnnotations]
	
	init(userLocation: CLLocation, places: [PlaceAnnotations]) {
		self.userLocation = userLocation
		self.places = places

		super.init(nibName: nil, bundle: nil)

        // 📌 셀 등록
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PlaceCell")
	}
	

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return places.count
	}
	

    // 📌 셀 생성
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath)
		let place = places[indexPath.row]
		
		var content = cell.defaultContentConfiguration()
		content.text = place.name
		content.secondaryText = "Secondary"
		
		cell.contentConfiguration = content
		
		return cell
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}


```

<br />

## 🤖 Daytour

### 1. ViewController의 view.translatesAutoresizingMaskIntoConstraints = false 를 하면 스타일링이 망가진다. 이유는 ?

### 2. navigationController?.pushViewController(controller, animated: true)할 때 view의 backgroundColor를 설정해주지 않으면 이전 페이지가 잔상처럼 보인다.

### 3. 파이어베이스를 적용할 때 DATABASE_URL을 info.plist에 넣어줘야한다.

<br/>

## 🤖 TODO
- enum을 배열처럼 사용 : CaseIterable, allCases

- insertSegment(withTitle:at:animated:)

- \[StoryBoard] ViewController를 View안에 넣으면 embed된 View 네모가 생긴다.

- \[StoryBoard] ViewController를 cmd + shift + L로 생성해서 UIView에서 드래그에서 ViewController에 놓으면 embed시킬 수 있다.

- 우측 사이드바 identifier에서 user defined runtime attributes에 속성 추가 가능

- viewController에서 끌어다가 다른 viewController에 놓고 present modally + performSegue(withIdentifier:sender:)

- viewController끼리 연결된 segue선을 클릭하고 presentation(형태), transition(애니메이션) 설정

- viewController 배경 투명 + 전체사이즈 View 투명 회색 = 오버레이

- View의 높이를 지정하지 않고 button이나 다른 객체의 크기로 유동적으로 높이 설정 가능

- horizontal stackView에 버튼 하나를 넣으면 전체 너비를 갖는다

- viewDidAppear() viewDidDisappear()

- tapGesture + dismiss

- 키보드가 View를 가릴 때 : NotificationCenter (옵저버 패턴)
  - 키보드 높이 구하기
  - UIView.animate() + layoutIfNeeded()
```
NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

@objc func keyboardWillShow(notification: Notification) {
  let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height else { return }

  UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: { [unowned self] in
    self.containerViewBottomConstraint.constant = keyboardHeight - (200 + 8)
    self.view.layoutIfNeeded()
  })
}
```

<br/>

## 📌 ETC

### 1. map | compackMap (nil을 제거?)

```
let array = ["1", "2", "three", "//4", "5"]

let mapped: [Int?] = array.map { Int($0) } // [1, 2, nil, nil, 5]

let compactMapped: [Int] = array.compactMap { Int($0) } // [1, 2, 5]
```

### 2. UILabel autoshrink : 글자 길이에 맞게 자동으로 폰트 크기 조절

### 3. 상태바 속성 설정

```
/**
  📌 앱 전체 상태바 설정
  info.plist에서 View controller-based status bar apprearance 를 NO로 작성
  AppDelegate.swift에서 (_: didFinishLaunchingWithOptions:) 메소드에
 */

UIApplication.sharedApplication().statusBarStyle = .LightContent
or
UIApplication.shared.statusBarStyle = .lightContent

/**
  📌 특정 뷰에서의 상태바 설정
  viewWillAppear()에
 */
UIApplication.sharedApplication().statusBarStyle = .LightContent
or
UIApplication.shared.statusBarStyle = .lightContent

// viewWillAppear()을 사용했으니 viewWillDisappear()롤 상태바 원상복구
override func viewWillDisappear(animated: Bool) {
  super.viewWillDisappear(animated)
  UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
  or
  UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
}
```

### 4. swiftui preview 사용하기

```
#if DEBUG
import SwiftUI

strunc MainViewControllerPresentable: UIViewControllerRepresentable {
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

  }
  func makeUIViewController(context: Context) -> some UIViewController {
    <#name#>
  }
}

struct ViewControllerPrepresentable_PreviewProvider: PreviewProvider {
  static var previews: some View {
    MainViewControllerPresentable()
      .previewDevice("iphone 12 mini")
      .previewDisplayName("iphone 12 mini")
      .ignoresSafeArea()
  }
}

#endif

// opt + cmd + ENTER
// opt + cmd + P
```

### 5. 뭔가 안될 때는 오토레이아웃 문제일 가능성이 높다. : 배경색 넣고 확인

### 6. UIView 마진

```
isLayoutMarginsRelativeArrangement = true
layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
```

### 7. UILabel.attributedText

```
private let infoLabel: UILabel = {
  let label = UILabel()
  let attributedText = NSMutableAttributedString(string: "info", attributes: [.font: UIFont.systemFont(ofSize: 32)])
  label.attributedText = attributedText
  return label
}()
```

### 8. 뷰를 제일 상위로 끌어올리기

```
view.bringSubviewToFront(뷰)
```

### 9. resignFirstResponder()

키보드 사라짐

<br />
<br />
<br />

# 📱 SWIFT

## 🥑 클로져

> 클로져는 호출 할 때 파라미터 이름을 적지 않는다.     
> 클로져호출(name: "kim") ❌  
> 클로져호출("kim") 🟢

기본 형태
```
// 📌 () -> Void : 인자를 받지 않고 리턴도 하지않는 클로져
let myClosure = { () -> Void in
  print("hello world")
}

myClosure()


// 📌 (String) -> Void : 인자로 문자열을 받고 리턴을 하지 앟는 클로져
let myClosure2 = { (word: String) -> Void in
  print(word)
}

myClosure2("Hello World!!!")
```

<br />

압축 형태
```
let myClosure2: (String) -> Void = {
  print($0)
}
```

<br />

즉시 실행 클로져 : {}()
```
let myTotalNumber = { () -> Int in
  var total = 0
  for number in stride(from: 1, through: 9, by: 1) {
    total += number
  }
  return total
}()

print(myTotalNumber())       // 45
```

<br />

⭐️ 클로져를 인자로 받는 함수
```
let multiply = { (number1: Int, number2: Int) -> Int in 
  return number1 * number2
}

// 📌 인자로 (Int, Int) -> Int 모양의 클로져를 받는다
func getClosureFunc(closure: (Int, Int) -> Int) -> String {
  let caculatedNumber = closure(5, 10)
  return "this is the result \(caculatedNumber)"
}

// 📌 인자로 변수로 저장된 클로져를 넣어줄 때
getClosureFunc(closure: multiply)


// 📌 인자로 바로 클로져를 넣어줄 때
getClosureFunc(closure: {(num1: Int, num2: Int) -> Int in
  return num1 * num2 * 0
})

// 📌📌📌 인자로 바로 클로져를 넣어줄 때 압축
// ⭐️ getClosureFunc를 선언할 때 인자로 받을 클로져의 매개변수를 이미 선언했다.
getClosureFunc() {
  $0 * $1 * 10
}

getClosureFunc {
  $0 * $1 * 10
}
```

<br />

⭐️ 외부의 요소에 접근한 클로져는 @escaping를 선언해줘야한다.
```
var myClosure: () -> Void = {}

func makeNewClosure(closure: @escaping () -> Void) {
  myClosure = closure
}

makeNewClosure {
  print("hello world")
}

myClosure()       // "hello world"
```

<br />

## 🥑 Struct
> 코드까지 포함한 커스텀 타입

기본 형태 
```
// 📌 struct
struct Item {
  var name: String = "Not defined"
  var price: Double = 0
}

// 📌 struct로 생성된 인스턴스
var fruitItem: Item = Item()
fruitItem.name = "banana"
fruitItem.price = 10.0
```

<br />

구조체 안에 구조체
```
struct Price {
  var USD = 0.0
  var CAD = 0.0
}

struct Item {
  var name: String = "not defined"
  var price: Price = Price()       📌
}

var puchase = Item()
purchase.name = "Banana"
puchase.price.USD = 10.50
```

<br />

구조체 안에 구조체 + 옵셔널
```
struct Price {
  var USD = 0.0
  var CAD = 0.0
}

struct Item {
  var name: String = "not defined"
  var price: Price?         📌
}

var puchase = Item()
purchase.name = "Banana"
puchase.price?.USD = 10.50  📌
```

<br />

### keyPath 
```
struct Item {
  let name: String
  let price: Double
}

var purchase: Item = Item(name: "Milk", price: 12.50)

print(purchase.price)
print(purchase[keyPath: \.Item.price])
```

<br />

### method
```
struct Item {
  var name = "not defined"
  var price = 0.0

  func total(quantity: Double) -> Double {
    return price * quantity
  }
}

var purchase = Item()
purchase.price = 12.00

purchase.total(quantitiy: 2)    // 24.00
```

<br />

### mutating method
```
struct Item {
  var name = "not defined"
  var price = 0.0

  mutating func changePrice(newPrice: Double) -> Double {
    price = newPrice
  }
}

var purchase = Item()
purchase.price = 12.00

purchase.changePrice(newPrice: 10.00)    
purchase.price   // 10.00
```

<br />

### init

```
struct Item {
  var name: String
  var price: Double

  init(name: String, price: Double) {
    self.name = name
    self.price = price
  }
}

let product = Item(name: "banana", price: 10.30)
```

<br />

### getter setter

> get set을 프로퍼티에 직접 연결할 수 없다. 저장소 프로퍼티를 언더바(_)로 구분

```
struct Price {
  var _USD: Double

  var USD: Double {
    get {
      return _USD
    }
    set {
      return _USD = newValue
    }
  }
}

struct Point {
  var x: Int = 0
  var y: Int = 0

  var oppositePoint: Point {
    get {
      return Point(x: -x, y: -y)
    }
    set {
      x = -newValue.x
      y = -newValue.y
    }
  }
}
```

<br />

### didSet willSet
```
struct Price {
  var increment: Double = 0
  var oldPrice: Double = 0

  var price: Double {
    willSet {
      increment = newValue - price
    }
    didSet {
      oldPrice = oldValue
    }
  }
}

var item = Price(price: 15.95)
item.price = 20.00

print(item.increment) // 4.05
print(item.oldValue)  // 15.95 
```

<br />

### static
> static을 붙여주면 인스턴스에서 접근 불가능

```
struct Price {
  var USD: Double

  static var CAD = 123
}

var money = Price(USD: 20.5)
money.CAD ❌
Price.CAD 🟢
```

<br />

### 🥑 제네릭 struct

```
struct MyStruct<T> {
  var myValue: T

  func description() {
    print("My value is \(myValue)")
  }
}

let instance = MyStruct<String>(myValue: "hello world")
```

<br />

## 🥑 프로토콜

<br />

### 제네릭 프로토콜
```
protocol Printer {
  associatedtype protype
  var name: protype { get set }
}

struct Employees: Printer {
  var name: String
}

let employee = Employees(name: "kim")
```

## 🥑 이것저것 기초

<br />

### %d
```
let user = "kim"
var myText = String.localizedStringWithFormat("My name is %d", user)
```

<br/> 

### %f
```
let length = 12.3456
let decimals = String.localizedStringWithFormat("Decimals: %.2f", length)
```
