require 'spec_helper'

describe Question do
  it "should belong to section" do
    s1 = Section.create! section_id: 1, title_fr: "Un"

    q1 = Question.create! section_id: 1, title: "First"
    q2 = Question.create! section_id: 2, title: "Second"

    q1.section.should == s1
  end
end
