<?php

test('The mbstring extension is loaded', function () {
  expect(extension_loaded('mbstring'))->toBeTrue();
});
