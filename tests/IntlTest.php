<?php

test('The intl extension is loaded', function () {
  expect(extension_loaded('intl'))->toBeTrue();
});

test('the correct currency for a country is used', function ($country, $expected_currency) {
  $formatter = new NumberFormatter($country, NumberFormatter::CURRENCY);
  $actual_currency = $formatter->getTextAttribute(NumberFormatter::CURRENCY_CODE);
  expect($expected_currency)->toBe($actual_currency);
})->with([
  ['de_DE', 'EUR'],
  ['en_US', 'USD'],
  ['ja_JP', 'JPY'],
]);
