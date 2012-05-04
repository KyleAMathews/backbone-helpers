exports.FormatTimestamps =

  formatTimestamps: (selector = ".timestamp") ->
    clearInterval(@intervalID)
    timestamp = @$(selector).text()
    now = moment()
    format = =>
      if Math.abs(moment(timestamp).diff(now)) > 1209600 # two weeks
        @$(selector).text(moment(timestamp).format('MMMM D, YYYY'))
      else
        @$(selector).text(moment(timestamp).fromNow())
    format()
    @intervalID = setInterval(format, 20000) # run every 20 seconds.
