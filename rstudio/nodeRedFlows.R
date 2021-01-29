## [2021-01-28-04:01]
## Christopher Grant

library(websocket)

ws <- WebSocket$new("ws://nodeRED:1880/ws/listener")

## Handle WebSocket events
ws$onMessage(function(event) {
  cat("Client got msg:", event$data, "\n")
})
ws$onClose(function(event) {
  cat("Client disconnected\n")
})
ws$onOpen(function(event) {
  cat("Client connected\n")
})

## Create messages to send over the WebSocket
msg <- paste0("Message sent: " , as.character(Sys.time()))
ws$send(msg)
ws$send(toString(as.character(rnorm(10))))

## Close the connection
ws$close()

