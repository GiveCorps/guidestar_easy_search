require 'spec_helper'

describe GuidestarEasySearch::Response do
  describe "When the response is successful" do
    subject { GuidestarEasySearch::Response.new { guidestar_successful_response } }

    it "sets the status to success" do
      expect(subject.status).to eql("success")
    end

    it "returns the organizations" do
      expect(subject.organizations).to eql(guidestar_successful_response.organizations)
    end
  end

  describe "When the response raises an exception" do
    subject { GuidestarEasySearch::Response.new { guidestar_exception } }

    it "sets the status to failure" do
      expect(subject.status).to eql("failure")
    end

    it "returns the error message" do
      expect(subject.message).to eql("A bad thing happened.")
    end

    it "returns the exception" do
      expect(subject.exception).not_to be_nil
    end
  end

end
