function onload()

    self.createButton( {
        click_function = 'createBoard',
        function_owner = Global,
        label = 'Start Game',
        position = {-4.20, 0.6, -5.65},
        width = 2250,
        height = 600,
        font_size = 350
    } )

    self.createButton( {
        click_function = 'enableExtension',
        function_owner = Global,
        label = '3 - 4',
        position = {-4.20, 0.6, -1.00},
        width = 2250,
        height = 600,
        font_size = 350
    } )

    self.createButton( {
        click_function = 'randomizeHarbors',
        function_owner = Global,
        label = 'Standard',
        position = {4.20, 0.6, -5.65},
        width = 2250,
        height = 600,
        font_size = 350
    } )

    self.createButton( {
        click_function = 'randomizeChits',
        function_owner = Global,
        label = 'Standard',
        position = {4.20, 0.6, -1.00},
        width = 2250,
        height = 600,
        font_size = 350
    } )

    self.createButton( {
        click_function = 'changeAutoVP',
        function_owner = Global,
        label = 'Enabled',
        position = {4.20, 0.6, 3.50},
        width = 2250,
        height = 600,
        font_size = 350
    } )

    self.createButton( {
        click_function = 'beginnerSetup',
        function_owner = Global,
        label = 'Press for Beginner Setup',
        position = {4.20, 0.6, -7.35},
        width = 3000,
        height = 400,
        font_size = 250
    } )
end
