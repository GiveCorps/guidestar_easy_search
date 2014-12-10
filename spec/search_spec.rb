require 'spec_helper'

describe GuidestarEasySearch::Search do
  let(:guidestar_credentials) { { username: 'fake@example.com', password: 'fake1234' } }
  before do
    Guidestar.username = 'fake@example.com'
    Guidestar.password = 'fake1234'
  end

  describe "Validations" do
    context "without a username or password" do
      before do
        Guidestar.username = nil
        Guidestar.password = nil
      end

      subject { GuidestarEasySearch::Search.new }

      it { expect { subject }.to raise_error(GuidestarEasySearch::Error::InvalidCredentials) }
    end

    context "without any options present" do
      subject { GuidestarEasySearch::Search.new }
      it { expect { subject }.to raise_error(GuidestarEasySearch::Error::OptionNotPresent) }
    end
  end

  describe "#search!" do
    describe "when an EIN is passed" do
      let(:guidestar_easy_search) { GuidestarEasySearch::Search.new(ein: "12345678", limit: 12) }
      subject { guidestar_easy_search.search! }

      it "searches by ein" do
        expect(Guidestar).to receive(:detailed_search).with(hash_including(ein: "12345678"))
        subject
      end

      it "does not pass the limit" do
        expect(Guidestar).not_to receive(:detailed_search).with(hash_including(limit: 12))
      end
    end

    describe "when a keyword is passed" do
      let(:guidestar_easy_search) { GuidestarEasySearch::Search.new(keyword: "kittens", limit: 12) }
      subject { guidestar_easy_search.search! }

      it "searches by keyword" do
        expect(Guidestar).to receive(:detailed_search).with(hash_including(keyword: "kittens"))
        subject
      end

      it "passes the limit" do
        expect(Guidestar).to receive(:detailed_search). with(hash_including(limit: 12))
        subject
      end
    end

    describe "when both a keyword and an EIN are passed" do
      let(:guidestar_easy_search) { GuidestarEasySearch::Search.new(keyword: "kittens", ein: "12345678") }
      subject { guidestar_easy_search.search! }

      it "priviliges the EIN" do
        expect(Guidestar).to receive(:detailed_search).with(hash_including(ein: "12345678"))
        subject
      end
    end
  end
end
