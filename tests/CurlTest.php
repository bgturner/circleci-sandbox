<?php

test('The curl extension is loaded', function () {
  expect(extension_loaded('curl'))->toBeTrue();
});
