class Hash
  def replace_key!(old_key, new_key)
    return self unless key?(old_key)
    self[new_key] = delete(old_key)
    self
  end

  def replace_keys!(pairs)
    pairs.each do |old_key, new_key|
      replace_key!(old_key, new_key)
    end
    self
  end
end
