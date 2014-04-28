require 'spec_helper'

describe Question do
  it "should belong to section" do
    s1 = Section.create! section_id: 1, title_fr: "Un"

    q1 = Question.create! section_id: 1, title: "First"
    q2 = Question.create! section_id: 2, title: "Second"

    q1.section.should == s1
    s1.reload.section_questions.all.collect(&:id).should == [q1.id]
  end

  it "should belong to a subsection" do
    s1 = Section.create! subsection_id: 1, title_fr: "Un -- sous-section"

    q1 = Question.create! subsection_id: 1, title: "First"
    q2 = Question.create! subsection_id: 2, title: "Second"

    q1.subsection.should == s1
    s1.reload.subsection_questions.all.collect(&:id).should == [q1.id]
  end
end
