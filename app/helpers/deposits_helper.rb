module DepositsHelper

  def translate_deposit_one(key_value)
    t("activerecord.models.deposit.#{key_value}")
  end

  def translate_deposit_others(key_value)
    t("activerecord.models.deposit.#{key_value}")
  end  

end
