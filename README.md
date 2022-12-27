# 📱 UIKit 공부
<< 목차 >>

- [UIView](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-uiview)
- [UIControl](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-uicontrol)
- [Daytour 하면서 배운 것들](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-daytour)

<br/>

## 🤖 UIView

### 1. superview  >  subview
subview들은 **배열**의 형태로 관리된다 : [subview]\()

### 2.  frame - CGRect - CGPoint(x, y) : 위치 - CGSize(width, hegith) : 크기
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
loginButton.addTarget(self, action: loginHandler, for: .touchUpInside)
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

## 🤖 Daytour

### 1. ViewController의 view.translatesAutoresizingMaskIntoConstraints = false 를 하면 스타일링이 망가진다. 이유는 ?

### 2. navigationController?.pushViewController(controller, animated: true)할 때 view의 backgroundColor를 설정해주지 않으면 이전 페이지가 잔상처럼 보인다.

### 3. 파이어베이스를 적용할 때 DATABASE_URL을 info.plist에 넣어줘야한다.

<br />

## 📌 ETC

### 1. map | compackMap (nil을 제거?)
```
let array = ["1", "2", "three", "//4", "5"]

let mapped: [Int?] = array.map { Int($0) } // [1, 2, nil, nil, 5]

let compactMapped: [Int] = array.compactMap { Int($0) } // [1, 2, 5]
```

