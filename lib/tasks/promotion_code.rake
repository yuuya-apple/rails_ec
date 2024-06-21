# frozen_string_literal: true

namespace :promotion_code do
  desc ' 10 promo_codes'
  task generate: :environment do
    10.times do
      promo_code = PromoCode.new
      promo_code.discount_code = SecureRandom.alphanumeric(7)
      promo_code.discount_price = rand(100...1000)
      promo_code.save
    end
  end
end
