//
//  JitsiExtensionViewController.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 5/13/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit
import JitsiMeet

// debut jitsi

fileprivate var pipViewCoordinator: PiPViewCoordinator?
fileprivate var jitsiMeetView: JitsiMeetView?
//fin jitsi


extension MessengerViewController: JitsiMeetViewDelegate {
    
@IBAction func OpenJitsi(_ sender: Any) {
        cleanUp()
    // create and configure jitsimeet view
                     let jitsiMeetView = JitsiMeetView()
                     jitsiMeetView.delegate = self
                     self.jitsiMeetView = jitsiMeetView
                     let options = JitsiMeetConferenceOptions.fromBuilder { (builder) in
                     builder.welcomePageEnabled = true

                         builder.welcomePageEnabled = false
                        builder.serverURL = (URL(string: Keys.MobileIntegrationServer.jitsiURL))
                        builder.room = self.nomroom

                      self.navigationController?.isNavigationBarHidden = true
                     }
                     jitsiMeetView.join(options)

                     // Enable jitsimeet view to be a view that can be displayed
                     // on top of all the things, and let the coordinator to manage
                     // the view state and interactions
                     pipViewCoordinator = PiPViewCoordinator(withView: jitsiMeetView)
                     pipViewCoordinator?.configureAsStickyView(withParentView: view)

                     // animate in
                     jitsiMeetView.alpha = 0
                     pipViewCoordinator?.show()

  }

  fileprivate func cleanUp() {
    self.navigationController?.isNavigationBarHidden = false
      jitsiMeetView?.removeFromSuperview()
      jitsiMeetView = nil
      pipViewCoordinator = nil

  }

  func conferenceTerminated(_ data: [AnyHashable : Any]!) {
      DispatchQueue.main.async {
          self.pipViewCoordinator?.hide() { _ in
              self.cleanUp()
          }
      }
  }

  func enterPicture(inPicture data: [AnyHashable : Any]!) {
      DispatchQueue.main.async {
          self.pipViewCoordinator?.enterPictureInPicture()
      }
  }
    func reverse(_ str: String) -> String {
        return String(str.reversed())
    }

    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        let rect = CGRect(origin: CGPoint.zero, size: size)
        pipViewCoordinator?.resetBounds(bounds: rect)
    }

}

