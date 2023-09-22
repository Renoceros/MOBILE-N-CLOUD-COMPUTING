void main() {
// Contoh 1: Perulangan dengan iterasi sebanyak 5 kali
for (int i = 0; i < 5; i++) {
print('Iterasi ke-$i');
}
// Contoh 2: Perulangan untuk mengiterasi daftar elemen
List<String> buah = ['Apel', 'Jeruk', 'Pisang', 'Mangga'];
for (String buahItem in buah) {
print('Saya suka $buahItem');
}
// Contoh 3: Perulangan untuk mengiterasi angka dalam rentang
for (int angka in [1, 2, 3, 4, 5]) {
print('Angka: $angka');
}
}