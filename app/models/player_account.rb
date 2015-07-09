# == Schema Information
#
# Table name: player_accounts
#
#  id                     :uuid             not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_player_accounts_on_confirmation_token    (confirmation_token) UNIQUE
#  index_player_accounts_on_email                 (email) UNIQUE
#  index_player_accounts_on_reset_password_token  (reset_password_token) UNIQUE
#

class PlayerAccount < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :player, inverse_of: :player_account

  accepts_nested_attributes_for :player,
                                allow_destroy: true,
                                reject_if: proc { |attributes| attributes[:name].blank? }

end
