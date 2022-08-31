<?php

test('PHP has the JSON extension enabled', function () {
  expect(extension_loaded('json'))->toBeTrue();
});
