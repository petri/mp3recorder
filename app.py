import sys

from wxPython.wx  import *
from wxPython.xrc import *

from recorder import Recorder, RECORDING, STOPPED

GUI_FILENAME       = "wxRecorder.xrc"
GUI_MAINFRAME_NAME = "main_frame"


class MainFrame(wxFrame):
   pass
   
class MyApp( wxApp ):
   def OnInit( self ):
      self.recorder=Recorder()
      self.res   = wxXmlResource( GUI_FILENAME )
      self.frame = self.res.LoadFrame( None, GUI_MAINFRAME_NAME )
      self.frame.Show()
        
      EVT_BUTTON(self.frame, XRCID("button_quit"), self.onClick)
      EVT_BUTTON(self.frame, XRCID("button_start"), self.onClick)
      EVT_BUTTON(self.frame, XRCID("button_stop"), self.onClick)

      in_src = XRCCTRL(self.frame, "choice_inputsource")
      for n in self.recorder.getDeviceNames():
         in_src.Append(n)
      in_src.SetSelection(0)
      
      self.frame.Bind(EVT_IDLE, self.onIdle)
      
      return 1

   def onIdle(self, evt):
      if self.recorder.status == RECORDING:
         self.recorder.process()
         XRCCTRL(self.frame, "main_frame_statusbar").SetStatusText("bytes written: " +str(self.recorder.bytesWritten()),0)
      evt.Skip()
        
   def onClick(self, evt):
      btn = evt.GetEventObject()
      name = evt.GetEventObject().GetName()
       
      if name == "button_start":
         self.startRecording()
         btn.Disable()
         XRCCTRL(self.frame, "button_stop").Enable()
          
      elif name == "button_stop":
         self.stopRecording()
         btn.Disable()
         XRCCTRL(self.frame, "button_start").Enable()

      else:
         self.quitApplication()
         
   def quitApplication(self):
      self.frame.Close(true)
       
   def startRecording(self):
      self.recorder.setDevice(XRCCTRL(self.frame, "choice_inputsource").GetStringSelection())
      
      file = wxFileSelector("Select file to save mp3 audio to")
      self.recorder.start(open(file,"wb"))
       
   def stopRecording(self):
      self.recorder.stop()
       
if __name__ == '__main__':
   
   app = MyApp()
   #app.recorder = Recorder()
   app.MainLoop()