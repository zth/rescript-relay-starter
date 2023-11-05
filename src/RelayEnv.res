let preparedAssetsMap: RelayRouter.AssetPreloader.preparedAssetsMap = Dict.make()

let network = RescriptRelay.Network.makePromiseBased(~fetchFunction=NetworkUtils.fetchQuery)

let environment = RescriptRelay.Environment.make(
  ~network,
  ~store=RescriptRelay.Store.make(
    ~source=RescriptRelay.RecordSource.make(),
    ~gcReleaseBufferSize=50,
    ~queryCacheExpirationTime=6 * 60 * 60 * 1000,
  ),
)
