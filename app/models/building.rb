class Building < ApplicationRecord
  belongs_to :onwer, polymorphic: true

  def onwer_sgid=(value)
    self.onwer = GlobalID::Locator.locate_signed(value)
  end
end
