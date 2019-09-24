require 'yaml/store'

class MovieStore

    def initialize(file_name)
        @store = YAML::Store.new(file_name)
    end

    def save(movie)
        @store.transaction do
            unless movie.id
                #находим максимальный использованный индекс или присваеваем 0, если элемент первый
                # roots - возвращает все ключи хранилища в виде массива
                highest_id = @store.roots.max || 0
                movie.id = highest_id + 1
            end
            @store[movie.id] = movie
        end
        
    end

    #возвразает массив всех объектов из файла
    def all
        @store.transaction do
            @store.roots.map { |id| @store[id]}
        end
    end
end