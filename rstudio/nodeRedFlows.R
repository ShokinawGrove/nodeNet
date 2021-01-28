## [2021-01-28-04:01]
## Christopher Grant

library(websocket)

ws <- WebSocket$new("ws://nodeRED:1880/ws/receiveMessage")

ws$onMessage(function(event) {
  cat("Client got msg:", event$data, "\n")
})
ws$onClose(function(event) {
  cat("Client disconnected\n")
})
ws$onOpen(function(event) {
  cat("Client connected\n")
})

msg <- paste0("Message sent: " , as.character(Sys.time()))
ws$send(msg)
ws$close()
