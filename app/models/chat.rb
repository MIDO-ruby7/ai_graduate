class Chat < ApplicationRecord
  require 'openai'
  require 'dotenv'
  Dotenv.load

  validates :body, presence: true

  after_create :generate_answer

  private

  def generate_answer
    @client = OpenAI::Client.new(access_token: ENV["OPENAI_API_SECRET_KEY"])
    prompt =
    "You are a RUNTEQ alumnus, and you are willing to answer the questions and concerns of current RUNTEQ students.
    When you answer in Japanese, please add だぞ at the end of each word.Please speak Japanese.
    If you need information about life at RUNTEQ or advice about job hunting, please refer to the following sources for answers.
    https://note.com/hbkk/n/n3cb14ae94ed0
    https://note.com/hbkk/n/n3cb14ae94ed0
    https://note.com/hiro266/n/nd7d363e61541
    https://note.com/aiandrox/n/n192d607982f4
    https://note.com/fiahman_uokun/n/n2160b20ec5a1
    https://note.com/_naka_no_mura/n/n76c693a13df4
    https://note.com/maimaitea123/n/n120a164cdb2b
    https://note.com/kosuke1016/n/n4b774ac55aed
    https://note.com/kazuki13070311/n/nb6a7a9ab0457
    https://note.com/taki0/n/nddcebb66a0a2
    https://note.com/kaze0000/n/nd887f6ff1d62
    https://note.com/ogixxx/n/n994aac237457
    https://note.com/jibiking/n/n00bc0a8d56b8
    https://note.com/subaru_hello/n/nc3d65650b426
    https://note.com/sakkkkup/n/nea2873aa01df
    https://note.com/yorutaru/n/n5e8be87dc7a3
    https://note.com/hiiragi_en17/n/na92319ce3ac4
    https://note.com/konjikicity/n/n64442baaa971
    https://note.com/konjikicity/n/n5e3097fdc463
    https://note.com/youliangdao/n/n5e021a5562ae
    https://note.com/tomo701/n/n9d85fae57f05
    https://note.com/youliangdao/n/n12f2141a4615
    https://note.com/29michi/n/n810f8661ca33
    https://note.com/yakukan/n/nf90d3019f1f1
    https://note.com/youliangdao/n/n4fff74c7e4da
    https://note.com/youliangdao/n/n1ea2fcf3309f
    https://note.com/fair_plover581/n/n5011c6b08e7e
    https://note.com/hiiragi_en17/n/na4fa63f915e3
    https://note.com/hiiragi_en17/n/ncd28f1d80bb3
    https://note.com/temba_a/n/nae5f1333b37b
    https://note.com/penguin180/n/nfc8a89817bff
    https://note.com/brainy_oxalis103/n/n37eb046e1447
    https://note.com/momo95843/n/nd9b54cb6bd7c
    https://note.com/ryota_a/n/n4b91688ac260
    https://note.com/engineer_ky/n/nad0ce5c17900
    "

    response = OpenAI::Client.new(
      access_token: ENV['OPENAI_API_SECRET_KEY'],
      model: "gpt-3.5-turbo",
      prompt: prompt + body,
      messages: [{ role: "graduate", content: body }],
      max_tokens: 50,
      temperature: 0.7,
      n: 1,
      stop: "\n"
    ).call.choices.first.text.strip
    binding.pry
    update(answer: response)
  end
end
