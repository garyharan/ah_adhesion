require 'spec_helper'

describe AnswersController do
  let(:question)      { FactoryGirl.create(:question) }
  let(:dossier) { FactoryGirl.create(:dossier) }

  describe "POST 'create'" do
    it "returns http success" do
      expect {
        post 'create', answer: { question_id: question.id, dossier_id: dossier.id, value: true }
        response.should be_success
      }.to change { Answer.count }.by(1)

      assigns(:answer).value.should be_true
      assigns(:answer).should be_persisted
    end

    it "can change the value for an existing answer" do
      answer = Answer.create(question_id: question.id, dossier_id: dossier.id, value: true)

      expect {
        post 'create', answer: { question_id: question.id, dossier_id: dossier.id, value: false }
        response.should be_success
      }.to change { Answer.count }.by(0)

      assigns(:answer).value.should be_false
      assigns(:answer).should be_persisted
    end
  end

  describe "PUT vote" do
    let(:answer) { create :answer }

    it "returns http accepted" do
      put 'vote', id: answer.id
      assigns(:answer).votes.should eq 1
      response.status.should eq 202
    end

    it "does not allow someone to vote again if they have a cookie set" do
      put 'vote', id: answer.id
      assigns(:answer).votes.should eq 1
      put 'vote', id: answer.id
      assigns(:answer).votes.should eq 1
    end
  end

  describe "GET flag" do
    let(:answer) { create :answer }

  end
end
