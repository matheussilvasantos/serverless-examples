require "json"
require "aws-sdk-sqs"

def process(event:, context:)
  sqs = Aws::SQS::Client.new
  queue_url = sqs.get_queue_url(queue_name: ENV["QUEUE_NAME"]).queue_url

  # It will send a message with an email for example
  message = sqs.send_message(
    queue_url: queue_url,
    message_body:  event["body"]["email"]
  )

  message.message_id
end
