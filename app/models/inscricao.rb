class Inscricao < ApplicationRecord
  belongs_to :participante
  belongs_to :minicurso

  validate :disponibilidade_vagas

  after_create do
    InscricaoMailer.realizada(self).deliver_now
  end

  before_destroy do
    InscricaoMailer.cancelada(self).deliver_now
  end

  def disponibilidade_vagas
    unless self.minicurso.tem_vagas?
      errors.add(:base, "Não existem vagas disponíveis")
    end
  end

  def emitir_certificado?
    self.certificado
  end

  def self.emitir_certificados
    self.where(certificado: true)
  end
end
