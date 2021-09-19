class QuestionMailer < ApplicationMailer
  def creation_email(question, user)
    @question = question
    @user = user
    mail(
      subject: '質問報告メール',
      to: "#{user}@example.com",
      from: 'qaapp@example.com'
    )
  end
end
