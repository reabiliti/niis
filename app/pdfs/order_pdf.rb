class OrderPdf < Prawn::Document
  def initialize(certificate, setting, proposal)
    super(margin: [0,0,0,0])
    @certificate = certificate
    @setting = setting
    @proposal = proposal
#    bg_setup
    font_setup
    cer_number
  end

  def cer_number
    size = 12
    at_x = set_at_x(59)

    at_x_indent = set_at_x(230)
    at_y = set_at_y(652)
    draw_text @certificate.cert_registration_num, at: [ at_x_indent, at_y ], size: size, style: :bold

    at_x_indent = set_at_x(315)
    at_y = set_at_y(630)
    draw_text (@certificate.cert_registration_date).strftime("%d.%m.%Y"), at: [ at_x_indent, at_y ], size: size, style: :bold

    at_x_indent = set_at_x(443)
    draw_text (@certificate.cert_expiry_date).strftime("%d.%m.%Y"), at: [ at_x_indent, at_y ], size: size, style: :bold

    at_x_indent = set_at_x(229)
    at_y = set_at_y(590)
    draw_text "рег. № #{@setting.set_name}", at: [ at_x_indent, at_y ], size: size, style: :bold

    at_y = set_at_y(584)
    text_box "#{@setting.set_organization}\n#{@setting.set_address}", at: [ at_x, at_y ], size: size, style: :bold


    at_x_indent = set_at_x(140)
    at_y = set_at_y(519)
    draw_text @certificate.cert_name_product, at: [ at_x_indent, at_y ], size: size, style: :bold

    at_y = set_at_y(507)
    draw_text @certificate.cert_manuf_doc, at: [ at_x, at_y ], size: size, style: :bold

    at_y = set_at_y(495)
    draw_text @proposal.prop_applic_from_issue, at: [ at_x, at_y ], size: size, style: :bold

    at_x_indent = set_at_x(480)
    at_y = set_at_y(490)
    draw_text @certificate.cert_code_okp, at: [ at_x_indent, at_y ], size: size, style: :bold

    at_y = set_at_y(410)
    draw_text @certificate.cert_code_tn_ved, at: [ at_x, at_y ], size: size, style: :bold

    at_y = set_at_y(433)
    text_box @certificate.cert_manuf_regulations, at: [ at_x, at_y ], size: size, style: :bold, width: 400

    at_x_indent = set_at_x(159)
    at_y = set_at_y(350)
    if @certificate.cert_manuf_name.split("\r\n").size > 1
      @certificate.cert_manuf_name.split("\r\n", 2).each_with_index do |cert_manuf_name, index|
        index == 0 ? (draw_text cert_manuf_name, at: [at_x_indent, at_y], size: size, style: :bold) :
                     (text_box "#{cert_manuf_name}. ИНН: #{@certificate.cert_manuf_inn}\n" +
                      "#{@certificate.cert_manuf_address}, #{@certificate.cert_manuf_postcode}",
                      at: [at_x, at_y], size: size, style: :bold, width: 500)
        at_y -= 5
      end
    elsif "#{@certificate.cert_manuf_name}. ИНН: #{@certificate.cert_manuf_inn}".length <= 60
      draw_text "#{@certificate.cert_manuf_name}. ИНН: #{@certificate.cert_manuf_inn}",
                at: [ at_x_indent, at_y ], size: size, style: :bold
      at_y -= 5
      text_box "#{@certificate.cert_manuf_address}, #{@certificate.cert_manuf_postcode}",
               at: [at_x, at_y], size: size, style: :bold, width: 500
    else
      draw_text "#{@certificate.cert_manuf_name}.",
                at: [ at_x_indent, at_y ], size: size, style: :bold
      at_y -= 5
      text_box "ИНН: #{@certificate.cert_manuf_inn}\n" +
               "#{@certificate.cert_manuf_address}, #{@certificate.cert_manuf_postcode}",
               at: [at_x, at_y], size: size, style: :bold, width: 500
    end

    at_x_indent = set_at_x(190)
    at_y = set_at_y(299)
    if @proposal.prop_applic_name.split("\r\n, 2").size > 1
      @proposal.prop_applic_name.split("\r\n", 2).each_with_index do |prop_applic_name, index|
        index == 0 ? (draw_text prop_applic_name, at: [ at_x_indent, at_y ], size: size, style: :bold) :
                     (text_box "#{prop_applic_name}. ИНН: #{@proposal.prop_applic_inn}\n" +
                      "#{@proposal.prop_applic_address}, #{@proposal.prop_applic_postcode}" +
                      ", #{@proposal.prop_applic_phone}", at: [ at_x, at_y ], size: size, style: :bold, width: 500)
        at_y -= 5
      end
    elsif "#{@proposal.prop_applic_name}. ИНН: #{@proposal.prop_applic_inn}".length <= 58
      draw_text "#{@proposal.prop_applic_name}. ИНН: #{@proposal.prop_applic_inn}",
                at: [ at_x_indent, at_y ], size: size, style: :bold
      at_y -= 5
      text_box "#{@proposal.prop_applic_address}, #{@proposal.prop_applic_postcode}",
               at: [at_x, at_y], size: size, style: :bold, width: 500
    else
      draw_text "#{@proposal.prop_applic_name}.",
                at: [ at_x_indent, at_y ], size: size, style: :bold
      at_y -= 5
      text_box "ИНН: #{@proposal.prop_applic_inn}\n" +
               "#{@proposal.prop_applic_address}, #{@proposal.prop_applic_postcode}, тел. #{@proposal.prop_applic_phone}",
               at: [at_x, at_y], size: size, style: :bold, width: 500
    end

    at_x_indent = set_at_x(165)
    at_y = set_at_y(247)
    @certificate.cert_test_report.split("\r\n", 2).each_with_index do |test_report, index|
      index == 0 ? (draw_text test_report, at: [ at_x_indent, at_y ], size: size, style: :bold) :
                   (text_box test_report, at: [ at_x, at_y ], size: size, style: :bold, width: 500)
      at_y -= 5
    end

    at_x_indent = set_at_x(276)
    at_y = set_at_y(146)
    draw_text @certificate.cert_add_info, at: [ at_x_indent, at_y ], size: size, style: :bold

    at_y -= 12
    draw_text @certificate.cert_place_marking, at: [ at_x, at_y ], size: size, style: :bold

    at_y -= 12
    draw_text "Схема сертификации " + @proposal.prop_manuf_scheme_cert + ".", at: [ at_x, at_y ], size: size, style: :bold


    at_x_indent = set_at_x(428)
    at_y = set_at_y(85)
    draw_text @certificate.cert_chief_org, at: [ at_x_indent, at_y ], size: size, style: :bold

    at_y = set_at_y(60)
    draw_text @certificate.cert_expert, at: [ at_x_indent, at_y ], size: size, style: :bold

  end

  def bg_setup
    bg = "public/pdf/cert_filled.jpg"
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
