# 📱 UIKit 공부
<< 목차 >>

- [UIView](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-uiview)
- [UIControl](https://github.com/kimchulyeon/mySwiftStudy/blob/main/README.md#-uicontrol)

<br/>
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
<br/>

## 🤖 UIControl

UIControl.state (normal, highlighted, dsabled, selected, focused, ...)

target-action 패턴 : **addTarget(self, action:, for:)**
```
loginButton.addTarget(self, action: loginHandler, for: .touchUpInside)
```
많이 쓰이는 .touchUpInside --- .valueChanged

<br/>
<br/>


### 1. Button

### 2. Switch

### 3. Slider

### 4. Page Control

### 5. Date Picker

### 6. Segmented Control

### 7. Stepper
