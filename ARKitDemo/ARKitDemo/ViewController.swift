//
//  ViewController.swift
//  ARKitDemo
//
//  Created by Sho Ito on 2018/03/16.
//  Copyright © 2018年 aryzae. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

//        sceneView.scene = SCNScene(named: "art.scnassets/Iron_Man.obj")!
        sceneView.delegate = self
        sceneView.session.delegate = self

        // debug
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]

        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal

        sceneView.session.run(configuration)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: ARSessionDelegate {

    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        print(#function)
        guard let planeAnchors = anchors as? [ARPlaneAnchor] else { return }
    }

    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        print(#function)
    }
}

extension ViewController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        print(#function)
        guard let planeAnchor = anchor as? ARPlaneAnchor else { fatalError() }

        // 平面ジオメトリを作成
        let geometry: SCNPlane = .init(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
        geometry.materials.first?.diffuse.contents = UIColor.yellow

        // 平面ジオメトリを持つのノードの作成
        let planeNode: SCNNode = .init(geometry: geometry)

        // 平面ジオメトリを持つノードをx軸まわりに90度回転
        planeNode.transform = SCNMatrix4MakeRotation(-Float.pi / 2.0, 1, 0, 0)

        DispatchQueue.main.async {
            node.addChildNode(planeNode)
        }

        // ---

        // シーン作成
        let scene: SCNScene = SCNScene.init(named: "art.scnassets/cat.obj")!

        // 作成したシーンの
        let virtualObjectNode = SCNNode()
        for child in scene.rootNode.childNodes {
            virtualObjectNode.addChildNode(child)
        }

        DispatchQueue.main.async {
            node.addChildNode(virtualObjectNode)
        }
    }

    func renderer(_ renderer: SCNSceneRenderer, willUpdate node: SCNNode, for anchor: ARAnchor) {
        print(#function)
    }

    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        print(#function)
    }

    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        print(#function)
    }
}
