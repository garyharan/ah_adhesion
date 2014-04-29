require 'spec_helper'

describe AnswersSearch do
  before do
    @cert = Certification.create
    @a1 = FactoryGirl.create(:answer, question_id: 1, certification_id: @cert.id)
    @a2 = FactoryGirl.create(:answer, question_id: 2, certification_id: @cert.id)
    @a3 = FactoryGirl.create(:answer, question_id: 3, certification_id: @cert.id)
    @a4 = FactoryGirl.create(:answer, question_id: 2, certification_id: @cert.id + 1)
  end

  it "should return a hash of answers" do
    Answer.stub(:where) { [@a1,@a2] }
    AnswersSearch.should_receive(:new).with({1 => @a1, 2 => @a2}, @cert)
    AnswersSearch.for_questions_and_certification(double(collect: []), @cert)
  end

  it "should find the right answers for a given certification and list of questions" do
    answers = AnswersSearch.for_questions_and_certification([double(id: 1), double(id: 2)], @cert)

    answers.answer_for(double(id: 1)).should == @a1
    answers.answer_for(double(id: 2)).should == @a2
  end

  it "should initialize an answer if none were found" do
    answers = AnswersSearch.for_questions_and_certification([double(id: 1), double(id: 2)], @cert)

    answers.answer_for(double(id: 3)).should_not be_nil
  end
end
