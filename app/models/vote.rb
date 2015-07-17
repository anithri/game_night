# == Schema Information
#
# Table name: votes
#
#  id            :integer          not null, primary key
#  vote          :boolean          default(FALSE), not null
#  voteable_id   :integer          not null
#  voteable_type :string           not null
#  voter_id      :integer
#  voter_type    :string
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  fk_one_vote_per_user_per_entity               (voter_id,voter_type,voteable_id,voteable_type) UNIQUE
#  index_votes_on_voteable_id_and_voteable_type  (voteable_id,voteable_type)
#  index_votes_on_voter_id_and_voter_type        (voter_id,voter_type)
#

class Vote < ActiveRecord::Base

  scope :for_voter, lambda { |*args| where(["voter_id = ? AND voter_type = ?", args.first.id, args.first.class.base_class.name]) }
  scope :for_voteable, lambda { |*args| where(["voteable_id = ? AND voteable_type = ?", args.first.id, args.first.class.base_class.name]) }
  scope :recent, lambda { |*args| where(["created_at > ?", (args.first || 2.weeks.ago)]) }
  scope :descending, lambda { order("created_at DESC") }

  belongs_to :voteable, :polymorphic => true
  belongs_to :voter, :polymorphic => true

  attr_accessible :vote, :voter, :voteable if ActiveRecord::VERSION::MAJOR < 4


  # Comment out the line below to allow multiple votes per user.
  validates_uniqueness_of :voteable_id, :scope => [:voteable_type, :voter_type, :voter_id]

end
