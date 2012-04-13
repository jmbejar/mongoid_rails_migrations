class DataMigration

  def self.versions
    migration_collection.find
  end

  def self.down(version)
    migration_collection.remove({:version => version})
  end

  def self.up(version)
    migration_collection.save({:version => version})
  end

  def self.migration_collection
    #Mongoid.master.collection('migration_info')
    MongoDB.connection.collection('migration_info')
  end
end
