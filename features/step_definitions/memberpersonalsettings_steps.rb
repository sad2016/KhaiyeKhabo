Given(/^I am a member$/) do
  @roletwo = FactoryGirl.create :roletwo
  @user = FactoryGirl.create :member
  @recipe = FactoryGirl.create :recipe, :user_id => @user.id
end