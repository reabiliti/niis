# print to pDF attachment
class AttachmentPdf < Prawn::Document
  def initialize(attachment, setting, certificate)
    super(margin: [0, 0, 0, 0])
    @attachment = attachment
    @certificate = certificate
    @setting = setting
    # bg_setup
    font_setup
    attach
  end

  def attach
    size = 10
    at_x = at_x_set(345)
    at_y = at_y_set(642)
    draw_text @certificate.cert_registration_num, at: [at_x, at_y], size: size,
                                                  style: :bold
    at_x = at_x_set(48)
    at_y = at_y_set(513)
    text_box @attachment.att_code_okp, at: [at_x, at_y], size: size,
                                       style: :bold, width: 90
    at_x = at_x_set(142)
    at_y = at_y_set(513)
    text = "#{@attachment.att_name_product}\n\n
            ИЗГОТОВИТЕЛЬ: #{@attachment.att_manuf_name}"
    text_box text, at: [at_x, at_y], size: size, style: :bold, width: 205

    at_x = at_x_set(385)
    at_y = at_y_set(513)
    text_box @attachment.att_regulations, at: [at_x, at_y], size: size,
                                          style: :bold, width: 150

    at_x = at_x_set(428)
    at_y = at_y_set(42)
    draw_text @certificate.cert_chief_org, at: [at_x, at_y],
                                           size: size, style: :bold

    at_y = at_y_set(18)
    draw_text @certificate.cert_expert, at: [at_x, at_y],
                                        size: size, style: :bold
  end

  def bg_setup
    bg = 'public/pdf/attach.jpg'
    image bg, at: [0, bounds.height], width: bounds.width, height: bounds.height
  end

  def font_setup
    font_families.update('TimesNewRoman' =>
    {
      normal: 'vendor/assets/fonts/TNRRegular/TimesNewRomanRegular.ttf',
      italic: 'vendor/assets/fonts/TNRItalic/TimesNewRomanItalic.ttf',
      bold: 'vendor/assets/fonts/TNRbold/TimesNewRomanBold.ttf'
    })
    font 'TimesNewRoman'
  end

  private

  def at_x_set(at_x)
    at_x + @setting.set_at_x
  end

  def at_y_set(at_y)
    at_y + @setting.set_at_y
  end
end
