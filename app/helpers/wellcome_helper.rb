module WellcomeHelper

  def translate_wellcome_one(key_value)
    t("activerecord.models.wellcome.#{key_value}")
  end

  def translate_wellcome_others(key_value)
    t("activerecord.models.wellcome.#{key_value}")
  end  

end
