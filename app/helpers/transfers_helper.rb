module TransfersHelper

  def translate_transfer_one(key_value)
    t("activerecord.models.transfer.#{key_value}")
  end

  def translate_transfer_others(key_value)
    t("activerecord.models.transfer.#{key_value}")
  end 

end
