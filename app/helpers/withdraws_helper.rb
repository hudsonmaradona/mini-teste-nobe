module WithdrawsHelper

  def translate_withdraw_one(key_value)
    t("activerecord.models.withdraw.#{key_value}")
  end

  def translate_withdraw_others(key_value)
    t("activerecord.models.withdraw.#{key_value}")
  end  

end
