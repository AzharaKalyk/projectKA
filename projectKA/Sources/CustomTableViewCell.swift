
import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let group: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    let settingStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    let switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.isOn = false
        return switchControl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(group)
        contentView.addSubview(titleLabel)
        contentView.addSubview(settingStatusLabel)
        contentView.addSubview(switchControl)
        
        NSLayoutConstraint.activate([
            group.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            group.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            group.widthAnchor.constraint(equalToConstant: 48),
            group.heightAnchor.constraint(equalToConstant: 48),
            
            titleLabel.leadingAnchor.constraint(equalTo: group.trailingAnchor, constant: 8),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            settingStatusLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 81),
            settingStatusLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 25),
            settingStatusLabel.widthAnchor.constraint(equalToConstant: 100),
            settingStatusLabel.heightAnchor.constraint(equalToConstant: 14),
            
            switchControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            switchControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
