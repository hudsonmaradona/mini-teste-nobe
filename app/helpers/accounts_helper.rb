module AccountsHelper

  def translate_account_one(key_value)
    t("activerecord.models.account.#{key_value}")
  end

  def translate_account_others(key_value)
    t("activerecord.models.account.#{key_value}")
  end  

end
