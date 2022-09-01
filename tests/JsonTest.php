<?php

test('The json extension is loaded', function () {
  expect(extension_loaded('json'))->toBeTrue();
});
