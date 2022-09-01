<?php

test('The zip extension is loaded', function () {
  expect(extension_loaded('zip'))->toBeTrue();
});
