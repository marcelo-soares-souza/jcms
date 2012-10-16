class License < ActiveRecord::Base
  has_many :texts
  has_many :images

  validates_uniqueness_of :name

  validates :name, :presence => true,
                   :length => { :minimum => 2, :maximum => 254 }

  validates :description, :presence => true,
                          :length => { :minimum => 5, :maximum => 254 }

  validates :url, :presence => true,
                  :length => { :minimum => 5, :maximum => 254 }

  before_destroy :verify_contents

  private

  def verify_contents
    self.errors.add :base, I18n.t('This register has dependents')
    raise ActiveRecord::RecordInvalid.new self unless (texts.count == 0 && images.count == 0)
  end
end
