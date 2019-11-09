require "spec_helper"

describe "Url" do
  describe "#sanitize" do
    it "removes blanks and www of long_url and appends http://" do
      url = Url.new(long_url: " www.abc.com")

      expect(url.sanitize).to eq "http://abc.com"
    end
  end

  describe "#sanitize_and_assign_url" do
    it "assigns url with short_url" do
      url = Url.new(long_url: " www.abc.com")
      url.sanitize_and_assign_url

      expect(url.short_url).not_to be_nil
      expect(url.long_url).to eq "http://abc.com"
    end
  end
end
