# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.

# Create sample chats
general_chat = Chat.find_or_create_by!(name: "General")
random_chat = Chat.find_or_create_by!(name: "Random")
dev_chat = Chat.find_or_create_by!(name: "Development")

# Create sample messages
unless general_chat.messages.any?
  general_chat.messages.create!([
    {
      content: "Hey everyone! Welcome to the general chat 👋",
      sender_name: "Alice"
    },
    {
      content: "Thanks! This looks great. Love the iMessage-style interface!",
      sender_name: "Bob"
    },
    {
      content: "Agreed! The bubbles look perfect. Great work on the design.",
      sender_name: "Carol"
    },
    {
      content: "Can we add more emoji reactions? Maybe some custom ones?",
      sender_name: "Dave"
    }
  ])
end

unless random_chat.messages.any?
  random_chat.messages.create!([
    {
      content: "Did anyone see that new movie that came out?",
      sender_name: "Eve"
    },
    {
      content: "Which one are you talking about?",
      sender_name: "Frank"
    },
    {
      content: "I think they mean the sci-fi one with the robots",
      sender_name: "Grace"
    }
  ])
end

unless dev_chat.messages.any?
  dev_chat.messages.create!([
    {
      content: "Just pushed the new chat feature. Ready for testing!",
      sender_name: "Developer"
    },
    {
      content: "Sweet! I love the real-time updates with Turbo.",
      sender_name: "QA Tester"
    },
    {
      content: "The reactions feature is working perfectly. Nice work!",
      sender_name: "Designer"
    }
  ])
end

# Add some sample reactions
if general_chat.messages.any? && general_chat.messages.first.reactions.empty?
  first_message = general_chat.messages.first
  first_message.reactions.create!([
    { emoji: "👍", sender_name: "Bob" },
    { emoji: "❤️", sender_name: "Carol" },
    { emoji: "👍", sender_name: "Dave" }
  ])
end

puts "Created #{Chat.count} chats with #{Message.count} messages and #{Reaction.count} reactions"
