import 'package:adviceat/src/controller/api/getKategori.dart';
import 'package:adviceat/src/controller/api/getMalzeme.dart';
import 'package:adviceat/src/controller/api/yemekGetir.dart';
import 'package:adviceat/src/module/recipe/recipe_presenter.dart';

import 'src/routes.dart';

void main() async {
  await RecipeViewModel.load();
  await YemekJson.load(secim: 0);
  await KategoriJson.load();
  await MalzemeJson.load();
  new Routes();
}

