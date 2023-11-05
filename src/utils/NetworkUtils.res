let fetchQuery: RescriptRelay.Network.fetchFunctionPromise = async (
  operation,
  variables,
  _cacheConfig,
  _uploads,
) => {
  open Fetch

  let res = await fetch(
    "http://localhost:4000/graphql",
    {
      method: #POST,
      headers: Headers.fromArray([("content-type", "application/json")]),
      body: Body.string(
        {"query": operation.text, "variables": variables}
        ->JSON.stringifyAny
        ->Option.getWithDefault(""),
      ),
      credentials: #"same-origin",
    },
  )

  if res->Response.ok {
    await res->Response.json
  } else {
    Exn.raiseError("API error.")
  }
}
