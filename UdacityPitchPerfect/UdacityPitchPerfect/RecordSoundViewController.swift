//
//  RecordSoundViewController.swift
//  UdacityPitchPerfect
//
//  Created by Poonam Bhadikar on 12/02/19.
//  Copyright © 2019 poonam-bhadikar. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController,AVAudioRecorderDelegate {

    @IBOutlet var stopRecordingButton: UIButton!
    @IBOutlet var RecordingLabel: UILabel!
    @IBOutlet var recordButton: UIButton!
    
    var audioRecorder: AVAudioRecorder!

    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.isEnabled = false;
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View will Appear is called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("View did Appear is called")

    }

    @IBAction func RecordAudio(_ sender: Any) {
        print("Button was pressed");
        RecordingLabel.text = "Recording in progress!"
        recordButton.isEnabled = false;
        stopRecordingButton.isEnabled = true;
    
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String;
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string:pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings:[:]);

        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
       
        //To listen or say subscribe to delegatae
        audioRecorder.delegate = self
        
//        audioRecorder = AVAudioSessio
//        if let audioRecorder = AVAudioRecorder(url: filePath, settings:[:])
        
        
    }
    
    @IBAction func StopRecording(_ sender: Any) {
        recordButton.isEnabled = true;
        stopRecordingButton.isEnabled = false;
        RecordingLabel.text = "Tap to Record"
        
        audioRecorder.stop();
        let audioSesion = AVAudioSession.sharedInstance()
        try! audioSesion.setActive(false)
        print("stop recording was pressed")
        
        
    }
    
    //This is from AVAudioRecorderDelegate
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag
        {
            //Programatically navigating to second controller 1. Added seques from sound controller to second controller in storyboard (Add identifier to segue also)(//show)
            // then add following code (this will only navigate to second controller associated with segue identifier)
            performSegue(withIdentifier: "stopRecordingSegue", sender: audioRecorder.url)
        }
        else
        {
            print("Recording was not succesful")
        }
        print("Finished Recording")
        
    }
    //We call prepare  from first view controller and not the second one
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecordingSegue"
        {
            let playSoundVC = segue.destination as! PlaySoundsViewController
            let recordedURLFromSender = sender as! URL
            playSoundVC.recordedAudioUrl = recordedURLFromSender
        }
    }
}

