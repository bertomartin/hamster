require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

require 'hamster/list'

describe Hamster::List do

  describe "#each" do

    describe "doesn't run out of stack space on a really big" do

      before do
        @interval = Hamster.interval(0, 10000)
      end

      it "interval" do
        @list = @interval
      end

      it "list" do
        @list = @interval.reduce(Hamster.list) { |list, i| list.cons(i) }
      end

      after do
        @list.each { }
      end

    end

    [
      [],
      ["A"],
      ["A", "B", "C"],
    ].each do |values|

      describe "on #{values.inspect}" do

        before do
          @list = Hamster.list(*values)
        end

        describe "with a block" do

          it "iterates over the items in order" do
            items = []
            @list.each { |value| items << value }
            items.should == values
          end

          it "returns nil" do
            @list.each {}.should be_nil
          end

        end

        describe "without a block" do

          it "returns self" do
            @list.each.should equal(@list)
          end

        end

      end

    end

  end

end
