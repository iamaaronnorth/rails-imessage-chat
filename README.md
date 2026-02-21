# iMessage-Style Rails Chat App

A modern, real-time chat application built with Rails 8.1 that mimics the iMessage interface. Features real-time messaging, emoji reactions, and a clean sidebar navigation.

## 🎯 Features

- **iMessage-Style Interface**: Beautiful message bubbles with alternating alignment
- **Real-time Messaging**: Powered by Turbo Streams for instant updates
- **Emoji Reactions**: Click to add reactions (👍 ❤️ 😂 😮) to any message
- **Sidebar Navigation**: Clean chat room switcher just like iMessage
- **Responsive Design**: Works great on desktop and mobile
- **Multiple Chat Rooms**: Organize conversations into different channels

## 🚀 Live Demo

The app is running locally with sample data including:
- **General** - Welcome messages and design discussion
- **Random** - Casual conversation about movies
- **Development** - Tech team chat with feature updates

## 🛠 Technology Stack

- **Backend**: Rails 8.1 with Ruby 3.2.2
- **Database**: PostgreSQL
- **Real-time**: Turbo Streams (no JavaScript required!)
- **Styling**: Custom CSS with iMessage-inspired design
- **Bundling**: Vendor bundling for easy deployment

## 📦 Installation

### Prerequisites
- Ruby 3.2.2 (use `rbenv` or similar)
- PostgreSQL
- Node.js (for asset pipeline)

### Setup Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/iamaaronnorth/rails-imessage-chat.git
   cd rails-imessage-chat
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Setup database**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Start the server**
   ```bash
   rails server
   ```

5. **Visit the app**
   Open http://localhost:3000 in your browser

## 🎮 Usage

### Sending Messages
1. Select a chat room from the sidebar
2. Enter your name in the sender field
3. Type your message
4. Click "Send" or press Enter

### Adding Reactions
1. Hover over any message
2. Click one of the emoji buttons (👍 ❤️ 😂 😮)
3. Your reaction appears instantly with a count

### Switching Chats
- Click any chat name in the sidebar
- The active chat is highlighted in blue
- Messages load instantly with Turbo

## 🏗 Architecture

### Models
- **Chat**: Represents a chat room with a name
- **Message**: Belongs to a chat, has content and sender_name
- **Reaction**: Belongs to a message, has emoji and sender_name

### Key Features
- **Real-time Updates**: Turbo Streams provide instant UI updates
- **Message Bubbles**: CSS creates iMessage-style alternating bubbles
- **Reaction Grouping**: Messages show reaction counts grouped by emoji
- **Responsive Layout**: Flexbox-based layout adapts to screen size

### Database Schema
```ruby
# Chats
t.string :name, null: false

# Messages  
t.references :chat, foreign_key: true
t.text :content, null: false
t.string :sender_name, null: false
t.timestamps

# Reactions
t.references :message, foreign_key: true  
t.string :emoji, null: false
t.string :sender_name, null: false
t.timestamps
```

## 🎨 Customization

### Adding New Emoji Reactions
Edit `app/views/messages/_message.html.erb` and add new emoji buttons:

```erb
<%= link_to "🔥", message_reactions_path(message), method: :post, 
    params: { reaction: { emoji: "🔥", sender_name: "Anonymous" } },
    remote: true, class: "reaction-btn" %>
```

### Styling Changes
Main styles are in `app/assets/stylesheets/application.css`:
- `.chat-container` - Overall layout
- `.message` - Individual message bubbles  
- `.sidebar` - Left navigation panel
- `.reaction-badge` - Emoji reaction display

### Adding New Chat Features
The app structure makes it easy to add:
- User authentication (Devise ready)
- File attachments
- Message threading
- Push notifications
- Read receipts

## 📱 Mobile Responsive

The app includes responsive breakpoints:
- Sidebar collapses on narrow screens
- Message bubbles adapt to screen width
- Touch-friendly reaction buttons
- Optimized typography scaling

## 🚀 Deployment

The app is configured for easy deployment:

### Heroku
```bash
# Add to Procfile (already included)
web: bundle exec puma -C config/puma.rb
release: bundle exec rails db:migrate

# Deploy
git push heroku main
```

### Other Platforms
- Uses standard Rails 8 conventions
- PostgreSQL ready for production
- Asset pipeline configured
- Environment variables supported

## 🤝 Contributing

This is a demonstration app built to showcase:
- Rails 8.1 capabilities with Turbo
- iMessage-inspired UI design
- Real-time features without complex JavaScript
- Clean, maintainable code structure

Feel free to fork and extend with additional features!

## 📄 License

Open source - feel free to use this code for your own projects.

---

Built with ❤️ using Rails 8.1 and Turbo Streams