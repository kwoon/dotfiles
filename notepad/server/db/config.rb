require 'sequel'

DB = Sequel.postgres 'example', 
    user:            'postgres', 
    password:        'postgres',
    host:            'localhost',
    port:            5432,
    max_connections: 10
