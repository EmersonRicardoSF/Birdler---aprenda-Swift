//
//  NewsEmptyDataSource.swift
//  Birdler
//
//  Created by Nayla on 17/4/2024.
//

import DZNEmptyDataSet
import UIKit

/// Manages all the rows in the News table view if news download failed.
class NewsEmptyDataSource: NSObject, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    /// A delegate we can report back to when the retry button is tapped.
    weak var delegate: NewsViewController?

    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let str = "News"
        let attrs = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline)]
        return NSAttributedString(string: str, attributes: attrs)
    }

    func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let str = "We couldn't download the news right now. Please tap the button below to try again."
        let attrs = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .body)]
        return NSAttributedString(string: str, attributes: attrs)
    }

    func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
        return UIImage(bundleName: "News-Placeholder")
    }

    func buttonTitle(forEmptyDataSet scrollView: UIScrollView, for state: UIControl.State) -> NSAttributedString? {
        let str = "Try Again"
        let attrs = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .callout)]
        return NSAttributedString(string: str, attributes: attrs)
    }

    /// Called when the retry button is tapped.
    func emptyDataSet(_ scrollView: UIScrollView, didTap button: UIButton) {
        delegate?.fetchArticles()
    }
}

