class OrderPdf < Prawn::Document
  def initialize(certificate, setting)
    super(margin: [0,0,0,0])
    @certificate = certificate
    @setting = setting
#    bg_setup
    font_setup
    cer_number
  end

  def cer_number

    at_x_first = set_at_x_first(230)
    at_y = set_at_y(652)
    draw_text @certificate.cer_number, :at => [at_x_first,at_y], size: 12, style: :bold

    at_x_first = set_at_x_first(315)
    at_y = set_at_y(630)
    draw_text (@certificate.cer_validity_from).strftime("%d.%m.%Y"), :at => [at_x_first,at_y], size: 12, style: :bold unless @certificate.cer_validity_from.nil?

    at_x_first = set_at_x_first(443)
    draw_text (@certificate.cer_validity_to).strftime("%d.%m.%Y"), :at => [at_x_first,at_y], size: 12, style: :bold unless @certificate.cer_validity_to.nil?

    at_x_first = set_at_x_first(230)
    at_x_other = set_at_x_other(59)
    at_y = set_at_y(590)
    @setting.set_organization.split("\r\n").each_with_index do |sorg, index|
      index == 0 ? (draw_text sorg, :at => [at_x_first, at_y], size: 12, style: :bold) : (draw_text sorg, :at => [at_x_other, at_y], size: 12, style: :bold)
      at_y -= 12
    end

    at_x_first = set_at_x_first(140)
    at_y = set_at_y(519)
    @certificate.cer_product_name.split("\r\n").each_with_index do |cpn, index|
      index == 0 ? (draw_text cpn, :at => [at_x_first, at_y], size: 12, style: :bold) : (draw_text cpn, :at => [at_x_other, at_y], size: 12, style: :bold)
      at_y -= 12
    end

    at_x_first = set_at_x_first(480)
    at_y = set_at_y(490)
    draw_text @certificate.cer_code_okp, :at => [at_x_first,at_y], size: 12, style: :bold

    at_y = set_at_y(410)
    draw_text @certificate.cer_code_tn_ved, :at => [at_x_first,at_y], size: 12, style: :bold

    at_x_first = set_at_x_first(59)
    at_y = set_at_y(425)
    @certificate.cer_regulation.split("\r\n").each do |creg|
      draw_text creg, :at => [at_x_first, at_y], size: 12, style: :bold
      at_y -= 12
    end

    at_x_first = set_at_x_first(159)
    at_y = set_at_y(350)
    @certificate.cer_manufacturer.split("\r\n").each_with_index do |cmnf, index|
      index == 0 ? (draw_text cmnf, :at => [at_x_first, at_y], size: 12, style: :bold) : (draw_text cmnf, :at => [at_x_other, at_y], size: 12, style: :bold)
      at_y -= 12
    end

    at_x_first = set_at_x_first(190)
    at_y = set_at_y(299)
    @certificate.cer_certificate_issued.split("\r\n").each_with_index do |cci, index|
      index == 0 ? (draw_text cci, :at => [at_x_first, at_y], size: 12, style: :bold) : (draw_text cci, :at => [at_x_other, at_y], size: 12, style: :bold)
      at_y -= 12
    end

    at_x_first = set_at_x_first(165)
    at_y = set_at_y(247)
    @certificate.cer_based.split("\r\n").each_with_index do |cbased, index|
      index == 0 ? (draw_text cbased, :at => [at_x_first, at_y], size: 12, style: :bold) : (draw_text cbased, :at => [at_x_other, at_y], size: 12, style: :bold)
      at_y -= 12
    end

    at_x_first = set_at_x_first(276)
    at_y = set_at_y(146)
    @certificate.cer_more_info.split("\r\n").each_with_index do |cmi, index|
      index == 0 ? (draw_text cmi, :at => [at_x_first, at_y], size: 12, style: :bold) : (draw_text cmi, :at => [at_x_other, at_y], size: 12, style: :bold)
      at_y -= 12
    end

    at_x_first = set_at_x_first(428)
    at_y = set_at_y(85)
    draw_text @certificate.cer_org_chief, :at => [at_x_first,at_y], size: 12, style: :bold

    at_y = set_at_y(60)
    draw_text @certificate.cer_org_expert, :at => [at_x_first,at_y], size: 12, style: :bold

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
    def set_at_x_first(at_x_first)
      at_x_first + @setting.set_at_x
    end

    def set_at_x_other(at_x_other)
      at_x_other + @setting.set_at_x
    end

    def set_at_y(at_y)
      at_y + @setting.set_at_y
    end

end
