# Music CLImax

MusicCLImax is a command-line interface application that lets you store your
favorite playlist and songs. You can **C**reate, **R**ead, **U**pdate, and
**D**elete (CRUD operations) your playlist and the songs inside them. All the
application data is safely stored on a JSON file.

## Happy Path

When you run the `main.rb` file, the program prints a table listing all your
playlists including the ID, the name of the List, its description, and the
number of songs it has. Then, the main menu is printed including the actions:
create, show, update, delete, and exit. Finally, the program prompts the user to
type an action. The information displayed comes from the file `store.json`.

```bash
$ ruby main.rb
+----+-----------------+-------------------------------+---------+
|                          Music CLImax                          |
+----+-----------------+-------------------------------+---------+
| ID | List            | Description                   | #Songs  |
+----+-----------------+-------------------------------+---------+
| 1  | Salsa           | Salsa latina para el mundo    | 3 Songs |
| 2  | Rock en español | Lo mejor del rock de los 80's | 2 Songs |
+----+-----------------+-------------------------------+---------+
create | show ID | update ID | delete ID | exit
> 
```

When the user types `create`, the program asks for a name and description for
the new playlist. Then a new playlist is created, stored on the JSON file, and
the list of playlists and the main menu are printed again.

```bash
> create
Name: K-Pop
Description: The best from Korean superstars
+----+-----------------+---------------------------------+---------+
|                             Music CLImax                         |
+----+-----------------+---------------------------------+---------+
| ID | List            | Description                     | #Songs  |
+----+-----------------+---------------------------------+---------+
| 1  | Salsa           | Salsa latina para el mundo      | 3 Songs |
| 2  | Rock en español | Lo mejor del rock en español    | 2 Songs |
| 3  | K-Pop           | The best from Korean superstars | 0 Songs |
+----+-----------------+---------------------------------+---------+
create | show ID | update ID | delete ID | exit
> 
```

When the user types `update [ID]` where `[ID]` is a valid playlist ID, the
program asks for the updated name and description. If the field is left blank,
the previous value will be preserved.

```bash
> update 3
Name: K-Pop Hits
Description: 
+----+-----------------+---------------------------------+---------+
|                             MusiCLI                              |
+----+-----------------+---------------------------------+---------+
| ID | List            | Description                     | #Songs  |
+----+-----------------+---------------------------------+---------+
| 1  | Salsa           | Salsa latina para el mundo      | 3 Songs |
| 2  | Rock en español | Lo mejor del rock en español    | 2 Songs |
| 3  | K-Pop Hits      | The best from Korean superstars | 0 Songs |
+----+-----------------+---------------------------------+---------+
create | show ID | update ID | delete ID | exit
> 
```

When the user types `delete [ID]` where `[ID]` is a valid playlist ID, the
program will delete the playlist.

```bash
> delete 3
+----+-----------------+------------------------------+---------+
|                         Music CLImax                          |
+----+-----------------+------------------------------+---------+
| ID | List            | Description                  | #Songs  |
+----+-----------------+------------------------------+---------+
| 1  | Salsa           | Salsa latina para el mundo   | 3 Songs |
| 2  | Rock en español | Lo mejor del rock en español | 2 Songs |
+----+-----------------+------------------------------+---------+
create | show ID | update ID | delete ID | exit
> 
```

When the user types `show [ID]` where `[ID]` is a valid playlist ID, the program
prints a table with the list of songs that belongs to the playlist. The table
includes the song ID, title, the artist or artists involved, the name of the
album, and the release year. Below the table, the program prints the song menu
and prompts the user to type an action.

```bash
> show 1
+----+---------------------+-----------------------------+-------------------------+----------+
|                                            Salsa                                            |
+----+---------------------+-----------------------------+-------------------------+----------+
| ID | Title               | Artists                     | Album                   | Released |
+----+---------------------+-----------------------------+-------------------------+----------+
| 1  | Amor narcotico      | Chichi Peralta, Son Familia | Pa' Otro La'o           | 1997     |
| 2  | Que alguien me diga | Gilberto Santa Rosa         | Canciones de Amor       | 2012     |
| 3  | Llorarás            | Oscar de León               | Oscar D' León en México | 1998     |
+----+---------------------+-----------------------------+-------------------------+----------+
create | update ID | delete ID | back
> 
```

When the user types `create`, the program asks for the title, artists, album,
and release date. If more than one artist is involved, the name of the artists
should be separated by a comma. Then a new song is created, stored on the JSON
file, and the playlist songs and the song menu are printed again.

```bash
> create
Title: Pedro Navaja
Artists: Ruben Blades, Willie Colon
Album: Siembra
Released: 1978
+----+---------------------+-----------------------------+-------------------------+----------+
|                                            Salsa                                            |
+----+---------------------+-----------------------------+-------------------------+----------+
| ID | Title               | Artists                     | Album                   | Released |
+----+---------------------+-----------------------------+-------------------------+----------+
| 1  | Amor narcotico      | Chichi Peralta, Son Familia | Pa' Otro La'o           | 1997     |
| 2  | Que alguien me diga | Gilberto Santa Rosa         | Canciones de Amor       | 2012     |
| 3  | Llorarás            | Oscar de León               | Oscar D' León en México | 1998     |
| 6  | Pedro Navaja        | Ruben Blades,  Willie Colon | Siembra                 | 1978     |
+----+---------------------+-----------------------------+-------------------------+----------+
create | update ID | delete ID | back
> 
```

When the user types `update [ID]` where `[ID]` is a valid song ID, the program
asks for the updated fields. If a field is left blank, the previous value will
be preserved.

```bash
> update 6
Title: 
Artists: Rubén Blades, Willie Colón
Album: 
Released: 
+----+---------------------+-----------------------------+-------------------------+----------+
|                                            Salsa                                            |
+----+---------------------+-----------------------------+-------------------------+----------+
| ID | Title               | Artists                     | Album                   | Released |
+----+---------------------+-----------------------------+-------------------------+----------+
| 1  | Amor narcotico      | Chichi Peralta, Son Familia | Pa' Otro La'o           | 1997     |
| 2  | Que alguien me diga | Gilberto Santa Rosa         | Canciones de Amor       | 2012     |
| 3  | Llorarás            | Oscar de León               | Oscar D' León en México | 1998     |
| 6  | Pedro Navaja        | Rubén Blades,  Willie Colón | Siembra                 | 1978     |
+----+---------------------+-----------------------------+-------------------------+----------+
create | update ID | delete ID | back
> 
```

When the user types `delete [ID]` where `[ID]` is a valid song ID, the program
will delete the song.

```bash
> delete 6
+----+---------------------+-----------------------------+-------------------------+----------+
|                                            Salsa                                            |
+----+---------------------+-----------------------------+-------------------------+----------+
| ID | Title               | Artists                     | Album                   | Released |
+----+---------------------+-----------------------------+-------------------------+----------+
| 1  | Amor narcotico      | Chichi Peralta, Son Familia | Pa' Otro La'o           | 1997     |
| 2  | Que alguien me diga | Gilberto Santa Rosa         | Canciones de Amor       | 2012     |
| 3  | Llorarás            | Oscar de León               | Oscar D' León en México | 1998     |
+----+---------------------+-----------------------------+-------------------------+----------+
create | update ID | delete ID | back
> 
```

When the user types `back` the program shows the playlist screen again.

```bash
> back
+----+-----------------+------------------------------+---------+
|                         Music CLImax                          |
+----+-----------------+------------------------------+---------+
| ID | List            | Description                  | #Songs  |
+----+-----------------+------------------------------+---------+
| 1  | Salsa           | Salsa latina para el mundo   | 3 Songs |
| 2  | Rock en español | Lo mejor del rock en español | 2 Songs |
+----+-----------------+------------------------------+---------+
create | show ID | update ID | delete ID | exit
> 
```

Finally, when the user types `exit` the program prints 'Goodbye!' and quits.

```bash
> exit
Goodbye!
$ 
```
