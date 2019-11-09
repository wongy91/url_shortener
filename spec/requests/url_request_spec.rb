require "spec_helper"

describe "Url Request Controller", type: :request do
  describe "#show" do
    it "redirects to long_url if short_url is found" do
      url = Url.create(long_url: "http://google.com", short_url: "abcdef")

      get "/abcdef"
      expect(response).to have_http_status(302)
      expect(response.location).to eq url.sanitize
    end
  end

  describe "#create" do
    it "creates a new Url record" do
      post "/urls", params: { url: { long_url: "www.google.com" } }

      url = Url.last
      expect(url.long_url).to eq "http://google.com"
      expect(url.short_url).not_to be_nil

      expect(response.location).to eq "http://www.example.com/urls/new?short_url=#{url.short_url}"
    end

    it "does not create a new url if long_url is invalid" do
      post "/urls", params: { url: { long_url: "invalid_url" } }

      expect(Url.count).to eq 0
      expect(response.location).to eq "http://www.example.com/urls/new"
    end
  end
end
