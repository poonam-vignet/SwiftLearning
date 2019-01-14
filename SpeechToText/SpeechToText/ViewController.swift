//
//  ViewController.swift
//  SpeechToText
//
//  Created by Poonam Bhadikar on 17/11/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit
import Speech

class ViewController: UIViewController,SFSpeechRecognizerDelegate {

    var audioEngine = AVAudioEngine()
    var speechRecognizer:SFSpeechRecognizer? = SFSpeechRecognizer()
    var request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask = SFSpeechRecognitionTask()
    
    
    @IBAction func StartTapped(_ sender: Any)
    {
         self.DetectedText.text = "Detected text";
         audioEngine.inputNode.removeTap(onBus: 0)
         audioEngine = AVAudioEngine()
         speechRecognizer = SFSpeechRecognizer()
         request = SFSpeechAudioBufferRecognitionRequest()
         recognitionTask = SFSpeechRecognitionTask()

        recordAndRecognizeSpeech()
    }
    func recordAndRecognizeSpeech()
    {
        let node = audioEngine.inputNode
        let recordingFormat = node.outputFormat(forBus: 0)
        node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat)
        {
            buffer,_ in self.request.append(buffer)
        }
        
        
        audioEngine.prepare()
                do{
                    try audioEngine.start()
                }catch{
                    return print(error)
                }
        
        guard let myRecognizer = SFSpeechRecognizer() else {
            print("Speech recognizer not initialted correctly ,returning")

            return
        }
        if !myRecognizer.isAvailable
        {
            print("recognizer not available , returning")
            return
        }
        
        
        recognitionTask = (speechRecognizer?.recognitionTask(with: request, resultHandler: {result,
            error in if let result = result{
                let bestString = result.bestTranscription.formattedString
                self.DetectedText.text = bestString
            }else if let error = error {
                print(error)
            }
        }))!
        
    }
    
    @IBOutlet var DetectedText: UILabel!
    @IBOutlet var StartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

