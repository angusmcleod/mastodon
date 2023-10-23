# frozen_string_literal: true

# == Schema Information
#
# Table name: relationship_severance_events
#
#  id         :bigint(8)        not null, primary key
#  type       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class RelationshipSeveranceEvent < ApplicationRecord
  self.inheritance_column = nil

  has_many :severed_relationships, inverse_of: :relationship_severance_event, dependent: :delete_all

  enum type: {
    domain_block: 0,
  }

  def import_from_follows!(follows)
    SeveredRelationship.insert_all( # rubocop:disable Rails/SkipsModelValidations
      follows.pluck(:account_id, :target_account_id, :show_reblogs, :notify, :languages).map do |attributes|
        attributes.merge(relationship_severance_event_id: id)
      end
    )
  end
end
