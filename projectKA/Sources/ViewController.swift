
import UIKit

class ViewController: UIViewController {
    
    private var model = ["Settigs title here", "Notification", "Settigs title here", "Settigs title here", "Settigs title here", "About this app"]
    
    
    //  MARK: - Outlets
    
    private lazy var iconButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Icon"), for: .normal)
        button.addTarget(self, action: #selector(iconButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var pinkBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 1.00, green: 0.20, blue: 0.47, alpha: 1.00)
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    private lazy var settingsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Settings"
        return label
    }()
    
    private lazy var bellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Bell")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var updateSettingsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.text = "Update your settings"
        return label
    }()
    
    private lazy var notificationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Turn on notification"
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: iconButton)]
        setupView()
        setupHierarchy()
        setupLayout()
        
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupHierarchy() {
        view.addSubview(iconButton)
        view.addSubview(settingsLabel)
        view.addSubview(pinkBackgroundView)
        pinkBackgroundView.addSubview(updateSettingsLabel)
        pinkBackgroundView.addSubview(notificationLabel)
        view.addSubview(bellImageView)
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            iconButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            iconButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            iconButton.heightAnchor.constraint(equalToConstant: 40),
            iconButton.widthAnchor.constraint(equalToConstant: 40),
            
            settingsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            settingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 66),
            settingsLabel.widthAnchor.constraint(equalToConstant: 95),
            settingsLabel.heightAnchor.constraint(equalToConstant: 23),
            
            bellImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 105),
            bellImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 260),
            bellImageView.widthAnchor.constraint(equalToConstant: 72),
            bellImageView.heightAnchor.constraint(equalToConstant: 72),
            
            pinkBackgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 116),
            pinkBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            pinkBackgroundView.heightAnchor.constraint(equalToConstant: 88),
            pinkBackgroundView.widthAnchor.constraint(equalToConstant: 325),
            
            updateSettingsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 136),
            updateSettingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            updateSettingsLabel.widthAnchor.constraint(equalToConstant: 113),
            updateSettingsLabel.heightAnchor.constraint(equalToConstant: 14),
            
            notificationLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 158),
            notificationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            notificationLabel.widthAnchor.constraint(equalToConstant: 198),
            notificationLabel.heightAnchor.constraint(equalToConstant: 24),
            
            tableView.topAnchor.constraint(equalTo: pinkBackgroundView.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Actions

    @objc private func iconButtonTapped() {}
}

    // MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell ?? CustomTableViewCell()
        cell.group.image = UIImage(named: "Group")
        cell.titleLabel.text = model[indexPath.row]
        cell.settingStatusLabel.text = "Setting Status"
        
        if indexPath.row == 0 || indexPath.row == 1 {
            cell.switchControl.isHidden = false
            cell.switchControl.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        } else {
            cell.switchControl.isHidden = true
        }
        return cell
    }
    
    @objc private func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            print("On")
        } else {
            print("Off")
        }
    }
}

    // MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
