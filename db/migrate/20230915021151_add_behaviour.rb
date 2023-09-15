class AddBehaviour < ActiveRecord::Migration[7.0]
  def change

    create_table :follows, force: true do |t|
      t.references :followable, polymorphic: true, null: false
      t.references :follower,   polymorphic: true, null: false
      t.boolean :blocked, default: false, null: false
      t.timestamps
    end

    add_index :follows, ["follower_id", "follower_type"],     name: "fk_follows"
    add_index :follows, ["followable_id", "followable_type"], name: "fk_followables"






  #   if ActiveRecord.gem_version >= Gem::Version.new('5.0')
  #     class ActsAsFollowerMigration < ActiveRecord::Migration["#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}"]; end
  #  else
  #     class ActsAsFollowerMigration < ActiveRecord::Migration; end
  #  end
  #  FollowableBehaviourMigration.class_eval do
  #  def self.up
  #    end
   
  #    def self.down
  #      drop_table :follows
  #    end
  #  end











  end


  


end
