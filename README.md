![Line of Thought Logo](/app/assets/images/logo.png)

## Line of Thought: A Minimalist Social Media App

**About**

Line of Thought is a minimalist social media app where every post is a single, impactful line. Users can share their thoughts, experiences, or goals but must keep each post to **a short line of text**—no more than 100 characters. Whether it's a fleeting idea or a profound statement, Line of Thought allows users to connect, inspire, and engage through the art of simplicity. Get creative, and **say more with less.**

**Key Features**

- **Single-line writing:** Share concise and impactful thoughts.
- **Community engagement:** Interact with other users through likes and comments.
- **Profile pages:** Showcase your writing and follow other users.

**Future Features**

- **Post highlights:** Discover popular and inspiring content.
- **Private/public mode:** Control the visibility of your posts.
- **Streak system:** Track your daily writing consistency.
- **Customizable reminders:** Stay motivated with personalized notifications.
- **Dynamic emojis:** Add personality to your posts.

**Technologies and Tools Used**

- Ruby on Rails
- PostgreSQL
- Devise
- Letter Opener
- RSpec
- Capybara
- Guard
- Faker
- Factory Bot

**Getting Started**

## Setup Instructions

To include instructions in your GitHub README for setting up the project on someone else's machine, you’ll want to provide clear, step-by-step guidance. Here's how you can structure the setup instructions, including how to handle database seeding:

---

## Setup Instructions

To get this project running on your local machine, follow these steps:

### Prerequisites

Ensure you have the following installed:

- **Ruby** (version 3.x)
- **Rails** (version 7.x)
- **Node.js**
- **Yarn**
- **PostgreSQL** (or your preferred database)
- **Redis** (if used)

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/carisaelam/line-of-thought.git
   ```

2. **Navigate into the project directory:**

   ```bash
   cd line-of-thought
   ```

3. **Install Ruby dependencies:**

   ```bash
   bundle install
   ```

4. **Install JavaScript dependencies:**

   ```bash
   yarn install
   ```

5. **Set up the database:**

   ```bash
   rails db:setup
   ```

   If you encounter errors related to existing records, you can reset the database:

   ```bash
   rails db:drop db:create db:migrate db:seed
   ```

   **Note**: If the seed file causes issues due to existing records, the `db:drop` command will delete all existing data. Adjust the seed file to handle duplicates if necessary.

6. **Precompile assets:**

   ```bash
   rails assets:precompile
   ```

7. **Run the development server:**

   ```bash
   rails server
   ```

8. **Open your browser**:
   Navigate to `http://localhost:3000` to view the application.

**Contributing**
Contributions are welcome! Please feel free to submit pull requests or issues.
