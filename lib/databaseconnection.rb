require 'pg'

class DatabaseConnection
    
    def self.setup(dbname)
        PG.connect(dbname: dbname)
    end

    def self.query(sql, params = [])
        if ENV['ENVIRONMENT'] == 'test'
            @connection = setup('bookmark_manager_test')
        else
            @conneciton = setup('bookmark_manager')
        end
        @connection.exec_params(sql, params)
    end


end