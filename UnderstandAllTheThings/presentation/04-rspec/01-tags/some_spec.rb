describe 'tagged specs' do
  it 'is fast' do
    true.should == true
  end

  it 'is slow', slow: true do
    sleep 2
    true.should == true
  end
end
