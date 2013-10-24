require 'spec_helper'

describe "Base model as superclass" do
  class ChildModel < PostJson::Collection["children"]
    def name=(value)
      super(value.to_s.upcase)
    end
  end

  subject { ChildModel }

  its(:collection_name) { should == "children" }

  context "document" do
    let(:name) { "jacob" }
    subject { ChildModel.create(name: name) }
    its(:name) { should == name.upcase }
  end

  context "inspect" do
    subject { ChildModel.create(number: 1234) }
    its(:inspect) { should == "#<#{subject.class.name} #{subject.attributes.map{ |k, v| "#{k}: #{v.inspect}" }.join(", ")}>" }
  end
end
