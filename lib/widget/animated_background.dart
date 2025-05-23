import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

mixin RenderObjectAnimationMixin on RenderObject {
  double _progress = 0;
  int? _lastTimeStamp;

  Duration get duration => const Duration(milliseconds: 200);
  AnimationStatus _animationStatus = AnimationStatus.completed;

  set animationStatus(AnimationStatus v) {
    if (_animationStatus != v) {
      markNeedsPaint();
    }
    _animationStatus = v;
  }

  double get progress => _progress;

  set progress(double v) {
    if (_progress != v) {
      _progress = v.clamp(0, 1);
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    doPaint(context, offset);
    _scheduleAnimation();
  }

  ///调度动画
  void _scheduleAnimation() {
    if (_animationStatus != AnimationStatus.completed) {
      SchedulerBinding.instance.addPostFrameCallback((Duration timeStamp) {
        if (_lastTimeStamp != null) {
          double delta =
              (timeStamp.inMilliseconds - _lastTimeStamp!) /
              duration.inMilliseconds;

          if (delta == 0) {
            markNeedsPaint();
            return;
          }
          if (_animationStatus == AnimationStatus.reverse) {
            delta = -delta;
          }
          _progress = _progress + delta;
          if (_progress >= 1 || _progress <= 0) {
            _animationStatus = AnimationStatus.completed;
            _progress = _progress.clamp(0, 1);
          }
        }
        markNeedsPaint();
        _lastTimeStamp = timeStamp.inMilliseconds;
      });
    } else {
      _lastTimeStamp = null;
    }
  }

  // 子类实现绘制逻辑的地方
  void doPaint(PaintingContext context, Offset offset);
}
