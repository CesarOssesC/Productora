class Group < ApplicationRecord
    has_many :concerts, dependent: :destroy
    enum :tipo_grupo, [:Girlband, :Boyband, :Band]


    def conciertos_este_mes
        f = []
        d = self.concerts.map do |c|
            c.fecha.month
        end
        d.each do |date|
            f << date if date == Time.now.month
        end
        f.count
    end
end
