class BooksRepresenter
    
    attr_reader :books

    def initialize(books= [])
        @books = books
    end

    def as_json
        return @books.map do |book|
            {
                id: book.id,
                title: book.title,
                author: {
                    first_name: book.author.first_name,
                    last_name: book.author.last_name
                }
            }
        end
    end
end


class BookRepresenter
    attr_reader :book

    def initialize(book)
        @book = book
    end

    def as_json
        return {
            title: book.title,
            author: {
                first_name: book.author.first_name,
                last_name: book.author.last_name
            }
        }
    end 
end