class FixCategoriaForeignKey < ActiveRecord::Migration[8.0]
   def change
    # 1. Eliminar la restricción de clave foránea incorrecta
    remove_foreign_key :productos, :categoria rescue nil

    # 2. Eliminar la tabla incorrecta si existe
    drop_table :categoria, if_exists: true

    # 3. Agregar la clave foránea correcta hacia la tabla 'categorias'
    add_foreign_key :productos, :categorias
  end


end
