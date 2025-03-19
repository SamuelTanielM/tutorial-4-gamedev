# Tutorial 4: Basic 2D Level Design

---

## 📌 Identitas
**Nama:** Samuel Taniel Mulyadi
**NPM:** 2206081805

---

## 🏗️ Latihan Mandiri: Membuat Level Baru Dengan TileMap & Obstacle Berbeda

Sebagai bagian dari latihan mandiri, level baru telah dibuat dengan beberapa perubahan dan penambahan fitur dibandingkan level pertama. Berikut adalah daftar fitur yang telah diimplementasikan:

### ✅ **Fitur yang Ditambahkan**
1. **TileMap Baru**
   - Menggunakan tileset **moon** untuk menciptakan suasana berbeda dari level pertama.

2. **Enemy Fish Diganti Menjadi Slime**
   - Jika **pemain menyentuh slime**, maka akan kalah dan kembali ke level tersebut.

3. **Jurang sebagai Rintangan Baru**
   - Jika pemain jatuh ke jurang, **akan muncul lose screen** dan pemain akan kembali ke level tersebut.

4. **Moving Platform**
   - **Platform bergerak** yang bisa digunakan pemain untuk berpindah ke area lain dalam level.

5. **Global Variable untuk Penyimpanan Scene**
   - Sistem ini memungkinkan game untuk **mengingat level saat kalah** dan kembali ke level terakhir yang dimainkan setelah muncul lose screen.

6. **Lose Screen & Win Screen**
   - **Lose Screen:** Muncul jika pemain kalah dan akan mengembalikan pemain ke level terakhir yang dimainkan.
   - **Win Screen:** Muncul di level akhir, dan setelah beberapa detik, pemain akan kembali ke **Level 1** untuk bermain kembali.

> ❗ **Penting:** Implementasi sistem lose & win screen memastikan alur permainan tetap berjalan tanpa harus me-restart game secara manual.

---

## ⚙️ Implementasi Kode

### 🔹 **Area (Checkpoint & Scene Change)**
Kode ini berfungsi untuk menyimpan scene terakhir sebelum berubah ke level lain.
```gdscript
extends Area2D

@export var sceneName: String = "Level1"

func _on_body_entered(body):
    if body.name == "Player":
        Global.set_last_scene(get_tree().current_scene.scene_file_path)
        get_tree().change_scene_to_file("res://scenes/" + sceneName + ".tscn")
```

### 🔹 **Win Screen**
Saat pemain mencapai area kemenangan, game akan menampilkan win screen selama 2 detik sebelum kembali ke Level 1.

```gdscript
extends Node2D

func _ready():
    await get_tree().create_timer(2.0).timeout  # Tunggu 2 detik
    Global.set_last_scene("Level1")
    get_tree().change_scene_to_file("res://scenes/Level1.tscn")

```

### 🔹**Lose Screen**
Jika pemain kalah (baik karena terkena slime atau jatuh ke jurang), mereka akan kembali ke level terakhir yang dimainkan.

```gdscript
extends Node2D

func _ready():
    await get_tree().create_timer(2.0).timeout  # Tunggu 2 detik
    get_tree().change_scene_to_file(Global.get_last_scene())

```

### 🔹 **Moving Platform (Platform Bergerak)**
Platform ini akan bergerak bolak-balik dari posisi awal ke target yang telah ditentukan.

```gdscript
extends Node2D

@export var target_position: Vector2 = Vector2(100, 50)
@export var speed: float = 50.0

var original_position: Vector2
var direction: int = 1

func _ready():
    original_position = position  # Simpan posisi awal

func _process(delta):
    var target = original_position if direction == -1 else target_position
    position = position.move_toward(target, speed * delta)

    if position == target:
        direction *= -1

```

---

## 🎯 Kesimpulan
Level baru telah berhasil dibuat dengan fitur tambahan seperti tileset baru, musuh slime, jurang sebagai rintangan, moving platform, serta lose & win screen. Dengan menggunakan global variable, pemain dapat kembali ke level terakhir setelah kalah, meningkatkan pengalaman bermain yang lebih baik.

> 💡 Saran Pengembangan: Bisa ditambahkan mekanik lain seperti power-up, checkpoint tambahan, atau rintangan dinamis lainnya untuk membuat level lebih menarik.

---

# Tutorial 6: Menu and In-Game Graphical User Interface

## 🏗️ Latihan Mandiri: Implementasi Menu dan GUI dalam Game
Pada tutorial ini, berbagai fitur UI dan menu telah ditambahkan ke dalam game untuk meningkatkan pengalaman bermain. Fitur-fitur ini mencakup layar game over, menu utama, transisi antar level, serta sistem health (hearts) yang memberikan lebih banyak dinamika dalam permainan.

## ✅ Fitur yang Ditambahkan
1. **Layar Game Over**

- Ketika pemain kehabisan 3 hearts, layar Game Over akan muncul.
- Pemain memiliki opsi untuk:
    - Kembali ke menu utama
    - Mengulang level dengan 3 hearts kembali

2. **Select Stage di Main Menu**

- Ditambahkan fitur pemilihan stage di menu utama.
- Pemain dapat langsung memilih level yang ingin dimainkan.

3. **Layar dan Efek Transisi Antar Level**

- Efek transisi antara:
    - Main Menu → Level
    - Level 1 → Level 2
    - Game Over → Main Menu
- Menggunakan efek fade-in dan fade-out agar lebih halus.

4. **Back Button di Tiap Scene yang Membutuhkan**

- Tombol kembali memungkinkan pemain kembali ke menu utama dari berbagai scene.

5. **Layar Win Screen**

- Jika pemain menyelesaikan level terakhir, akan muncul win screen.
- Pemain bisa:
    - Kembali ke menu utama
    - Mengulang dari Level 1

6. **Polishing Main Menu**

- Menu utama diperbarui dengan background baru dan button yang lebih estetis.

7. **Implementasi Sistem Health (Hearts)**

- Ditambahkan UI hearts yang ditempatkan di setiap level.
- Jika pemain terkena obstacle atau musuh, jumlah hearts berkurang.
- Maksimal hearts adalah 3, jika habis → Game Over.

8. **Polishing Button**
- Button jadi bisa dihover dan berubah warna

---

## ⚙️ Implementasi Kode

### 🔹 **MainMenu.gd** implemen hover button dan global value untuk reset hearts serta change scene
hal ini kurang lebih sama untuk win dan losescreen gd
```gdscript
extends Control

@export var bplay_scene_to_load: String
@export var blevel_scene_to_load: String

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.lives = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_b_play_pressed():
	Transition.change_scene_to_file("res://scenes/" + bplay_scene_to_load + ".tscn")

func _on_b_level_pressed():
	Transition.change_scene_to_file("res://scenes/" + blevel_scene_to_load + ".tscn")


func _on_b_play_mouse_entered():
	$MarginContainer/HBoxContainer/VBoxContainer/BPlay.modulate = Color("ddd1ff")


func _on_b_level_mouse_entered():
	$MarginContainer/HBoxContainer/VBoxContainer/BLevel.modulate = Color("ddd1ff")


func _on_b_play_mouse_exited():
	$MarginContainer/HBoxContainer/VBoxContainer/BPlay.modulate = Color("ffffff")


func _on_b_level_mouse_exited():
	$MarginContainer/HBoxContainer/VBoxContainer/BLevel.modulate = Color("ffffff")
```

### 🔹 **AreaTrigger.gd**
disini disesuaikan untuk healthnya tiap level dan cara kembali ke level sebelumnya ketika jatuh atau player interact dengan objek yang mengurangi hearts kecuali 0 masuk losescreen
```gdscript
extends Area2D

@export var sceneName: String = "Level1"
@export var Lives: int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	var current_scene = get_tree().get_current_scene().get_name()
	if body.get_name() == "Player":
		Global.set_last_scene(get_tree().current_scene.scene_file_path)
		if (Lives == 100):
			Global.lives = 3
		else:
			Global.lives += Lives

		if (Global.lives == 0):
			Transition.change_scene_to_file(str("res://scenes/" + "LoseScreen" + ".tscn"))
		else:
			if (sceneName == "CurrentScreen"):
				Transition.change_scene_to_file(Global.get_last_scene())
			else:
				Transition.change_scene_to_file(str("res://scenes/" + sceneName + ".tscn"))
```
