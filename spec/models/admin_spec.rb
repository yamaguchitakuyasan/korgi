require 'rails_helper'

RSpec.describe Admin, type: :model do
  before do
    @admin = build(:admin)
  end

  describe 'バリデーション' do
    it 'emailとpasswordどちらも値が設定されていれば、OK' do
      expect(@admin.valid?).to eq(true)
    end

    it 'emailが空だとNG' do
      @admin.email = ''
      expect(@admin.valid?).to eq(false)
    end

    it 'passwordが空だとNG' do
    	@admin.password =''
    	expect(@admin.valid?).to eq(false)
    end
  end
end