require 'rails_helper'

RSpec.describe Booking, type: :model do
  it { should belong_to(:rental) }
  it { should validate_presence_of(:start_at) }
  it { should validate_presence_of(:end_at) }
  it { should validate_presence_of(:client_email) }
  it { should validate_presence_of(:price) }

  describe 'Date overlapping' do
    let!(:rental) { create(:rental) }

    before do
      create(:booking, start_at: '2018-01-16', end_at: '2018-01-18', rental_id: rental.id)
    end

    context 'when date not overlaps' do

      it 'creates a valid booking in forward' do
        booking = create(:booking, start_at: '2018-01-19', end_at: '2018-01-20', rental_id: rental.id)
        expect(booking).to be_valid
      end

      it 'creates a valid booking in backward' do
        booking = create(:booking, start_at: '2018-01-13', end_at: '2018-01-15', rental_id: rental.id)
        expect(booking).to be_valid
      end

      it 'creates a valid overlapping booking in backward' do
        booking = create(:booking, start_at: '2018-01-14', end_at: '2018-01-16', rental_id: rental.id)
        expect(booking).to be_valid
      end

      it 'creates a valid overlapping booking in forward' do
        booking = create(:booking, start_at: '2018-01-18', end_at: '2018-01-20', rental_id: rental.id)
        expect(booking).to be_valid
      end

    end

    context 'when date overlaps' do

      it 'creates a invalid overlapping booking in forward' do
        booking = create(:booking, start_at: '2018-01-17', end_at: '2018-01-20', rental_id: rental.id)
        expect(booking).not_to be_valid
      end

    end

  end
end
