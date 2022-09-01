<?php

test('The mysqli extension is loaded', function () {
  expect(extension_loaded('mysqli'))->toBeTrue();
});
