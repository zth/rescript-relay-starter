module TodoFragment = %relay(`
  fragment SingleTodoDisplay_todo on TodoItem
  @refetchable(queryName: "SingleTodoDisplayRefetchQuery")
  @argumentDefinitions(showMore: { type: "Boolean", defaultValue: false }) {
    id
    text
    completed
    isShowingMore: id @include(if: $showMore)
  }
`)

module UpdateTodoItemMutation = %relay(`
  mutation SingleTodoDisplay_UpdateTodoItemMutation(
    $input: UpdateTodoItemInput!
  ) {
    updateTodoItem(input: $input) {
      updatedTodoItem {
        completed
      }
    }
  }
`)

@react.component
let make = (~todo) => {
  let (todo, refetch) = TodoFragment.useRefetchable(todo)
  let (mutate, isMutating) = UpdateTodoItemMutation.use()
  let (isRefetching, startTransition) = ReactExperimental.useTransition()
  let completed = todo.completed->Option.getWithDefault(false)
  let {setParams} = Routes.Root.Todos.Single.Route.useQueryParams()
  let isShowingMore = todo.isShowingMore->Option.isSome

  <div>
    <p> {React.string(todo.text)} </p>
    <div className="p-2"> {React.string(completed ? "Completed" : "Not completed")} </div>
    {if isShowingMore {
      <button
        className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
        disabled=isMutating
        onClick={_ => {
          mutate(
            ~variables={
              input: {
                id: todo.id,
                completed: !completed,
                text: todo.text,
              },
            },
          )->RescriptRelay.Disposable.ignore
        }}>
        {React.string(completed ? "Uncomplete" : "Complete")}
      </button>
    } else {
      <button
        disabled=isRefetching
        className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
        onClick={_ => {
          setParams(
            ~navigationMode_=Replace,
            ~setter=c => {...c, showMore: Some(true)},
            ~onAfterParamsSet=_ => {
              startTransition(() => {
                refetch(
                  ~variables=TodoFragment.makeRefetchVariables(~showMore=Some(true)),
                )->RescriptRelay.Disposable.ignore
              })
            },
          )
        }}>
        {React.string("Show more")}
      </button>
    }}
  </div>
}
