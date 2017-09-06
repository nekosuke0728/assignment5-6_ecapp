require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do
  describe "confirmation_of_order" do
    let(:mail) { OrderMailer.confirmation_of_order }

    it "renders the headers" do
      expect(mail.subject).to eq("Confirmation of order")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
