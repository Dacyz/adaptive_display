# adaptive_display

A wrapper around BoxConstraints to make it more controlled, less indentable and reusable.

![short-gif-adaptive-display](https://github.com/user-attachments/assets/4af2d14f-14fe-42b0-9241-d5fc16bf78e9)

## Features

Use this plugin in your Flutter project to:

* **[Adaptive Stateful Widget](#adaptive-wrap-state-for-stateful-widget)**: Adaptive State for Stateful Widget.
* **[Adaptive StateLess Widget](#adaptive-stateless-widget)**: Adaptive Stateless Widget.
* **[Adaptive Widget](#adaptive-widget)**: Adaptive Widget with BoxConstrains values for Stateless Widget.
* **[Adaptive Wrap Widget](#adaptive-wrap-widget)**: Adaptive Widget with BoxConstrains values for Wrap build method on Stateless Widget.

> Below [more explain](#usage)

<details>
  <summary>Table of content</summary>

<!-- TOC -->
* [Get started](#getting-started)
* [Use](#usage)
  * [Adaptive Stateful Widget](#adaptive-wrap-state-for-stateful-widget)
  * [Adaptive StateLess Widget](#adaptive-stateless-widget)
  * [Adaptive Widget](#adaptive-widget)
  * [Adaptive Wrap Widget](#adaptive-wrap-widget)
* [Config](#config)
<!-- TOC -->
</details>

## Getting started

1. Add `adaptive_display` to your `pubspec.yaml`:

    ```yaml
    dependencies:
      adaptive_display: latest_version
    ```

2. Run `flutter pub get` to install.

3. If your widget uses `StatelessWidget`, replace it with one of the widgets below. If you are using `StatefulWidget`, you can switch the `State` class to `AdaptiveWrapState`.

4. Enjoy defining the designs of your project!

## Usage

This package add some builders to your **Stateful** and **Stateless** widgets

These builders have two types of UI definition:

* Default Build. [[Adaptive StateLess Widget](#adaptive-stateless-widget), [Adaptive Widget](#adaptive-widget)]
* Wrap Build. [[Adaptive Wrap State](#adaptive-wrap-state-for-stateful-widget), [Adaptive Wrap Widget](#adaptive-wrap-widget)]

For **Default Builders** we use a mobile-first approach, so our build method is the base build, then xs, followed by sm, and so on.

For **Wrap Builders** our build method wraps all the content, so you should define xs for first and call [adaptive] inside of your build method.

When you instantiate any of these widgets, you get **five optional builders** that are expected to build your view in cascade.

```dart
^ @override
│ Widget xs(BuildContext context) { ... }
│
│ @override
│ Widget sm(BuildContext context) { ... }
│
│ @override
│ Widget md(BuildContext context) { ... }
│
│ @override
│ Widget lg(BuildContext context) { ... }
│
│ @override
│ Widget xl(BuildContext context) { ... }
```

> Note: With `AdaptiveWidget` and `AdaptiveWrapWidget` you have access to constrains values 🤗
>
> ```dart
> @override
> Widget xs(BuildContext context, BoxConstraints constraints) { ... }
> ```

### Adaptive Wrap State for Stateful Widget

With this abstract widget you can combine adaptive display widget with stateful widget, you only need to add package and switch `State` class to `AdaptiveWrapState` for have access to builders.

```dart
class StatefulAdaptive extends StatefulWidget {
  const StatefulAdaptive({super.key});

  @override
// ⬇ here
  State<StatefulAdaptive> createState() => _StatefulAdaptiveState();
}
//                                    ⬇ and here
class _StatefulAdaptiveState extends State<StatefulAdaptive> {
    ...
}
```

Now you have access to adaptive, with is the widget with adaptive logic.

in your **build** method should add adaptive.

```dart
  ...
  @override
  AdaptiveWrapState<StatefulAdaptive> createState() => _StatefulAdaptiveState();
}

class _StatefulAdaptiveState extends AdaptiveWrapState<StatefulAdaptive> {

  @override
  Widget build(BuildContext context) {
    return adaptive; // You should call [adaptive] here. 
                     // You can wrap it with any widget.
                     // on [AdaptiveStateLessWidget], [xs] is default widget
  }

  @override
  // By making the build method capable of wrapping the logic, 
  // the xs method becomes mandatory and is the first method to be called.
  Widget xs(BuildContext context) { ... } // Make your custom UI
  ...
```

### Adaptive StateLess Widget

For `AdaptiveStatelessWidget` you should replace it from `StatelessWidget`

```dart
//                                ⬇ here
class StateLessAdaptive extends StateLessWidget {
  ...
}
```

with this widget you **shouldn't call `adaptive`** on your build method, instead, it applies the logic in the widget tree on its own, in this case whatever is built in the build method will be the default widget.

```dart
class StateLessAdaptive extends AdaptiveStateLessWidget {

@override
  Widget build(BuildContext context) {
    ... // You shouldn't call [adaptive] here.
        // the logic applies itself,
        // on [AdaptiveStateLessWidget], [build] is default widget
  }
  ...
```

### Adaptive Widget

It maintains the same `AdaptiveStateLessWidget`'s logic, however in each construction method it allows us to access the constraints values.
You should **be careful** if you decide to call **"adaptive"** in your build method.

```dart
//                                ⬇ here
class StateLessAdaptive extends StateLessWidget {
  ...
}
```

so you can use your other validations.

```dart
class StateLessAdaptive extends AdaptiveWidget {
  @override
  Widget xs(BuildContext context, BoxConstraints constraints) {
    final text = 'XS! ${constraints.maxWidth} value';
    return Center(child: Text(text, style: textStyle));
  }
}
```

### Adaptive Wrap Widget

It maintains the same `AdaptiveWrapState`'s logic, but for `StatelessWidget`. Also you have constraints values on your build methods.

## Config

In this package the default values are:

| Size     | Width |
| -------- | ------- |
| Extra small (xs) | 480 px |
| Small (sm) | 768 px |
| Medium (md) | 1024 px |
| Large (lg) | 1440 px |
| Extra large (xl) | 1920 px |

You can change the breakpoints by calling the `Adaptive.setDefault()` method in the `main` method. However, you must follow certain rules when setting the values. These rules are:

XL must be greater than LG
LG must be greater than MD
MD must be greater than SM
SM must be greater than XS
XS must be greater than 0

```dart
void main() {
  Adaptive.setDefault(xs: 420.0, xl: 1820.0); // xs, sm, md, lg, xl
}
```
