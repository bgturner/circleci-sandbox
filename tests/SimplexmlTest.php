<?php

test('The simplexml extension is loaded', function () {
  expect(extension_loaded('simplexml'))->toBeTrue();
});
