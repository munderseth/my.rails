require 'net/imap'
require 'mail'

def read_emails
  imap = Net::IMAP.new('imap.mail.us-east-1.awsapps.com', ssl: true)
  imap.login('notice@stridespace.com', 'myEmail-01')
  imap.select('INBOX')

  # Get the number of messages in the mailbox
  mailbox_status = imap.status('INBOX', ["MESSAGES"])
  puts "Messages in the mailbox:  #{mailbox_status["MESSAGES"]}"

  #messages = imap.search(["UNSEEN"]) # Note, "RECENT" does not work with AWS
  messages = imap.search(["ALL"])
  puts "Messages being processed: #{messages.count} \n"

  messages.last(20).each do |message_id|
    envelope = imap.fetch(message_id, "ENVELOPE")[0].attr["ENVELOPE"]
    body = imap.fetch(message_id, "BODY[TEXT]")[0].attr["BODY[TEXT]"]
    flags = imap.fetch(message_id, "FLAGS")[0].attr["FLAGS"]
    mail = Mail.read_from_string(body)
    mail_data = imap.fetch(message_id, "BODY[]")[0].attr["BODY[]"]

    puts "From: #{envelope.from[0].name}"
    puts "Subject: #{envelope.subject}"
    puts "Flags: #{flags}"
    puts "Body: #{mail.body.decoded}"
    puts ""
    puts "------------- MAIL DATA ----------------------\n\n"
    puts mail_data
  end

  imap.logout
  imap.disconnect
end

puts "READ EMAILS"
read_emails