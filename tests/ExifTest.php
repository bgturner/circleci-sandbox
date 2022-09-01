<?php

test('The exif extension is loaded', function () {
  expect(extension_loaded('exif'))->toBeTrue();
});
