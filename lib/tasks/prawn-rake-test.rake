require 'open-uri'

namespace :db do
  desc "vanessa tests prawn on heroku"
  task :prawntest => :environment do

        Prawn::Document.new(:page_size => [715, 1072.5]) do |pdf|
          pdf.image open("http://distilleryimage0.s3.amazonaws.com/0ad0616c127e11e3a7ec22000ae904db_5.jpg")
          pdf.render_file('vanessatest.pdf')
          newpdf = File.open('vanessatest.pdf')
          cloudpdf = Cloudinary::Uploader.upload(newpdf)
          img = Image.where(id: 5).first
          img.update_attributes(pdf_image_url: cloudpdf["url"])
        end

  end
end

          # Prawn::Document.new(:page_size => [715, 1072.5]) do |pdf|

    # if Date.today.day == 1

    # end

# http://res.cloudinary.com/dvm/image/upload/v1386098332/qdetwdwtvbvmuqu2yr0y.pdf


# Prawn::Document.new(:page_size => [1800, 1200], :background => "#{Rails.root.to_s}/whiteBG.jpg") do |pdf|
#     pdf.render_file('test4test.pdf')
# end