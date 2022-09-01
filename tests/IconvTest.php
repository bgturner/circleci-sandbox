<?php

test('The iconv extension is loaded', function () {
  expect(extension_loaded('iconv'))->toBeTrue();
});
