import 'package:flutter/widgets.dart';

/// (Flutter / Dart) typedefs
// VoidCallback: A callback that takes no arguments and returns no value. It's often used for event callbacks that don't need additional information.
// ValueChanged<T>: A generic callback that takes a single argument of type <T>. It's useful for passing data or state through callbacks.
// ValueSetter<T>: Similar to ValueChanged<T>, but used when the goal is to set a value rather than simply notify a change.
// ValueGetter<T>: A callback that takes no arguments but returns a value of type <T>. It's useful for dynamically obtaining a value.
// AsyncCallback: A callback that returns a Future<void>. It's used for asynchronous functions that don't return a useful value but need to be awaited.
// TimerCallback: A specific type of function used with timers (Timer) in Dart, which takes no arguments and returns no value.
// FrameCallback: Used with SchedulerBinding to execute code in sync with the passing of screen frames. It takes a single Duration argument indicating the frame timing.
// DragStartBehavior: Not a callback, but an enum used in various widgets to determine how drag gestures should be handled.
// AnimationStatusListener: A listener that is called when the status of an animation changes. It takes an AnimationStatus argument.
// TickerProvider: An interface used to create Tickers, which are the hearts of animations. Not a callback per se, but a crucial part of the animation system.
// RoutePredicate: Used to make decisions based on routes, such as in Navigator.popUntil. It takes a Route as an argument and returns a bool.
// LayoutWidgetBuilder: Used in widgets that apply layout, like CustomMultiChildLayout. It takes a BuildContext and a Size as arguments, returning a Size

/// Custom typedefs
typedef WidgetBuilderCallback = Widget Function(Widget child);
// A callback that synchronously fetches a list of items of type T.
typedef ListFetcherCallback<T> = List<T> Function();
// A callback for asynchronously fetching a list of items of type T, returning a Future of List<T>.
typedef AsyncListFetcherCallback<T> = Future<List<T>> Function();
// A callback for operations that take a dynamic list of arguments and return a result of type T.
typedef DynamicOperationCallback<T> = T Function(List<dynamic> args);
// A callback for asynchronous operations that take a dynamic list of arguments and return a Future of type T.
typedef AsyncDynamicOperationCallback<T> = Future<T> Function(
    List<dynamic> args);
// A callback for handling events with a map of parameters, executing synchronously.
typedef EventCallback = void Function(Map<String, dynamic> eventParams);
// A callback for handling events with a map of parameters, executing asynchronously and returning a Future.
typedef AsyncEventCallback = Future<void> Function(
    Map<String, dynamic> eventParams);
// A callback for filtering items of type T, used to determine if an item meets certain criteria.
typedef ItemFilterCallback<T> = bool Function(T item);
// A callback for asynchronously filtering items of type T, returning a Future<bool> to indicate if an item meets certain criteria.
typedef AsyncItemFilterCallback<T> = Future<bool> Function(T item);
// A callback for transforming an input of type T to an output of type U, performing synchronous operations.
typedef TransformerCallback<T, U> = U Function(T input);
// A callback for transforming an input of type T to an output of type U, performing asynchronous operations and returning a Future<U>.
typedef AsyncTransformerCallback<T, U> = Future<U> Function(T input);
// A callback for comparing two items of type T to determine their order, used for sorting.
typedef ComparatorCallback<T> = int Function(T a, T b);
// A callback for asynchronously comparing two items of type T to determine their order, returning a Future<int>.
typedef AsyncComparatorCallback<T> = Future<int> Function(T a, T b);
// A callback for handling changes in a specific value, notifying about the old and new values of type T.
typedef ValueChangeHandlerCallback<T> = void Function(T oldValue, T newValue);
// A callback for asynchronously handling changes in a specific value, notifying about the old and new values of type T and returning a Future.
typedef AsyncValueChangeHandlerCallback<T> = Future<void> Function(
    T oldValue, T newValue);
// A builder function that constructs widgets based on the given BuildContext and index, for synchronous operations.
typedef IndexedWidgetBuilderCallback = Widget Function(BuildContext context, int index);
// A builder function that constructs widgets based on the given BuildContext and index, for asynchronous operations, returning a Future<Widget>.
typedef AsyncIndexedWidgetBuilderCallback = Future<Widget> Function(
    BuildContext context, int index);
// A callback that validates a given input of type T and returns a boolean to indicate if the input meets the validation criteria.
typedef ValidatorCallback<T> = bool Function(T value);
// A callback that asynchronously validates a given input of type T, returning a Future<bool> to indicate if the input meets the validation criteria.
typedef AsyncValidatorCallback<T> = Future<bool> Function(T value);
