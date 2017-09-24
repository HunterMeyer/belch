module CsvLoader
  def load_from_csv(path)
    RemoteTable.new(path, headers: true).rows.each do |row|
      next if exists?(external_id: row['id'])
      create!(row.replace_keys!(mappings))
    end
  end
end
