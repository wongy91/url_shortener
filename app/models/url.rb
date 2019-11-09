class Url < ApplicationRecord
  validates :long_url, presence: true
  validates_format_of :long_url, with: /.(com|edu|org|net|gov|mil|biz|info)$\z/i, if: -> { long_url.present? }
  validates_length_of :short_url, minimum: 2

  def generate_and_assign_url
    self.long_url = self.sanitize
    existing_url = Url.where(long_url: long_url).take

    return existing_url if existing_url
    self.short_url = generate_short_url
    self
  end


  def generate_short_url
    loop do
      @generated_short_url = "#{SecureRandom.hex(Random.rand(1..5))}"
      break if !Url.where(short_url: @generated_short_url).exists?
    end

    @generated_short_url
  end

  def sanitize
    long_url.strip!
    sanitize_url = self.long_url.downcase.gsub(/(https?:\/\/)|(www\.)/,"")
    "http://#{sanitize_url}"
  end
end
