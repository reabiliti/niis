# frozen_string_literal: true

# Print to pdf certificate
class CertificatePdf < Prawn::Document
  def initialize(certificate, setting, proposal)
    super(page_size: 'A4', margin: [0, 0, 0, 0])
    @certificate = certificate
    @setting = setting
    @proposal = proposal
    # bg_setup
    font_setup
    cer_number
  end

  def cer_number
    size = 12
    at_x = at_x_set(46)

    at_x_indent = at_x_set(218)
    at_y = at_y_set(689)
    draw_text @certificate.cert_registration_num, at: [at_x_indent, at_y], size: size, style: :bold

    at_x_indent = at_x_set(313)
    at_y = at_y_set(665)
    text = @certificate.cert_registration_date.strftime('%d.%m.%Y')
    draw_text text, at: [at_x_indent, at_y], size: size, style: :bold

    text = @certificate.cert_expiry_date.strftime('%d.%m.%Y')
    at_x_indent = at_x_set(438)
    draw_text text, at: [at_x_indent, at_y], size: size, style: :bold

    at_x_indent = at_x_set(230)
    at_y = at_y_set(625)
    text = "рег. № #{@setting.set_os_registration_num}"
    draw_text text, at: [at_x_indent, at_y], size: size, style: :bold

    at_y = at_y_set(620)
    text = "#{@setting.set_os_name.gsub 'ОРГАН ПО СЕРТИФИКАЦИИ ', ''}\n #{@setting.set_os_address}"
    text_box text, at: [at_x, at_y], size: size, style: :bold, width: 450

    at_x_indent = at_x_set(135)
    at_y = at_y_set(548)
    if @certificate.cert_name_product.split("\r\n").length > 1
      @certificate.cert_name_product.split("\r\n").each_with_index do |cert_name_product, index|
        if index.zero?
          draw_text cert_name_product, at: [at_x_indent, at_y], size: size, style: :bold
        else
          draw_text cert_name_product, at: [at_x, at_y], size: size, style: :bold
        end
        at_y -= 12
      end
    else
      draw_text @certificate.cert_name_product, at: [at_x_indent, at_y], size: size, style: :bold
      at_y -= 12
    end

    draw_text @certificate.cert_manuf_doc, at: [at_x, at_y], size: size, style: :bold

    at_y -= 12
    draw_text @proposal.prop_applic_from_issue, at: [at_x, at_y], size: size, style: :bold

    at_y = at_y_set(455)
    text_box @certificate.cert_manuf_regulations, at: [at_x, at_y], size: size, style: :bold, width: 400

    at_x_indent = at_x_set(470)
    at_y = at_y_set(510)
    draw_text @certificate.cert_code_okp, at: [at_x_indent, at_y], size: size, style: :bold

    at_y = at_y_set(420)
    draw_text @certificate.cert_code_tn_ved, at: [at_x_indent, at_y], size: size, style: :bold

    at_x_indent = at_x_set(158)
    at_y = at_y_set(367)
    if @certificate.cert_manuf_name.split("\r\n").size > 1
      @certificate.cert_manuf_name.split("\r\n", 2).each_with_index do |cert_manuf_name, index|
        if index.zero?
          draw_text cert_manuf_name, at: [at_x_indent, at_y], size: size, style: :bold
        else
          text = "#{cert_manuf_name}. ИНН: #{@certificate.cert_manuf_inn}\n #{@certificate.cert_manuf_address}, #{@certificate.cert_manuf_postcode}"
          text_box text, at: [at_x, at_y], size: size, style: :bold, width: 520
        end
        at_y -= 5
      end
    elsif "#{@certificate.cert_manuf_name}. ИНН: #{@certificate.cert_manuf_inn}".length <= 60
      text = "#{@certificate.cert_manuf_name}. ИНН: #{@certificate.cert_manuf_inn}"
      draw_text text, at: [at_x_indent, at_y], size: size, style: :bold
      at_y -= 5
      text = "#{@certificate.cert_manuf_address}, #{@certificate.cert_manuf_postcode}"
      text_box text, at: [at_x, at_y], size: size, style: :bold, width: 520
    else
      draw_text "#{@certificate.cert_manuf_name}.",
                at: [at_x_indent, at_y], size: size, style: :bold
      at_y -= 5
      text = "ИНН: #{@certificate.cert_manuf_inn}\n #{@certificate.cert_manuf_address}, #{@certificate.cert_manuf_postcode}"
      text_box text, at: [at_x, at_y], size: size, style: :bold, width: 520
    end

    at_x_indent = at_x_set(185)
    at_y = at_y_set(313)
    if @certificate.cert_applic_name.split("\r\n", 2).size > 1
      @certificate.cert_applic_name.split("\r\n", 2).each_with_index do |prop_applic_name, index|
        if index.zero?
          draw_text prop_applic_name, at: [at_x_indent, at_y], size: size, style: :bold
        else
          text = "#{prop_applic_name}. ИНН: #{@certificate.cert_applic_inn}\n #{@certificate.cert_applic_address}, #{@certificate.cert_applic_postcode}"
          text += ", тел. #{@certificate.cert_applic_phone}" if @certificate.cert_applic_phone.present?
          text_box text, at: [at_x, at_y], size: size, style: :bold, width: 520
        end
        at_y -= 5
      end
    elsif "#{@certificate.cert_applic_name}. ИНН: #{@certificate.cert_applic_inn}".length <= 58
      text = "#{@certificate.cert_applic_name}. ИНН: #{@certificate.cert_applic_inn}"
      draw_text text, at: [at_x_indent, at_y], size: size, style: :bold
      at_y -= 5
      text = "#{@certificate.cert_applic_address}, #{@certificate.cert_applic_postcode}"
      text += ", тел. #{@certificate.cert_applic_phone}" if @certificate.cert_applic_phone.present?
      text_box text, at: [at_x, at_y], size: size, style: :bold, width: 520
    else
      draw_text "#{@certificate.cert_applic_name}.", at: [at_x_indent, at_y],
                                                     size: size, style: :bold
      at_y -= 5
      text = "ИНН: #{@certificate.cert_applic_inn}\n #{@certificate.cert_applic_address}, #{@certificate.cert_applic_postcode}"
      text += ", тел. #{@certificate.cert_applic_phone}" if @certificate.cert_applic_phone.present?
      text_box text, at: [at_x, at_y], size: size, style: :bold, width: 520
    end

    at_x_indent = at_x_set(160)
    at_y = at_y_set(257)
    @certificate.cert_test_report.split("\r\n", 2).each_with_index do |test_report, index|
      if index.zero?
        draw_text test_report, at: [at_x_indent, at_y], size: size, style: :bold
      else
        text_box test_report, at: [at_x, at_y], size: size, style: :bold, width: 520
      end
      at_y -= 5
    end

    at_x_indent = at_x_set(274)
    at_y = at_y_set(150)
    @certificate.cert_add_info.split("\r\n", 2).each_with_index do |cert_add_info, index|
      if index.zero?
        draw_text cert_add_info, at: [at_x_indent, at_y], size: size, style: :bold
        at_y -= 5
      else
        text = "#{cert_add_info}\n#{@certificate.cert_place_marking}\nСхема сертификации #{@proposal.prop_manuf_scheme_cert}"
        text_box text, at: [at_x, at_y], size: size, style: :bold, width: 520
      end
    end

    at_x_indent = at_x_set(428)
    at_y = at_y_set(96)
    draw_text @certificate.cert_chief_org, at: [at_x_indent, at_y], size: size, style: :bold

    at_y = at_y_set(68)
    draw_text @certificate.cert_expert, at: [at_x_indent, at_y], size: size, style: :bold
  end

  def bg_setup
    bg = 'public/pdf/cert_clean.jpg'
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
