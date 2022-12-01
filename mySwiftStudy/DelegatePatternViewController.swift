/**
 📆 2022-11-30
    - 첫 생성
    - Delegate Pattern : A 객체의 기능을 B 객체에 분배 (컴포넌트 분리랑 비슷?)
    - 대표적으로 TableView의 리스트와 리스트 클릭 이벤트 (작업이 다양)
 
 📆 2022-12-01
    - ...dataSource | ...delegate : 위임 (지정된 형식으로 메소드 구현 : 프로토콜) : 필수 메소드 | 선택 메소드
    - 스텝
        - 1. delegate가 필요한지 확인
        - 2. 프로토콜 레퍼런스를 참조해서 어떤 메소드가 있고 어떤게 필수인지 확인
        - 3. 객체를 연결
        - 4. 연결한 객체에서 메소드를 구현
            - (ㄱ) ViewController 객체 안에서 구현
            - (ㄴ) extension으로 분리
    - 애플 개발자 문서 활용 : https://developer.apple.com/documentation/uikit/uitableviewdatasource
    -
 */

import UIKit

class DelegatePatternViewController: UIViewController {

    let list = ["Apple", "Google", "Microsoft"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


// DATASOURCE
extension DelegatePatternViewController: UITableViewDataSource {
    
    // required : 리스트 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    // required : 셀 하나 하나에 대한 정의?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
}

// DELEGATE
extension DelegatePatternViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(list[indexPath.item])
    }
}
