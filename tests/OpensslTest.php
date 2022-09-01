<?php

test('The openssl extension is loaded', function () {
  expect(extension_loaded('openssl'))->toBeTrue();
});
