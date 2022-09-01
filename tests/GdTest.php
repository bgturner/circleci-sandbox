<?php

test('The gd extension is loaded', function () {
  expect(extension_loaded('gd'))->toBeTrue();
});
