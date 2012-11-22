require File.expand_path('square_spiral')

describe SquareSpiral do

  context 'is valid input' do
    it 'should return true if square root is perfect' do
      spiral = SquareSpiral.new(9)
      spiral.is_valid_input?.should be_true
    end

    it 'should return false if square root is not perfect' do
      spiral = SquareSpiral.new 10
      spiral.is_valid_input?.should be_false
    end

    it 'should return false if given number is negative' do
      spiral = SquareSpiral.new -1
      spiral.is_valid_input?.should be_false
    end

    it 'should return false if given value is not a number' do
      spiral = SquareSpiral.new 'aaa'
      spiral.is_valid_input?.should be_false
    end

    it 'should return false if given value is nil' do
      spiral = SquareSpiral.new nil
      spiral.is_valid_input?.should be_false
    end
  end

  context 'create spiral' do
    it 'should create a spiral' do
      spiral = SquareSpiral.new 4
      grid = spiral.create
      grid[0][0].should == 4
      grid[0][1].should == 3
      grid[1][1].should == 2
      grid[1][0].should == 1
    end

    it 'should create a spiral' do
      spiral = SquareSpiral.new 16
      grid = spiral.create
      grid[0][0].should == 16
      grid[0][1].should == 15
      grid[0][2].should == 14
      grid[0][3].should == 13
      grid[1][3].should == 12
      grid[1][2].should == 3
      grid[1][1].should == 4
      grid[1][0].should == 5
      grid[2][0].should == 6
      grid[2][1].should == 1
      grid[2][2].should == 2
      grid[2][3].should == 11
      grid[3][3].should == 10
      grid[3][2].should == 9
      grid[3][1].should == 8
      grid[3][0].should == 7
    end
  end

end

