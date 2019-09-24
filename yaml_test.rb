require 'movie'
require 'yaml/store'

#создание экземпляра класса YAML::Store для работы с файлом test.yml
store = YAML::Store.new('test.yml')

# генерация тестовых данных
first_movie = Movie.new
first_movie.title = "Spirited Away"
first_movie.director = "Hayao Miyazaki"
first_movie.year = 2001

second_movie = Movie.new
second_movie.title = "Inseption"
second_movie.director = "Christopher Nolan"
second_movie.year = 2010

#передача блока с записью и чтением по средствам метода transaction класса YAML::Store
store.transaction do
    store["Spirited Away"] = first_movie
    store["Inseption"] = second_movie

    p store["Inseption"]
end