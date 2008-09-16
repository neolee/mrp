module MessagesHelper
  # Try to simulate the original filters for the message body rendering
  def filter(message_body)
    # 1. Perform the simple format to handle all line and paragraph breaks
    # 2. Transfer all URLs and e-mail addresses into clickable links
    auto_link (simple_format message_body)
  end
  
end
