class Booking < ApplicationRecord
  belongs_to :rental
  validates_presence_of :start_at, :end_at, :client_email, :price

  before_create :check_date_overlap

  def check_date_overlap
    begin
      Booking.where("DATE start_at < ? AND DATE end_at > ?", end_at, start_at).empty?
    rescue Exception => e
      puts "SQL error in #{ __method__ }"
      ActiveRecord::Base.connection.execute 'ROLLBACK'
      raise e
    end
  end

end
