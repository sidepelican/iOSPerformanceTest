import UIKit

private struct Page {
    let title: String
    let makeViewController: () -> UIViewController
}

private struct Section {
    let headerTitle: String
    let pages: [Page]
}

class HomeViewController: UITableViewController {
    private var sections: [Section] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        sections = [
            Section(headerTitle: "ImagedCell", pages: [
                Page(title: "normal", makeViewController: ImagedCellViewController.init),
                Page(title: "imaged", makeViewController: DelayImagedCellViewController.init),
            ]),
        ]

        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].pages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let page = sections[indexPath.section].pages[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = page.title
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let page = sections[indexPath.section].pages[indexPath.row]

        let vc = page.makeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].headerTitle
    }
}

