# frozen_string_literal: true

class Player < ApplicationRecord
  # frozen_string_literal: true.
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :campaigns

  def titled_name
    master? ? "Mestre #{name}" : "Jogador #{name}"
  end
end
