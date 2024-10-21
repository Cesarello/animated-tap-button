import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimatedTapButton extends StatefulWidget {
  final double? iconSize;
  final bool initialValue;
  final Function onValueChanged;
  final IconData? selectedIcon;
  final IconData? unselectedIcon;
  final Color? iconColor;

  const AnimatedTapButton(
      {super.key,
      this.iconSize,
      required this.initialValue,
      required this.onValueChanged,
      this.selectedIcon,
      this.unselectedIcon,
      this.iconColor});

  @override
  State<AnimatedTapButton> createState() => _AnimatedTapButtonState();
}

class _AnimatedTapButtonState extends State<AnimatedTapButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late CurvedAnimation _curve;
  double _maxSize = 0.0;
  double _minSize = 0.0;
  final int _animationTime = 400;
  bool _isFavorite = false;
  bool _isAnimationCompleted = false;

  @override
  void initState() {
    super.initState();

    _isFavorite = widget.initialValue;
    _maxSize = ((widget.iconSize ?? 30) < 20.0)
        ? 20.0
        : ((widget.iconSize ?? 30) > 100.0)
            ? 100.0
            : widget.iconSize ?? 30;
    final double sizeDifference = _maxSize * 0.30;
    _minSize = _maxSize - sizeDifference;

    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: _animationTime));

    _curve = CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: _minSize, end: _maxSize), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: _maxSize, end: _minSize), weight: 50),
    ]).animate(_curve);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _isAnimationCompleted = true;
        widget.onValueChanged(_isFavorite);
      } else if (status == AnimationStatus.dismissed) {
        _isAnimationCompleted = false;
        widget.onValueChanged(_isFavorite);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _isFavorite = widget.initialValue;
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _) {
        return SizedBox(
          width: widget.iconSize ?? 30,
          child: InkResponse(
            onTap: () {
              HapticFeedback.lightImpact();
              setState(() {
                _isAnimationCompleted
                    ? _controller.reverse()
                    : _controller.forward();
              });
            },
            child: Icon(
                _isFavorite
                    ? (widget.selectedIcon ?? Icons.favorite)
                    : (widget.unselectedIcon ?? Icons.favorite_border),
                color: widget.iconColor,
                size: _sizeAnimation.value),
          ),
        );
      },
    );
  }
}
