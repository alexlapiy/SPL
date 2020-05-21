# ReasonML
#### Reason является лишь синтаксисом, который позволяет вам писать простой, быстрый и качественный безопасный код, используя экосистемы JavaScript и OCaml. OCaml в свою очередь объектно-ориентированный язык функционального программирования общего назначения. Поддерживает функциональную, императивную и объектно-ориентированную парадигмы программирования.
Веб-сайт ReasonML содержит [онлайн-площадку](https://reasonml.github.io/en/try.html?rrjsx=true&reason=C4TwDgpgBMBOHQLxQDIQIYDMoB8oDkB7AEwgAoBLAO2ABoZ4J64EBKAbgChOAbCYKPADGUAM4BXALZRklYBEmsZAPigBvTlDEB3CsCEALKHIVKNWvGiwqoABk24CJcgDd0PcUyh9MdQRQBzA2AlRFU3D2gAajEpMh8QqBiJSTJYQOCOBwBfTmyuXn4oSRAAFUYZByJSMgctAEZaOqcagCZ6avIAFnorTF6MTFYO5zIANgGsSaHh5s6yAGYRmoBWaenhlvIAdnXUQdZWByzOAClRADoeQgCyFLIS8rYOIA) , которая очень полезна для наблюдения за тем, как работает язык и как выглядит код JavaScript и OCaml. Он также может конвертировать из OCaml в ReasonML.

Фича | Reason | Вывод javaScript
------------ | ------------- | -------------
String | "Hello" | "Hello"
Character | 'x' | "x"
Integer | 23, -23 | 23, -23
Сложение Float | 23.0 +. 1.0 | 23.0 + 1.0
Возведение Float | 2.0 ** 3.0 | Math.pow(3, 4)
List | [1, 2, 3] | [1, [2, [3, 0]]]
Array | [1, 2, 3] | [1, 2, 3]
Конкатенация строк | "Hello " ++ "world!" | "Hello " + "World"

## Let binding

«Привязка let» в других языках может называться «объявлением переменной». let привязывает значения к именам. На на них может ссылаться код, который идет после них.
Привязка let преобразуется в обычное объявление переменной JavaScript.

**ReasonML** 
```javascript
let greeting = "hello!";
let score = 10;
let newScore = 10 + score;
```
**Вывод Js**
```javascript
var greeting = "hello!";
var score = 10;
var newScore = 20;
```

## Type!
Типы - важная часть Reason! Введем синтаксис типов, так чтобы можно было переходить по следующим разделам, не путаясь.

Вы можете заключить любое выражение в скобки и аннотировать его:

**ReasonML**
```javascript
let myInt1 = 5;
let myInt2: int = 5;
let myInt3 = (5: int) + (4: int);
let add = (x: int, y: int): int => x + y;
let drawCircle = (~radius as r: int) : string => "hi";
```
**Вывод JS**
```javascript
var myInt1 = 5;
var myInt2 = 5;
var myInt3 = 9;
function addInts(x, y) {
  return x + y | 0;
}
function drawCircle(r) {
  return "hi";
}
```
Вы можете ссылаться на тип под другим именем. Они будут эквивалентны:

**ReasonML**
```javascript
type scoreType = int;
let x: scoreType = 10;
```
**Вывод JS**
```javascript
var score = 10;
```

## Кортеж (Tuple)
Кортежи похожи на массивы JavaScript:
  * упорядоченная коллекция объектов
  * компилируются в массивы JavaScript
Но в Reason они тем не менее отличаются от массивов в JS. Они:
  * незименные (immutable)
  *фиксированного размера во время создания
  *может содержать разные типы значений

__Пример:__
**ReasonML**
```javascript
let my3dCoordinates = (20.0, 30.5, 100.0);
let (_, y, _) = my3dCoordinates; /* теперь мы получили у */
```
**Вывод JS**
```javascript
var my3dCoordinates = /* tuple */[20.0, 30.5, 100.0];
var y = 30.5;
```

## Вариант (Variant!)

Большинство структур данных в большинстве языков относятся к «этому и тому». Вариант позволяет нам выразить «то или иное».
```javascript
type myResponseVariant =
  | Yes
  | No
  | PrettyMuch;

let areYouCrushingIt = Yes;
```
Yes, No и PrettyMuch не строки, ни ссылки, ни какие-то специальный типа данных. Они называются "конструкторами" (или "тэг"). Данный символ | отделяет все конструкторы.
__Пример:__
Наряду с variant приходит одна из самых важных особенностей Reason, выражение switch.

```javascript
let message =
  switch (areYouCrushingIt) {
  | No => "No worries. Keep going!"
  | Yes => "Great!"
  | PrettyMuch => "Nice!"
  };
/* message будет содержать "Great!" */
```

## Функии
Функции объявляются со стрелкой и возвращают выражение.

```javascript
/* Анонимные функции. */
(x) => (y) => 1;
/* аналог */
(x, y) => 1;
/* присвоение имени */
let add = (x, y) => 1;

/* В OCaml / Reason вы можете прикрепить метки к аргументу, поставив перед именем префикс символом ~.
   Для того, чтобы не путаться аргументы в мультиаргументных функциях*/
let add = (~first as x, ~second as y) => x + y;
/* аналог */
let add = (~first, ~second) => first + second;

/* лейблированные функции с значением по умолчанию. */
let add = (~first as x=1, ~second as y=2) => x + y;
/* аналог */
let add = (~first=1, ~second=2) => first + second;

/* опционно */
let add = (~first as x=?, ~second as y=?) => switch (x) {...};
/* аналог */
let add = (~first=?, ~second=?) => switch (first) {...};
```
