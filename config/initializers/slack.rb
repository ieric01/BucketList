require "slack"

Slack.configure do |config|
  config.token = ENV['SLACK_TOKEN']
end

Slack.auth_test
