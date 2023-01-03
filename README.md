# 📱 UIKit 공부

<< 목차 >>

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
- [MapKit](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-mapkit)
  - [검색으로 핀 지정](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#4-mklocalsearch)
  - [테이블뷰 띄우기](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#5-검색-즉시-테이블뷰-띄우기)
  - [셀 생성](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#6-테이블뷰에-검색된-장소-데이터-넘겨주고-셀-생성)
- [Daytour 하면서 배운 것들](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-daytour)
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
  stackView.layer.cornerRadius = 10
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
