class AttachmentPdf < Prawn::Document
  def initialize(attachment, setting, certificate)
    super(margin: [0,0,0,0])
    @attachment = attachment
    @certificate = certificate
    @setting = setting
#    bg_setup
    font_setup
    attach
  end

  def attach
    size = 10

    at_x = set_at_x(345)
    at_y = set_at_y(642)
    draw_text @certificate.cert_registration_num, at: [ at_x, at_y ], size: size, style: :bold

    at_x = set_at_x(48)
    at_y = set_at_y(518)
    text_box @attachment.att_code_okp, at: [ at_x, at_y ], size: size, style: :bold, width: 90

    at_x = set_at_x(142)
    at_y = set_at_y(518)
    text_box "#{@attachment.att_name_product}\n\n ИЗГОТОВИТЕЛЬ: #{@attachment.att_manuf_name}", at: [ at_x, at_y ], size: size, style: :bold, width: 205

    at_x = set_at_x(385)
    at_y = set_at_y(518)
    text_box @attachment.att_regulations, at: [ at_x, at_y ], size: size, style: :bold, width: 150

    at_x = set_at_x(428)
    at_y = set_at_y(70)
    draw_text @certificate.cert_chief_org, at: [ at_x, at_y ], size: size, style: :bold

    at_y = set_at_y(45)
    draw_text @certificate.cert_expert, at: [ at_x, at_y ], size: size, style: :bold

  end

  def bg_setup
    bg = "public/pdf/attach.jpg"
    image bg, at: [ 0, bounds.height ], width: bounds.width, height: bounds.height
  end

  def font_setup
    font_families.update("TimesNewRoman" => {
      :normal => "vendor/assets/fonts/TimesNewRomanRegular/TimesNewRomanRegular.ttf",
      :italic => "vendor/assets/fonts/TimesNewRomanItalic/TimesNewRomanItalic.ttf",
      :bold => "vendor/assets/fonts/TimesNewRomanBold/TimesNewRomanBold.ttf",
    })
    font "TimesNewRoman"
  end

  private
    def set_at_x(at_x)
      at_x + @setting.set_at_x
    end

    def set_at_y(at_y)
      at_y + @setting.set_at_y
    end

end
