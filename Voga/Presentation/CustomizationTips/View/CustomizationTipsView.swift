//
//  CustomizationTipsView.swift
//  Voga
//
//  Created by Pedro Haruke Leme da Rocha Rinzo on 15/09/21.
//

import UIKit

class CustomizationTipsView: UIView {
    private weak var presenter: CustomizationTipsPresentationLogic?

    private var tips: [CustomizationTip]? = []

    private lazy var tipsList: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 30

        let tipsList = UICollectionView(frame: .zero, collectionViewLayout: layout)
        tipsList.setCollectionViewLayout(layout, animated: true)
        tipsList.register(TipCardCell.self, forCellWithReuseIdentifier: "cell")
        tipsList.backgroundColor = .clear
        tipsList.delegate = self
        tipsList.dataSource = self

        return tipsList
    }()

    init(presenter: CustomizationTipsPresentationLogic) {
        self.presenter = presenter
        self.tips = presenter.getCustomizationTips()
        super.init(frame: .zero)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomizationTipsView: ViewCodeProtocol {
    func setupHierarchy() {
        tipsList.register(HeaderCollectionView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionView.reuseIdentifier)
        addSubview(tipsList)
    }

    func setupConstraints() {
        tipsList.constraint { view in
            [view.centerXAnchor.constraint(equalTo: centerXAnchor),
              view.leadingAnchor.constraint(equalTo: leadingAnchor),
              view.trailingAnchor.constraint(equalTo: trailingAnchor),
              view.topAnchor.constraint(equalTo: topAnchor, constant: 15),
              view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80)]
        }
    }

    func additionalSetup() {
        backgroundColor = .appColor(.background)
    }
}

extension CustomizationTipsView: UICollectionViewDelegateFlowLayout {
     func collectionView(_ collectionView: UICollectionView,
                   layout collectionViewLayout: UICollectionViewLayout,
                   insetForSectionAt section: Int) -> UIEdgeInsets {
         return UIEdgeInsets(top: 1.0, left: 0, bottom: 1.0, right: 0)
     }

     func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: collectionView.frame.width, height: 370)
     }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
 }

extension CustomizationTipsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tips?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TipCardCell

        cell.configure(with: tips![indexPath.row])

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            case UICollectionView.elementKindSectionHeader:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionView.reuseIdentifier, for: indexPath) as! HeaderCollectionView

                return header
            default:  fatalError("Unexpected element kind")
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.showCustomizationTipsDetail(customizationTip: tips![indexPath.row])
    }
}
