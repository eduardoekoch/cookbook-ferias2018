require 'rails_helper'

feature 'Visitor search recipe on home_page' do
  scenario 'successfully' do
   #cria os dados necessários, nesse caso não vamos criar dados no banco
   cuisine = Cuisine.create(name: 'Arabe')
   recipe_type = RecipeType.create(name: 'Entrada')
   
   recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio',
                          cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
   
    # simula a ação do usuário
    visit root_path
    fill_in 'Buscar', with: recipe.title
    click_on 'Buscar'

    # expectativas do usuário após a ação
    expect(page).to have_css('h1', text: "Resultado da busca por: #{recipe.title}")
    expect(current_path).to eq(search_path)
    expect(page).to have_css('li', text: recipe.title)
  end

  scenario 'and leave the field blank' do
    cuisine = Cuisine.create(name: 'Arabe')
    recipe_type = RecipeType.create(name: 'Entrada')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio',
                          cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
    
    visit root_path
    fill_in 'Buscar', with: ''
    click_on 'Buscar'

    expect(page).to have_content('Por favor, digite algum filtro de pesquisa.')
  end

end