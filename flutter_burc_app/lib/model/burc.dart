class Burclar {
  final String _burcAdi;
  final String _burcTarihi;
  final String _burcDetayi;
  final String _burcKucukResim;
  final String _burcBuyukResim;
  // Verileri çekiyoruz sağ tık get set diyerek.

  get burcAdi => this._burcAdi;

  get burcTarihi => this._burcTarihi;

  get burcDetayi => this._burcDetayi;

  get burcKucukResim => this._burcKucukResim;

  get burcBuyukResim => this._burcBuyukResim;

  Burclar(this._burcAdi, this._burcTarihi, this._burcDetayi,
      this._burcKucukResim, this._burcBuyukResim);

  // @override
  // String toString() {
  //   return '$_burcAdi, $_burcBuyukResim';
  // }
}
