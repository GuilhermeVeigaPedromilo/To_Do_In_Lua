local sqlite3 = require('lsqlite3')

local db_path = './data/to_do.db'

local db = sqlite3.open(db_path)

return db