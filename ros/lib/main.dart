import 'package:flutter/material.dart'; // Импортируем библиотеку Flutter

void main() {
  // Главная функция приложения
  runApp(MyApp()); // Запускаем виджет приложения
}

class MyApp extends StatelessWidget {
  // Создаем класс MyApp, который наследуется от StatelessWidget
  @override
  Widget build(BuildContext context) {
    // Функция для построения виджета приложения
    return MaterialApp(
      // Возвращаем MaterialApp, который предоставляет базовые компоненты приложения
      title: '', // Заголовок приложения
      theme: ThemeData(
        // Определяем тему приложения
        primarySwatch: Colors.grey, // Основной цвет
      ),
      home: MyHomePage(), // Устанавливаем домашний виджет (главную страницу)
    );
  }
}

class MyHomePage extends StatefulWidget {
  // Создаем класс MyHomePage, который наследуется от StatefulWidget
  @override
  _MyHomePageState createState() =>
      _MyHomePageState(); // Создаем состояние для виджета
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // Создаем класс состояния для главной страницы
  late TabController _tabController; // Инициализируем контроллер для TabBar
  List<String> selectedCharacters = []; // Создаем список выбранных персонажей

  @override
  void initState() {
    // Инициализируем состояние
    super.initState();
    _tabController = TabController(
        length: 5,
        vsync: this); // Инициализируем контроллер и количество вкладок
  }

  @override
  void dispose() {
    // Уничтожаем состояние
    _tabController.dispose();
    super.dispose();
  }

  void showToast(String message) {
    // Функция для отображения Toast-уведомлений
    ScaffoldMessenger.of(context).showSnackBar(
      // Отображаем уведомление в виде SnackBar
      SnackBar(
        content: Text(message), // Содержание уведомления
        duration: Duration(seconds: 2), // Продолжительность отображения
      ),
    );
  }

  Future<void> showPotterManDialog() async {
    // Функция для отображения диалогового окна с вопросом
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          // Отображаем диалоговое окно
          title: Text('Ты Поттероман?'), // Заголовок диалогового окна
          actions: <Widget>[
            // Действия в диалоговом окне
            TextButton(
              child: Text('Да'), // Кнопка "Да"
              onPressed: () {
                Navigator.of(context).pop(); // Закрываем диалоговое окно
                showToast('Здорово, я тоже!'); // Отображаем уведомление
              },
            ),
            TextButton(
              child: Text('Нет'), // Кнопка "Нет"
              onPressed: () {
                Navigator.of(context).pop(); // Закрываем диалоговое окно
                showToast('Ясно, Магл'); // Отображаем уведомление
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Функция для построения виджета главной страницы
    return Scaffold(
      // Возвращаем виджет Scaffold, который предоставляет основную структуру приложения
      appBar: AppBar(
        // Верхняя панель приложения (appBar)
        title: Text('Practice'), // Заголовок appBar
        bottom: TabBar(
          // Виджет TabBar в appBar
          controller: _tabController, // Используем контроллер для TabBar
          isScrollable: true, // Разрешаем прокрутку вкладок
          tabs: [
            Tab(icon: Icon(Icons.cloud), text: '1'),
            Tab(icon: Icon(Icons.cloud), text: '2'),
            Tab(icon: Icon(Icons.cloud), text: '3'),
            Tab(icon: Icon(Icons.cloud), text: '4'),
            Tab(icon: Icon(Icons.cloud), text: '5'),
          ],
        ),
      ),
      drawer: Drawer(
        // Выдвижное боковое меню (drawer)
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              // Заголовок бокового меню с информацией о пользователе
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.grey,
              ),
              accountName: Text('Zhappas Dauren'),
              accountEmail: Text('RaijinRyū@gmail.com'),
              currentAccountPicture: CircleAvatar(
                // Аватар пользователя
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              // Элемент списка в боковом меню
              title: Text('About'), // Текст элемента
              onTap: () {
                Navigator.pop(
                    context); // Добавьте действие при выборе "Пункт меню 1"
              },
            ),
            ListTile(
              // Элемент списка в боковом меню
              title: Text('Settings'), // Текст элемента
              onTap: () {
                Navigator.pop(
                    context); // Добавьте действие при выборе "Пункт меню 2"
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
        // Содержимое текущей вкладки
        controller: _tabController, // Используем контроллер для TabBarView
        children: [
          Center(
            // Центрируем содержимое
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Кто ваш любимый персонаж?',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                CheckboxListTile(
                  title: Text('Гарри'), // Название персонажа
                  value: selectedCharacters
                      .contains('Гарри'), // Отмечено ли имя в списке
                  onChanged: (bool? value) {
                    // Функция, вызываемая при изменении состояния
                    setState(() {
                      // Обновляем состояние
                      if (value != null) {
                        if (value) {
                          selectedCharacters.add('Гарри'); // Добавляем в список
                        } else {
                          selectedCharacters
                              .remove('Гарри'); // Удаляем из списка
                        }
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Рон'),
                  value: selectedCharacters.contains('Рон'),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value != null) {
                        if (value) {
                          selectedCharacters.add('Рон');
                        } else {
                          selectedCharacters.remove('Рон');
                        }
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Гермиона'),
                  value: selectedCharacters.contains('Гермиона'),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value != null) {
                        if (value) {
                          selectedCharacters.add('Гермиона');
                        } else {
                          selectedCharacters.remove('Гермиона');
                        }
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Настройки',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  // Кнопка "Ты Поттероман?"
                  onPressed: () {
                    showPotterManDialog(); // Вызываем диалоговое окно
                  },
                  child: Text('Ты Поттероман?'),
                ),
              ],
            ),
          ),
          Center(
            child: Card(
              margin: EdgeInsets.all(16.0), // Отступы вокруг
              elevation: 4.0, // Тень
              child: Padding(
                //
                padding: const EdgeInsets.all(16.0), // Отступы внутри
                child: Column(
                  children: [
                    Text(
                      'Контакты',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ListTile(
                      title: Text('Имя: Harry Potter'),
                    ),
                    ListTile(
                      title: Text('Email: potter@gmail.com'),
                    ),
                    ListTile(
                      title: Text('Номер телефона: +1 (123) 456-7890'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
              ),
              itemCount: harryPotterCharacters.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  elevation: 4.0,
                  child: Center(
                    child: Text(
                      harryPotterCharacters[index],
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                );
              },
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16.0),
                Table(
                  border: TableBorder.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                  children: [
                    TableRow(
                      children: [
                        Column(
                          children: [
                            Text('Персонаж 1', style: TextStyle(fontSize: 20.0))
                          ],
                        ),
                        Column(
                          children: [
                            Text('Персонаж 2', style: TextStyle(fontSize: 20.0))
                          ],
                        ),
                      ],
                    ),
                    TableRow(
                      // Строка таблицы
                      children: [
                        Column(
                          children: [
                            Text('Гарри Поттер',
                                style: TextStyle(fontSize: 20.0))
                          ],
                        ),
                        Column(
                          children: [
                            Text('Рон Уизли', style: TextStyle(fontSize: 20.0))
                          ],
                        ),
                      ],
                    ),
                    TableRow(
                      // Строка таблицы
                      children: [
                        Column(
                          children: [
                            Text('Гермиона Грейнджер',
                                style: TextStyle(fontSize: 20.0))
                          ],
                        ),
                        Column(
                          children: [
                            Text('Драко Малфой',
                                style: TextStyle(fontSize: 20.0))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/background_image.jpg'), // Замените 'assets/background_image.jpg' на путь к вашей картинке
                fit:
                    BoxFit.cover, // Подгонять изображение под размер контейнера
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<String> harryPotterCharacters = [
  'Гарри Поттер',
  'Гермиона Грейнджер',
  'Рон Уизли',
  'Драко Малфой',
  'Альбус Дамблдор',
  'Северус Снейп',
  'Сириус Блэк',
];
