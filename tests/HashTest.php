<?php

test('The hash extension is loaded', function () {
  expect(extension_loaded('hash'))->toBeTrue();
});
