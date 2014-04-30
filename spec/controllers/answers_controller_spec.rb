require 'spec_helper'

describe AnswersController do

  describe "POST 'create'" do
    let(:question)      { FactoryGirl.create(:question) }
    let(:certification) { FactoryGirl.create(:certification) }

    it "returns http success" do
      expect {
        post 'create', answer: { question_id: question.id, certification_id: certification.id, value: true }
        response.should be_success
      }.to change { Answer.count }.by(1)

      assigns(:answer).value.should be_true
      assigns(:answer).should be_persisted
    end

    it "can change the value for an existing answer" do
      answer = Answer.create(question_id: question.id, certification_id: certification.id, value: true)

      expect {
        post 'create', answer: { question_id: question.id, certification_id: certification.id, value: false }
        response.should be_success
      }.to change { Answer.count }.by(0)

      assigns(:answer).value.should be_false
      assigns(:answer).should be_persisted
    end
  end

end
