require 'test_helper'

class ChefTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.new(chefname: 'kevin', email: 'hello@example.com')
  end

  test 'should be valid' do
    assert @chef.valid?
  end

  test 'name should be present' do
    @chef.chefname = " "
    assert_not @chef.valid?
  end

  test 'name should be less than 30 chars' do
    @chef.chefname = 'a'*31
    assert_not @chef.valid?
  end

  test 'email should be present' do
    @chef.email = " "
    assert_not @chef.valid?
  end

  test 'email should not be too long' do
    @chef.email = 'b'*245+'@example.com'
    assert_not @chef.valid?
  end

  test 'email should accept the correct format' do
    valid_emails = %w[user@example.com kevin@gmail.com m.first@yahoo.ca john+smith@co.uk.org]
    valid_emails.each do |valid|
      @chef.email = valid
      assert @chef.valid?, "#{valid.inspect} should be valid"
    end
  end

  test 'should reject invalid addresses' do
    invalid_emails = %w[mashrur@example slkfdj@sf,com sdflkj.sf@sdsdf joe@bar+foo.com]
    invalid_emails.each do |invalid|
      @chef.email = invalid
      assert_not @chef.valid?, "#{invalid.inspect} should be invalid"
    end
  end
end