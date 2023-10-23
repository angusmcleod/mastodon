# frozen_string_literal: true

class CreateSeveredRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :severed_relationships do |t|
      t.references :relationship_severance_event, null: false, foreign_key: { on_delete: :cascade }
      t.references :account, null: false, foreign_key: { on_delete: :cascade }
      t.references :target_account, null: false, foreign_key: { to_table: :accounts, on_delete: :cascade }

      t.boolean :show_reblogs
      t.boolean :notify
      t.string :languages, array: true

      t.timestamps

      t.index [:relationship_severance_event_id, :account_id, :target_account_id], name: 'index_severed_relationships_by_event_account_and_target_account', unique: true
    end
  end
end
