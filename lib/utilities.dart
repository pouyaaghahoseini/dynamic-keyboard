import "dart:math";

final defaultRowFlex = 250;
final newRowFlex = 300;
final defaultFlex = 100;
final newFlex = 125;
var flexTable = {
  'a': defaultFlex,
  'b': defaultFlex,
  'c': defaultFlex,
  'd': defaultFlex,
  'e': defaultFlex,
  'f': defaultFlex,
  'g': defaultFlex,
  'h': defaultFlex,
  'i': defaultFlex,
  'j': defaultFlex,
  'k': defaultFlex,
  'l': defaultFlex,
  'm': defaultFlex,
  'n': defaultFlex,
  'o': defaultFlex,
  'p': defaultFlex,
  'q': defaultFlex,
  'r': defaultFlex,
  's': defaultFlex,
  't': defaultFlex,
  'u': defaultFlex,
  'v': defaultFlex,
  'w': defaultFlex,
  'x': defaultFlex,
  'y': defaultFlex,
  'z': defaultFlex
};
List rowFlex = [defaultRowFlex, defaultRowFlex, defaultRowFlex, defaultRowFlex];
void resetRowFlex(rowFlex) {
  rowFlex[0] = defaultRowFlex;
  rowFlex[1] = defaultRowFlex;
  rowFlex[2] = defaultRowFlex;
}

void updateFlex(key, flexTable, rowFlex) {
  if (key == 'q') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('u', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
  }
  if (key == 'w') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('a', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('h', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[1] = newRowFlex;
    flexTable.update('i', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('o', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
  } else if (key == 'e') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('n', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[2] = newRowFlex;
    flexTable.update('r', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
    flexTable.update('s', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('d', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[1] = newRowFlex;
  } else if (key == 'r') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('o', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('e', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('i', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
    flexTable.update('a', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('s', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[1] = newRowFlex;
  } else if (key == 't') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('h', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('a', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[1] = newRowFlex;
    flexTable.update('i', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('o', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('e', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
  } else if (key == 'y') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('e', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('o', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('i', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
    flexTable.update('s', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[1] = newRowFlex;
  } else if (key == 'u') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('t', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('r', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
    flexTable.update('s', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('l', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[1] = newRowFlex;
    flexTable.update('n', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[2] = newRowFlex;
  } else if (key == 'i') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('n', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('c', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[2] = newRowFlex;
    flexTable.update('t', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
    flexTable.update('s', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[1] = newRowFlex;
  } else if (key == 'o') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('n', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[2] = newRowFlex;
    flexTable.update('r', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('u', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
    flexTable.update('f', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[1] = newRowFlex;
  } else if (key == 'p') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('a', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('l', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[1] = newRowFlex;
    flexTable.update('r', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('e', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('o', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
  } else if (key == 'a') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('n', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[2] = newRowFlex;
    flexTable.update('r', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('t', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('i', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
    flexTable.update('s', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
  } else if (key == 's') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('e', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('i', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('t', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('o', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
    flexTable.update('h', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
  } else if (key == 'd') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('i', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('e', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('o', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
    flexTable.update('a', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[1] = newRowFlex;
  } else if (key == 'f') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('e', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('i', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('o', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('r', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
  } else if (key == 'g') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('e', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('r', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
    flexTable.update('a', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('h', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[1] = newRowFlex;
  } else if (key == 'h') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('a', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[1] = newRowFlex;
    flexTable.update('e', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('i', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('o', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
  } else if (key == 'j') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('e', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('o', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('u', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
  } else if (key == 'k') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('e', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('i', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
    flexTable.update('s', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[1] = newRowFlex;
  } else if (key == 'l') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('e', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('i', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('y', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
    flexTable.update('a', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[1] = newRowFlex;
  } else if (key == 'z') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('i', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('e', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
    flexTable.update('a', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[1] = newRowFlex;
  } else if (key == 'x') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('e', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('p', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('t', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
  } else if (key == 'c') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('e', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('o', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
    flexTable.update('h', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('a', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[1] = newRowFlex;
  } else if (key == 'v') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('e', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('i', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
    flexTable.update('a', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[1] = newRowFlex;
  } else if (key == 'b') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('y', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('e', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('o', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
    flexTable.update('l', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('a', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[1] = newRowFlex;
  } else if (key == 'n') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('d', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('g', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('s', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[1] = newRowFlex;
    flexTable.update('t', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('e', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
  } else if (key == 'm') {
    flexTable.updateAll((dynamic key, val) => (defaultFlex));
    resetRowFlex(rowFlex);

    flexTable.update('a', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[1] = newRowFlex;
    flexTable.update('e', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('i', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('o', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    flexTable.update('p', (dynamic val) => newFlex,
        ifAbsent: () => defaultFlex);
    rowFlex[0] = newRowFlex;
  }
}

String getRandomElement<String>(List<String> list) {
  final random = new Random();
  var i = random.nextInt(list.length);
  var temp = list[i];
  list.removeAt(i);
  return temp;
}

List words = [
  'watch',
  'fell',
  'the',
  'water',
  'prevailing',
  'wind',
  'from',
  'east',
  'never',
  'too',
  'rich',
  'and',
  'thin',
  'breathing',
  'difficult',
  'can',
  'see',
  'rings',
  'Saturn',
  'physics',
  'chemistry',
  'are',
  'hard',
  'bank',
  'account',
  'overdrawn',
  'elections',
  'bring',
  'out',
  'best',
  'having',
  'spaghetti',
  'time',
  'shopping',
  'problem',
  'with',
  'engine',
  'elephants',
  'afraid',
  'mice',
  'favorite',
  'place',
  'visit',
  'three',
  'two',
  'one',
  'zero',
  'blast',
  'off',
  'subject',
  'psychology',
  'circumstances',
  'unacceptable',
  'for',
  'low',
  'flying',
  'objects',
  'first',
  'you',
  'not',
  'succeed',
  'please',
  'provide',
  'your',
  'date',
  'birth',
  'run',
  'risk',
  'failure',
  'prayer',
  'schools',
  'offends',
  'some',
  'just',
  'like',
  'everyone',
  'else',
  'great',
  'disturbance',
  'force',
  'love',
  'means',
  'many',
  'things',
  'must',
  'getting',
  'old',
  'world',
  'stage',
  'skate',
  'sister',
  'today',
  'neither',
  'borrower',
  'nor',
  'lender',
  'heck',
  'question',
  'that',
  'answered',
  'beware',
  'ides',
  'March',
  'double',
  'toil',
  'trouble',
  'power',
  'denial',
  'agree',
  'say',
  'anything',
  'play',
  'again',
  'Sam',
  'jedi',
  'yet',
  'offer',
  'cannot',
  'refuse',
  'talking',
  'yes',
  'very',
  'smart',
  'all',
  'work',
  'hair',
  'gel',
  'greasy',
  'Valium',
  'economy',
  'size',
  'facts',
  'get',
  'way',
  'dreamers',
  'dreams',
  'did',
  'have',
  'good',
  'space',
  'high',
  'priority',
  'wonderful',
  'example',
  'squander',
  'drink',
  'much',
  'take',
  'coffee',
  'break',
  'popularity',
  'desired',
  'music',
  'better',
  'than',
  'sounds',
  'starlight',
  'dewdrop',
  'living',
  'easy',
  'fish',
  'jumping',
  'cotton',
  'drove',
  'chevy',
  'levee',
  'but',
  'was',
  'dry',
  'took',
  'rover',
  'shop',
  'movie',
  'about',
  'nutty',
  'professor',
  'come',
  'our',
  'new',
  'car',
  'coming',
  'killer',
  'sound',
  'bites',
  'going',
  'lesson',
  'opposing',
  'team',
  'over',
  'there',
  'soon',
  'will',
  'return',
  'city',
  'wearing',
  'tie',
  'jacket',
  'quick',
  'brown',
  'fox',
  'jumped',
  'together',
  'big',
  'pile',
  'wear',
  'crown',
  'jewels',
  'fog',
  'tonight',
  'allergic',
  'bees',
  'peanuts',
  'still',
  'dow',
  'jones',
  'index',
  'has',
  'risen',
  'preferred',
  'treat',
  'chocolate',
  'king',
  'sends',
  'tower',
  'subjects',
  'obey',
  'mom',
  'made',
  'her',
  'turtleneck',
  'goldilocks',
  'bears',
  'went',
  'grocery',
  'assignment',
  'due',
  'what',
  'information',
  'only',
  'quarter',
  'century',
  'store',
  'close',
  'ten',
  'head',
  'shoulders',
  'knees',
  'toes',
  'vanilla',
  'flavored',
  'ice',
  'cream',
  'frequently',
  'asked',
  'questions',
  'round',
  'robin',
  'scheduling',
  'super',
  'highway',
  'web',
  'browser',
  'laser',
  'printer',
  'jammed',
  'boys',
  'deserve',
  'fudge',
  'second',
  'largest',
  'country',
  'call',
  'more',
  'details',
  'party',
  'weekend',
  'video',
  'camera',
  'zoom',
  'lens',
  'monkey',
  'sees',
  'unfortunate',
  'back',
  'yard',
  'house',
  'this',
  'idea',
  'reading',
  'week',
  'here',
  'fax',
  'number',
  'changed',
  'thank',
  'help',
  'exchange',
  'without',
  'bill',
  'early',
  'bird',
  'gets',
  'worm',
  'buckle',
  'safety',
  'handle',
  'protect',
  'environment',
  'population',
  'growing',
  'library',
  'closed',
  'Mary',
  'had',
  'little',
  'lamb',
  'teaching',
  'services',
  'accept',
  'personal',
  'checks',
  'non',
  'profit',
  'organization',
  'user',
  'friendly',
  'interface',
  'healthy',
  'food',
  'hands',
  'experience',
  'job',
  'expensive',
  'postal',
  'service',
  'slow',
  'communicate',
  'through',
  'email',
  'capital',
  'nation',
  'travel',
  'speed',
  'light',
  'fully',
  'gas',
  'bills',
  'sent',
  'monthly',
  'earth',
  'quakes',
  'predictable',
  'life',
  'dream',
  'recycling',
  'depot'
];
