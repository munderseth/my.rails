require 'net/imap'
require 'mail'

def read_emails
  imap = Net::IMAP.new('imap.mail.us-east-1.awsapps.com', ssl: true)
  imap.login('notice@stridespace.com', 'myEmail-01')
  imap.select('INBOX')

  #####
  # imap = Net::IMAP.new('box2411.bluehost.com') # remove ssl: true
  # imap.login('bounce@testspace.com', 'myEmail-01')
  # imap.select('INBOX')
  #####

  # Get the number of messages in the mailbox
  mailbox_status = imap.status('INBOX', ["MESSAGES"])
  puts "Number of messages in the mailbox: #{mailbox_status["MESSAGES"]}"

  # Get the number of unseen messages in the mailbox
  unseen_messages = imap.search(["UNSEEN"])
  puts "Number of unseen messages in the mailbox: #{unseen_messages.count} \n"

  # Get the number of recent messages in the mailbox (Does not work with AWS)
  #mailbox_status = imap.status('INBOX', ["RECENT"])
  #puts "Number of recent messages in the mailbox: #{mailbox_status["RECENT"]}"

  unseen_messages.last(20).each do |message_id|
    envelope = imap.fetch(message_id, "ENVELOPE")[0].attr["ENVELOPE"]
    body = imap.fetch(message_id, "BODY[TEXT]")[0].attr["BODY[TEXT]"]
    flags = imap.fetch(message_id, "FLAGS")[0].attr["FLAGS"]
    mail = Mail.read_from_string(body)

    puts "From: #{envelope.from[0].name}"
    puts "Subject: #{envelope.subject}"
    puts "Flags: #{flags}"
    puts "Body: #{mail.body.decoded}"
  end

  imap.logout
  imap.disconnect
end

puts "READ EMAILS"
read_emails