module Completed

  extend ActiveSupport::Concern

  VALID_STATUSES = ['Completed', 'Incomplete']

  included do
    validates :status, inclusion: {in: VALID_STATUSES}
  end


  def done

    status = 'Incomplete'

  end

end