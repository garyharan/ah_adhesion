require 'spec_helper'

describe Section do
  before do
    @s1   = Section.create! section_id: 1, title_fr: "1"
    @sub2 = Section.create! section_id: 1, subsection_id: 2, title_fr: "1.2"
    @sub1 = Section.create! section_id: 1, subsection_id: 1, title_fr: "1.1"

    @s2   = Section.create! section_id: 2, title_fr: "2"
    @sub3 = Section.create! section_id: 2, subsection_id: 1, title_fr: "2.1"
  end

  it "should have a top_level scope" do
    Section.top_level.should == [@s1, @s2]
  end

  it "should have subsections" do
    @s1.subsections.collect(&:id).should == [@sub1.id, @sub2.id]
    @s2.subsections.collect(&:id).should == [@sub3.id]
  end
end
