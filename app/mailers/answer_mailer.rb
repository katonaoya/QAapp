class AnswerMailer < ApplicationMailer
  def creation_email(answer, user)
    @answer = answer
    @user = user
    mail(
      subject: '回答報告メール',
      to: "#{user}@example.com",
      from: 'qaapp@example.com'
    )
  end
end
