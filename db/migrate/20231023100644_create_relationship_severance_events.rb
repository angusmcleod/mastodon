# frozen_string_literal: true

class CreateRelationshipSeveranceEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :relationship_severance_events do |t|
      t.integer :type, null: false

      t.timestamps
    end
  end
end
