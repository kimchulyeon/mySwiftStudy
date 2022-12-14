/**
 ๐ 2022-11-30
    - ์ฒซ ์์ฑ
    - Delegate Pattern : A ๊ฐ์ฒด์ ๊ธฐ๋ฅ์ B ๊ฐ์ฒด์ ๋ถ๋ฐฐ (์ปดํฌ๋ํธ ๋ถ๋ฆฌ๋ ๋น์ท?)
    - ๋ํ์ ์ผ๋ก TableView์ ๋ฆฌ์คํธ์ ๋ฆฌ์คํธ ํด๋ฆญ ์ด๋ฒคํธ (์์์ด ๋ค์)
 
 ๐ 2022-12-01
    - ...dataSource | ...delegate : ์์ (์ง์ ๋ ํ์์ผ๋ก ๋ฉ์๋ ๊ตฌํ : ํ๋กํ ์ฝ) : ํ์ ๋ฉ์๋ | ์ ํ ๋ฉ์๋
    - ์คํ
        - 1. delegate๊ฐ ํ์ํ์ง ํ์ธ
        - 2. ํ๋กํ ์ฝ ๋ ํผ๋ฐ์ค๋ฅผ ์ฐธ์กฐํด์ ์ด๋ค ๋ฉ์๋๊ฐ ์๊ณ  ์ด๋ค๊ฒ ํ์์ธ์ง ํ์ธ
        - 3. ๊ฐ์ฒด๋ฅผ ์ฐ๊ฒฐ
        - 4. ์ฐ๊ฒฐํ ๊ฐ์ฒด์์ ๋ฉ์๋๋ฅผ ๊ตฌํ
            - (ใฑ) ViewController ๊ฐ์ฒด ์์์ ๊ตฌํ
            - (ใด) extension์ผ๋ก ๋ถ๋ฆฌ
    - ์ ํ ๊ฐ๋ฐ์ ๋ฌธ์ ํ์ฉ : https://developer.apple.com/documentation/uikit/uitableviewdatasource
    - ์คํ ๋ฆฌ๋ณด๋ ์ฐธ์กฐ Storyboard Reference
        - ์คํ ๋ฆฌ๋ณด๋ ์์ฑ
        - ViewController ์์ฑํ๊ณ  ์ฐ๊ฒฐ
        - Main ์คํ ๋ฆฌ๋ณด๋์์ storyboard reference ๊ฐ์ฒด ์์ฑ
        - ๋ฒํผ๊ฐ์ ๊ฑธ๋ก ์ฐ๊ฒฐํด์ ์ด๋ป๊ฒ ๋ณด์ฌ์ค์ง ์ค์ 
 */

import UIKit

class DelegatePatternViewController: UIViewController {

    let list = ["Apple", "Google", "Microsoft"]

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination.children.first as? UITextInputViewController {
            print(vc)
            vc.delegate = self
        }
    }
}


// ํ์ด๋ธ DATASOURCE
extension DelegatePatternViewController: UITableViewDataSource {

    // required : ๋ฆฌ์คํธ ๊ฐ์
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    // required : ์ ํ๋ ํ๋์ ๋ํ ์ ์?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
}

// ํ์ด๋ธ DELEGATE
extension DelegatePatternViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(list[indexPath.item])
    }
}




// ์ธํ DELEGATE
// UITextInputViewController์ ์ ์ธํ DELEGATE
extension DelegatePatternViewController: LabelInputConnectDelegate {
    func inputConnect(_ vc: UIViewController, didInput value: String?) {
        valueLabel.text = value
    }

    func inputConnectCancel(_ vc: UIViewController) {
        print("Hello")
        valueLabel.text = "Cancel"
    }


}
