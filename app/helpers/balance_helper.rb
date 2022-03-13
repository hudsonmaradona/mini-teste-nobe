module BalanceHelper

  def translate_balance_one(key_value)
    t("activerecord.models.balance.#{key_value}")
  end

  def translate_balance_others(key_value)
    t("activerecord.models.balance.#{key_value}")
  end  

end
