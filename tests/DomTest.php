<?php

test('The dom extension is loaded', function () {
  expect(extension_loaded('dom'))->toBeTrue();
});
