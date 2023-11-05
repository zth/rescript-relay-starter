/**
 * Important note on this module:
 * As soon as React provides a mechanism for error-catching using functional component,
 * this is likely to be deprecated and/or move to user space.
 */
@dead
type info = {componentStack: string}

@dead
type params<'error> = {
  error: 'error,
  info: info,
}

@react.component
let make: (~children: React.element, ~fallback: params<'error> => React.element) => React.element
