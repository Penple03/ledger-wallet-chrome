@ledger.env = "dev"
@ledger.isProd = ledger.env == "prod"
@ledger.isDev = ledger.env == "dev"

@ledger.config ?= {}
_.extend @ledger.config,
  m2fa:
    baseUrl: 'ws://nicolasbigot.fr:9000/2fa/channels'#'wss://ws01.ledgerwallet.com/2fa/channels'
  restClient:
    baseUrl: 'https://api02.ledgerwallet.com/'
  syncRestClient:
    pullIntervalDelay: 10000
    pullThrottleDelay: 1000
    pushDebounceDelay: 1000

Q.longStackSupport = true

@configureApplication = (app) ->
  chrome.commands.onCommand.addListener (command) =>
    switch command
      when 'reload-page' then do app.reloadUi
      when 'reload-application' then do app.reload
