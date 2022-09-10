# frozen_string_literal: true

class User < ApplicationRecord
  has_one :author
  has_many :comment

  validates :username, :phone_number, :email, presence: true
  validates :email, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, uniqueness: true,
                           numericality: true,
                           length: { in: 10..15 },
                           format: { with: /\d[0-9]\)*/, message: 'only positive number without spaces are allowed' }
  validates :username, length: { maximum: 20 }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
end
