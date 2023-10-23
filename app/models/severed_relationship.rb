# frozen_string_literal: true

# == Schema Information
#
# Table name: severed_relationships
#
#  id                              :bigint(8)        not null, primary key
#  relationship_severance_event_id :bigint(8)        not null
#  account_id                      :bigint(8)        not null
#  target_account_id               :bigint(8)        not null
#  show_reblogs                    :boolean
#  notify                          :boolean
#  languages                       :string           is an Array
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#
class SeveredRelationship < ApplicationRecord
  belongs_to :relationship_severance_event
  belongs_to :account
end
