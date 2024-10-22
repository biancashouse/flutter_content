enum StepTypeEnum {
  Action,
  FuncCall,
  AsyncFuncCall,
  AwaitFuncCall,
  Loop,
  Decision,
  Switch,
  FuncReturn,
  Case,

  // screencast use...
  none,
  // clips
  video_clip,
  audio_clip,
  text_clip,
  lines_and_shapes_clip,
  freeze_frame_clip,
  // actions
  video_action,
  audio_action,
  video_motion_action,
  screen_recording_action,
  callout_action,
  touch_callout_action,
}
