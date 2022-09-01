<?php

test('The imagick extension is loaded', function () {
  expect(extension_loaded('imagick'))->toBeTrue();
});
