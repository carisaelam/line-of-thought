require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "welcome_email" do
    let(:user) { create(:user, email: 'test@example.com') }
    let(:mail) { UserMailer.welcome_email(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Welcome to Line of Thought!')
      expect(mail.to).to eq([ user.email ])
      expect(mail.from).to eq([ 'notifications@example.com' ])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match("Welcome, #{user.full_name}")
    end
  end
end
